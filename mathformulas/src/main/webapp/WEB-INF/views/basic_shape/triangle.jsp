<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
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
		<td>
		<div><img id="Fo" src="${myContextPath}/resources/shape/F_triangle_Fo.png" alt="원공식"></div>
		<div>*b= ${b}</div>
		<div>*h= ${h}</div>
		<br>
		<div>*1/2 x b x h = ${result}</div>
		</td>
			<td><img id="shape" src="${myContextPath}/resources/shape/F_triangle.png" alt="삼각형"></td>
			<td align=cetner>
					<div style="padding:1px"><input type="text" placeholder="b" name="b"></div>
					<div style="padding:1px"><input type="text" placeholder="h" name="h">
					<input type="submit" class=button value="계산" style="margin-left:5px;"></div>
					<div><h3>계산결과 ${result}</h3></div>
			</td>
		</tr>	
	</table>
</form>
</body>
</html>