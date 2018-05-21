package co.kr.math_formulas;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import model.dto.BoardDto;

@Controller
public class ListController {
	@Autowired
	private SqlSession sqlSession; //자동 setter작업
	
		@RequestMapping("/list.do")
		public String list(String pageNum,Model model) throws NamingException,IOException {
			
			if(pageNum==null){
				pageNum="1";
			}
			
			//이부분을 넘겨줘야 하므로..map에 넣어서 넘겨준다.
			int pageSize=10;//한페이지의 글 갯수
			int currentPage=Integer.parseInt(pageNum);//현재페이지
			int startRow=(currentPage-1)*pageSize+1;//한페이지의 시작
			int endRow=currentPage*pageSize;//한페이지의 마지막 글번호
			int number=0; //글번호처리하려고 
			int pageBlock=10;
			int count=0; //페이지 총 갯수
			
			//실제넘어가는부분은...
			HashMap<String,Integer> map=new HashMap<String,Integer>();
			map.put("currentPage",Integer.parseInt(pageNum));
			
			System.out.println("currentpage"+currentPage);

			count=sqlSession.selectOne("board.getArticleCount");
			map.put("count",count);
			
			map.put("pageCount",count/pageSize+(count%pageSize==0?0:1)); 
			map.put("pageBlock",10);

			
			System.out.println("글갯수count   "+count);
			System.out.println("startRow,end"+startRow+endRow);
			
			number=count-(currentPage-1)*pageSize;//글목록에서 표시할 글번호
			System.out.println("number"+number);
			map.put("startRow", startRow-1);
			map.put("endRow",endRow);
			map.put("number",number);

			List<HashMap<String,String>> articleList=null;
			if(count>0){//글이 존재하면
				articleList=sqlSession.selectList("board.getList",map);
				System.out.println("articleList"+articleList);
				
			}else{//글이없으면-이렇게해야 jsp에서 있냐없냐로체크가능..
				articleList=Collections.emptyList();
			}
			

			model.addAttribute("articleList",articleList);
			model.addAttribute("map",map);
			model.addAttribute("number",number);
			
			/*나는 아래의 애들을 map에 넣어서 list.jsp에서 map.으로 처리했고, 선생님은 아래처럼 따로따로넣어서 list에서바로씀.
			model.addAttribute("count",count);
			model.addAttribute("startRow",startRow);
			model.addAttribute("endRow",endRow);
			model.addAttribute("pageSize",pageSize);
			*/
			
			return ".main.board.list";
		}
		
		//글쓰기페이지이동==========================================================================================
		@RequestMapping("/writeForm.do")
		public String writeForm(Model model,String pageNum, String num,String ref,String re_step,String re_level) {//getparameter대신 인수를 넣는다. 
			
			if(num==null) {
				num="0";
				ref="1";
				re_step="0";
				re_level="0"; //글번호,답글
			}
			
			model.addAttribute("num",num);
			model.addAttribute("ref",ref);
			model.addAttribute("re_step",re_step);
			model.addAttribute("re_level",re_level);
			model.addAttribute("pageNum",pageNum);
			
			return ".main.board.writeForm";
		}
		

