<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../tiles/common.jsp"%>
<html>
<head>
<link rel="stylesheet" type="text/css"  href="resources/css/Fomular.css">



<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>


<form action="triangle.do">
	<table align=center margin-top=30px>
		<tr>
			<td><img id="F_triangle" src="${myContextPath}/resources/shape/F_triangle.png" alt="삼각형"></td>
			
			<td align=cetner  id="td_top">
					<div style="padding:1px"><input type="text" placeholder="b" name="b"></div>
					<div style="padding:1px"><input type="text" placeholder="h" name="h"></div>
					<br>
					<h3>계산결과 ${result}</h3>							
			</td>
			<td><input type="submit" class=button value="계산"></td>
		</tr>	
	</table>
</form>



</body>
</html>