<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기폼</title>
<script type="text/javascript">
function writeSave(){
	//alert("aaa")
	if(document.writeform.writer.value==""){
	  alert("작성자를 입력하십시요.");
	  document.writeform.writer.focus();
	  return false;
	}
	if(document.writeform.subject.value==""){
	  alert("제목을 입력하십시요.");
	  document.writeform.subject.focus();
	  return false;
	}
	
	if(document.writeform.content.value==""){
	  alert("내용을 입력하십시요.");
	  document.writeform.content.focus();
	  return false;
	}
        
	if(document.writeform.passwd.value==""){
	  alert(" 비밀번호를 입력하십시요.");
	  document.writeform.passwd.focus();
	  return false;
	}
	document.writeform.submit();
 }    

</script>
</head>
<body>              
<div align="center">
<img src="resources/imgs/write.png" width="400"/>
</div>
<form method="post" name="writeform" action="writePro.do">
<input type="hidden" name="num" value="${num}"/>
<input type="hidden" name="ref" value="${ref}"/>
<input type="hidden" name="re_step" value="${re_step}"/>
<input type="hidden" name="re_level" value="${re_level}"/>

	<table border=1 align=center cellpadding=10 cellspacing=0 bordercolor=#9ED0F8 width=700>
	<tr>
		<td align=right colspan=2>
		<a href="list.do">list</td>
	</tr>
	
	<tr>
		<td width=70>How i address you?</td>
		<td width=330>
			<input type="text" name="writer" size="12">
		</td>                                                       
	</tr>
	
	<tr>
		<td>Subject</td>
		<td>
			<c:if test="${num==0}">
				<input type="text" name="subject" size="40">
			</c:if>
			
			<c:if test="${num!=0}">
				<input type=text name=subject size=40 value="[reply]">
			</c:if>
		</td>
	</tr>
	
	<tr>
		<td>Email</td>
		<td>
			<input type="text" name=email size=40>                                                                   
		</td>
	</tr>
	
	<tr>
	<td>Make a comment</td>
	<td>
		<textarea name="content" rows=10 cols=40></textarea>
	</td>
	</tr>
	
	<tr>
		<td>Password</td>
		<td> <input type="password" name="passwd" size="8"></td>
	</tr>
	
	<tr>       
	<td colspan=2 align=center>
		<input type=button value="write!" onClick="writeSave()">
		<input type=reset value="reset">
		<input type=button value="list" onClick="window.location='list.do'">
	</tr>
	
	</table>

</form>
</body>
</html>