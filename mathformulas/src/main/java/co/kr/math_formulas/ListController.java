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
	private SqlSession sqlSession; //�ڵ� setter�۾�
	
		@RequestMapping("/list.do")
		public String list(String pageNum,Model model) throws NamingException,IOException {
			
			if(pageNum==null){
				pageNum="1";
			}
			
			//�̺κ��� �Ѱ���� �ϹǷ�..map�� �־ �Ѱ��ش�.
			int pageSize=10;//���������� �� ����
			int currentPage=Integer.parseInt(pageNum);//����������
			int startRow=(currentPage-1)*pageSize+1;//���������� ����
			int endRow=currentPage*pageSize;//���������� ������ �۹�ȣ
			int number=0; //�۹�ȣó���Ϸ��� 
			int pageBlock=10;
			int count=0; //������ �� ����
			
			//�����Ѿ�ºκ���...
			HashMap<String,Integer> map=new HashMap<String,Integer>();
			map.put("currentPage",Integer.parseInt(pageNum));
			
			System.out.println("currentpage"+currentPage);

			count=sqlSession.selectOne("board.getArticleCount");
			map.put("count",count);
			
			map.put("pageCount",count/pageSize+(count%pageSize==0?0:1)); 
			map.put("pageBlock",10);

			
			System.out.println("�۰���count   "+count);
			System.out.println("startRow,end"+startRow+endRow);
			
			number=count-(currentPage-1)*pageSize;//�۸�Ͽ��� ǥ���� �۹�ȣ
			System.out.println("number"+number);
			map.put("startRow", startRow-1);
			map.put("endRow",endRow);
			map.put("number",number);

			List<HashMap<String,String>> articleList=null;
			if(count>0){//���� �����ϸ�
				articleList=sqlSession.selectList("board.getList",map);
				System.out.println("articleList"+articleList);
				
			}else{//���̾�����-�̷����ؾ� jsp���� �ֳľ��ķ�üũ����..
				articleList=Collections.emptyList();
			}
			

			model.addAttribute("articleList",articleList);
			model.addAttribute("map",map);
			model.addAttribute("number",number);
			
			/*���� �Ʒ��� �ֵ��� map�� �־ list.jsp���� map.���� ó���߰�, �������� �Ʒ�ó�� ���ε��γ־ list�����ٷξ�.
			model.addAttribute("count",count);
			model.addAttribute("startRow",startRow);
			model.addAttribute("endRow",endRow);
			model.addAttribute("pageSize",pageSize);
			*/
			
			return ".main.board.list";
		}
		
		//�۾����������̵�==========================================================================================
		@RequestMapping("/writeForm.do")
		public String writeForm(Model model,String pageNum, String num,String ref,String re_step,String re_level) {//getparameter��� �μ��� �ִ´�. 
			
			if(num==null) {
				num="0";
				ref="1";
				re_step="0";
				re_level="0"; //�۹�ȣ,���
			}
			
			model.addAttribute("num",num);
			model.addAttribute("ref",ref);
			model.addAttribute("re_step",re_step);
			model.addAttribute("re_level",re_level);
			model.addAttribute("pageNum",pageNum);
			
			return ".main.board.writeForm";
		}
		

		//�۾����� ����=============================================================================================
		@RequestMapping(value="/writePro.do",method=RequestMethod.POST)
		public String userWritePro(@ModelAttribute("boardDto") BoardDto boardDto,HttpServletRequest request,String pageNum,String ref,String re_step,String re_level,String num) throws NamingException,IOException{

			String ip=request.getRemoteAddr(); //ip���� -�̰��߿�!!!

			boardDto.setIp(ip); //HttpServletRequest request�̰��ؾ� ip�ּҸ� ���� �� �ִ�.

			int maxNum=0;
			if(sqlSession.selectOne("board.maxNum",Integer.parseInt(num))!=null) {
				maxNum=sqlSession.selectOne("board.maxNum",Integer.parseInt(num));
			}

			if(maxNum!=0) { //�ִ�۹�ȣ�� 0�̾ƴϸ�
				maxNum=maxNum+1;//�ִ�۹�ȣ+1�� ���ۼ�
			}else {
				maxNum=1; //�۹�ȣ 1�����ۼ�
			}
		
			if(Integer.parseInt(num)!=0) {//�亯���̸�
				//��۳��������ġȮ��
				sqlSession.update("board.reStep",num);
				boardDto.setRe_step(boardDto.getRe_step()+1); //�ۼ���
				boardDto.setRe_level(boardDto.getRe_level()+1);//�۱���
				
			}else {//����
				boardDto.setRef(new Integer(maxNum));//�� �׷��ȣ
				boardDto.setRe_step(new Integer(0));//�ۼ���0
				boardDto.setRe_level(new Integer(0));//�۱��� 0
				
			}
		
	     sqlSession.insert("board.insertArticle",boardDto); 
			return "redirect:list.do";
		}
		
		

		@RequestMapping("/content.do")
		public String content(String num,String pageNum,Model model) throws NamingException,IOException {
			
			//��ȸ������
			sqlSession.update("board.plusReadcount",Integer.parseInt(num));
			
			BoardDto boardDto=(BoardDto)sqlSession.selectOne("board.getArticle",Integer.parseInt(num));
			
			model.addAttribute("boardDto", boardDto);
			model.addAttribute("pageNum",pageNum);
			
			return ".main.board.content";

			}
		
		//�ۼ���===========================================================================================================
			@RequestMapping(value="/edit.do", method=RequestMethod.GET)
			public ModelAndView userEdit(String num,String msg,Model model) { //Content.jsp ���� �ۼ����� ��, <a href="edit.do?num=${boardDto.num}">�̷��� num parameter���� �Ѿ�� �װɹ���. 
				
				System.out.println(num);
				System.out.println(msg);
				if(msg==null) {
					model.addAttribute("msg",msg);
				}
				
				BoardDto boardDto=(BoardDto)sqlSession.selectOne("board.getArticle",Integer.parseInt(num));

				
				return new ModelAndView(".main.board.edit","boardDto",boardDto);
				//					     edit.jsp . key    .value
			}
			
			//�ۼ���insert===========================================================================================================
			@RequestMapping(value="/edit.do",method=RequestMethod.POST)
			public String updateBoard(@ModelAttribute("boardDto") BoardDto boardDto,String num,String inputpwd,Model model) throws NamingException,IOException{
				
				String dbpwd=sqlSession.selectOne("board.findpwd",num); //DBpwd�� ã�´� - �Ʒ����� �񱳸� ���� 
				if(inputpwd.equals(dbpwd)){
					sqlSession.update("board.updateBoard",boardDto);	
				}else {
					System.out.println("200������ ����?");
					model.addAttribute("msg","oppps, wrong password ;-(");
					model.addAttribute("num",num);
					 return ".main.board.edit";
				}
				return "redirect:list.do";
			}
			
			
			//�ۻ���================================================================================================================
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
