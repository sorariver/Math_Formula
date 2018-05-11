<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<img src="resources/imgs/content.png" width="400"/>
</div>
	<table border=1 align=center cellpadding=10 cellspacing=0 bordercolor=#9ED0F8 width=700>
		<tr>
			<td height=40px align=center colspan=2> 
				<a href="edit.do?num=${boardDto.num}">modify</a>&nbsp;
				<a href="delete.do?num=${boardDto.num}">delete</a>&nbsp;
				<a href="writeForm.do?num=${boardDto.num}&pageNum=${pageNum}&ref=${boardDto.ref}&re_step=${boardDto.re_step}&re_level=${boardDto.re_level}">reply</a>&nbsp;
				<a href="list.do">list</a>&nbsp;
			</td>
		</tr>
	
		<tr height="40px">
			<td>Writer</td>
			<td>${boardDto.writer}</td>
		</tr>
		
		<tr height="40px">
			<td>Subject</td>
			<td>${boardDto.email}</td>
		</tr>
		
		<tr>
			<td>Content</td>
			<td><pre>${boardDto.content}</pre></td>
		</tr>
		
		<tr>
			<td>Date</td>

			<td>
			<fmt:formatDate value="${boardDto.regdate}" type="date" dateStyle="default"/><br>
			<fmt:formatDate value="${boardDto.regdate}" pattern="yyyy년 MM월 dd일 H:mm:ss"/>
																									<!-- yyyy-MM-dd -->
		</tr>
		
		<tr>
			<td>how many people read?</td>
			<td>${boardDto.readcount}</td>
		</tr>
	</table>



</body>
</html>