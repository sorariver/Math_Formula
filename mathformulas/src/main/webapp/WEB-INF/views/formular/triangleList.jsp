<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../tiles/common.jsp"%>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Hello! triangle world !</title>

<style>

#fIngredi{
width:300px;
text-align:center;}

</style>

</head>
<body>


<table align=center style="padding:3px">
	<tr>
		<td><a href="triangle.do"><img id="F_triangle" src="${myContextPath}/resources/shape/F_triangle.png" alt="삼각형"></a></td>
		<td><a href="triangleHeron.do"><img id="fImg"src="${myContextPath}/resources/shape/F_triangleHeron.png" alt="삼각형"></a></td>
		<td><a href="triangleSin.do"><img id="fImg"src="${myContextPath}/resources/shape/F_triangleSin.png" alt="삼각형"></a></td>
	</tr>

	<tr>
		<td><img src="${myContextPath}/resources/shape/F_trianglewR.png" alt="원"></td>
		<td><img src="${myContextPath}/resources/shape/F_trianglewR2.png" alt="원"></td>
		<td> </td>
	</tr>
</table>

</body>

</html>