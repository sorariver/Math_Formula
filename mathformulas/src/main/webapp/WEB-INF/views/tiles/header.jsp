<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../tiles/common.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
	<h2 align="center">
		<a href="/tilestest/" style="text-decoration:none;">
		홈으로 가기(패키지 마지막이름)=>
		프로젝트이름=마지막패키지이름=컨텍스트이름
		</a>
	</h2>
--%>

<table border=0 style="width:100%; min-width:700px; border-collapse:collapse;">
	<tr>
		<td align="left"><a href="/mathformulas/" style="text-decoration:none;">
		<img src="${myContextPath}/resources/shape/logo.png" alt="로고">
		</a></td>
		
		<td align="right">
			<a href="list.do">게시판</a>&nbsp;&nbsp;
			<a href="insertForm.do">회원가입</a>&nbsp;&nbsp;
			<a href="login.do">로그인</a>&nbsp;&nbsp;
		</td>
	</tr>	
</table>
 
 	
</body>
</html>