		//글쓰기폼 저장=============================================================================================
		@RequestMapping(value="/writePro.do",method=RequestMethod.POST)
		public String userWritePro(@ModelAttribute("boardDto") BoardDto boardDto,HttpServletRequest request,String pageNum,String ref,String re_step,String re_level,String num) throws NamingException,IOException{

			String ip=request.getRemoteAddr(); //ip구함 -이거중요!!!

			boardDto.setIp(ip); //HttpServletRequest request이걸해야 ip주소를 구할 수 있다.

			int maxNum=0;
			if(sqlSession.selectOne("board.maxNum",Integer.parseInt(num))!=null) {
				maxNum=sqlSession.selectOne("board.maxNum",Integer.parseInt(num));
			}

			if(maxNum!=0) { //최대글번호가 0이아니면
				maxNum=maxNum+1;//최대글번호+1로 글작성
			}else {
				maxNum=1; //글번호 1부터작성
			}
		
			if(Integer.parseInt(num)!=0) {//답변글이면
				//답글끼어넣을위치확보
				sqlSession.update("board.reStep",num);
				boardDto.setRe_step(boardDto.getRe_step()+1); //글순서
				boardDto.setRe_level(boardDto.getRe_level()+1);//글깊이
				
			}else {//원글
				boardDto.setRef(new Integer(maxNum));//글 그룹번호
				boardDto.setRe_step(new Integer(0));//글순서0
				boardDto.setRe_level(new Integer(0));//글깊이 0
				
			}
		
	     sqlSession.insert("board.insertArticle",boardDto); 
			return "redirect:list.do";
		}
		
		

		@RequestMapping("/content.do")
		public String content(String num,String pageNum,Model model) throws NamingException,IOException {
			
			//조회수증가
			sqlSession.update("board.plusReadcount",Integer.parseInt(num));
			
			BoardDto boardDto=(BoardDto)sqlSession.selectOne("board.getArticle",Integer.parseInt(num));
			
			model.addAttribute("boardDto", boardDto);
			model.addAttribute("pageNum",pageNum);
			
			return ".main.board.content";

			}
		
		//글수정===========================================================================================================
			@RequestMapping(value="/edit.do", method=RequestMethod.GET)
			public ModelAndView userEdit(String num,String msg,Model model) { //Content.jsp 에서 글수정갈 때, <a href="edit.do?num=${boardDto.num}">이렇게 num parameter값이 넘어가서 그걸받음. 
				
				System.out.println(num);
				System.out.println(msg);
				if(msg==null) {
					model.addAttribute("msg",msg);
				}
				
				BoardDto boardDto=(BoardDto)sqlSession.selectOne("board.getArticle",Integer.parseInt(num));

				
				return new ModelAndView(".main.board.edit","boardDto",boardDto);
				//					     edit.jsp . key    .value
			}
			
			//글수정insert===========================================================================================================
			@RequestMapping(value="/edit.do",method=RequestMethod.POST)
			public String updateBoard(@ModelAttribute("boardDto") BoardDto boardDto,String num,String inputpwd,Model model) throws NamingException,IOException{
				
				String dbpwd=sqlSession.selectOne("board.findpwd",num); //DBpwd를 찾는다 - 아래에서 비교를 위해 
				if(inputpwd.equals(dbpwd)){
					sqlSession.update("board.updateBoard",boardDto);	
				}else {
					System.out.println("200번라인 실행?");
					model.addAttribute("msg","oppps, wrong password ;-(");
					model.addAttribute("num",num);
					 return ".main.board.edit";
				}
				return "redirect:list.do";
			}
			
			
			//글삭제================================================================================================================
			@RequestMapping("/delete.do")
			public String deleteBoard(String num,String msg,Model model) throws NamingException,IOException{
				
				if(msg==null) {
					model.addAttribute("msg",msg);
					model.addAttribute("num",num);
				}
				return ".main.board.delete";
//				return "redirect:list.do";
			}
			
			@RequestMapping(value="delete.do",method=RequestMethod.POST)
			public String deleteBoardPro(String num,String inputpwd,Model model) throws NamingException,IOException{
				System.out.println("num"+num);
				String dbpwd=sqlSession.selectOne("board.findpwd",num);
				System.out.println("inputpwd+dbpwd"+inputpwd+dbpwd);
				if(inputpwd.equals(dbpwd)) {
					sqlSession.delete("board.deleteArticle",Integer.parseInt(num));
				}else {
						model.addAttribute("num",num);
						model.addAttribute("msg","oppps, wrong password ;-(");
						return ".main.board.delete";
				}
				return "redirect:list.do";
			}
			
			
		
}
