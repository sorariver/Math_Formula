package co.kr.math_formulas;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.naming.NamingException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

public class ListController {
	 @Autowired
	  private SqlSession sqlSession;
	 
	 
	@RequestMapping("/list.do")
	public String list(String s_name,String s_addr,String s_img,String s_no,Model model) throws NamingException,IOException {
		
		HashMap<String,String> map=new HashMap<String,String>();

//		map.put("",s_no);
//		map.put("s_addr",s_addr);
//		map.put("s_img",s_img);
//		map.put("s_name",s_name);
				
		List<HashMap<String,String>> shopList=null;
		
		shopList=sqlSession.selectList("bob.getAddr");
		
		model.addAttribute("shopList",shopList);
		return ".main.bob.list";
	}
	
}
