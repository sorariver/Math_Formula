package co.kr.math_formulas;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import javax.naming.NamingException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import org.springframework.beans.factory.annotation.Autowired;
import org.apache.ibatis.session.SqlSession;
import java.util.HashMap;
import java.util.List;


@Controller
public class FormularController
{

  @Autowired
  private SqlSession sqlSession;

  @RequestMapping({"main.do"})
  public String main(String Keyword, String pageNum, Model model)
    throws NamingException, IOException
  {
    if (pageNum == null) {
      pageNum = "1";
    }
    int pageSize = 3;
    int currentPage = Integer.parseInt(pageNum);

    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    int count = 0;
    int pageBlock = 10;

    List list = null;
    HashMap articleList = null;

    count = sqlSession.selectOne("f.countKeyword", Keyword);

    HashMap map = new HashMap();

    int starR = startRow - 1;
    map.put("startRow", new Integer(starR));
    map.put("pageSize", new Integer(pageSize));
    map.put("Keyword", Keyword);

    int initial = 0;
    if (count != 0) {
      initial = 1;

      if ((Keyword != null) && (!Keyword.equals("ALL")))
      {
        list = this.sqlSession.selectList("f.getKeyword", map);

        if (list != null)
        {
          count = ((Integer)this.sqlSession.selectOne("f.countKeyword", Keyword)).intValue();
        }
      }
    }
    else {
      initial = 2;
      count = ((Integer)this.sqlSession.selectOne("f.countAll")).intValue();
      list = this.sqlSession.selectList("f.getAll", map);
    }

    int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);

    model.addAttribute("currentPage", new Integer(currentPage));
    model.addAttribute("startRow", new Integer(startRow));
    model.addAttribute("endRow", new Integer(endRow));
    model.addAttribute("pageBlock", new Integer(pageBlock));
    model.addAttribute("pageCount", new Integer(pageCount));

    model.addAttribute("Keyword", Keyword);
    model.addAttribute("articleList", articleList);
    model.addAttribute("pageSize", new Integer(pageSize));
    model.addAttribute("count", new Integer(count));
    model.addAttribute("Keyword", Keyword);
    model.addAttribute("initial", Integer.valueOf(initial));

    model.addAttribute("Keyword", Keyword);
    model.addAttribute("list", list);

    return ".main.layout";
  }

  @RequestMapping({"rectangle.do"})
  public String rectangle(String a, String b, Model model)
    throws NamingException, IOException, NumberFormatException
  {
    if (a == null) {
      a = "0";
    }

    if (b == null) {
      b = "0";
    }

    float result = Float.parseFloat(a) * Float.parseFloat(b);

    model.addAttribute("a", a);
    model.addAttribute("b", b);
    model.addAttribute("result", Float.valueOf(result));
    return ".main.basic_shape.rectangle";
  }

  @RequestMapping({"round.do"})
  public String round(String r, Model model) throws NamingException, IOException, NumberFormatException
  {
    if (r == null) {
      r = "0";
    }

    float result = (float)(Float.parseFloat(r) * Float.parseFloat(r) * 3.14D);

    model.addAttribute("r", r);
    model.addAttribute("result", Float.valueOf(result));

    return ".main.basic_shape.round";
  }

  @RequestMapping({"triangleList.do"})
  public String triangleList(String h, String b, Model model)
    throws NamingException, IOException, NumberFormatException
  {
    return ".main.formular.triangleList";
  }
  @RequestMapping({"triangle.do"})
  public String triangle(String h, String b, Model model) throws NamingException, IOException, NumberFormatException { if (b == null) {
      b = "0";
    }

    if (h == null) {
      h = "0";
    }
    System.out.println(b);
    System.out.println(h);
    float result = (float)(0.5D * Float.parseFloat(b) * Float.parseFloat(h));

    System.out.println(result);
    model.addAttribute("result", Float.valueOf(result));

    return ".main.basic_shape.triangle"; }

  @RequestMapping({"triangleHeron.do"})
  public String triangleHeron(String a, String b, String c, Model model) throws NamingException, IOException, NumberFormatException {
    if (a == null) {
      a = "0";
    }

    if (b == null) {
      b = "0";
    }
    if (c == null) {
      c = "0";
    }

    float s = (Float.parseFloat(a) + Float.parseFloat(b) + Float.parseFloat(c)) / 2.0F;
    float result = (float)Math.sqrt(s * (s - Float.parseFloat(a)) * (s - Float.parseFloat(b)) * (s - Float.parseFloat(c)));

    System.out.println(result);
    model.addAttribute("result", Float.valueOf(result));
    model.addAttribute("s", Float.valueOf(s));
    model.addAttribute("a", a);
    model.addAttribute("b", b);
    model.addAttribute("c", c);

    return ".main.basic_shape.triangleHeron";
  }

  @RequestMapping({"triangleSin.do"})
  public String trianglewR(String b, String c, String sinA, Model model)
    throws NamingException, IOException, NumberFormatException
  {
    if (b == null) {
      b = "0";
    }

    if (sinA == null) {
      sinA = "0";
    }
    if (c == null) {
      c = "0";
    }

    float result = (float)(0.0F * Float.parseFloat(b) * Float.parseFloat(c) * Math.asin(Float.parseFloat(sinA)));

    System.out.println(result);
    model.addAttribute("result", Float.valueOf(result));

    return ".main.basic_shape.triangleSin";
  }
}