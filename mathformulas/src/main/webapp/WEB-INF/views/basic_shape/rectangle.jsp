<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../tiles/common.jsp"%>
<script type="text/javascript" src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css"  href="resources/css/Fomular.css">
<title>Insert title here</title>
</head>
<body>

<form action="rectangle.do">
<table align=center margin-top=30px>
		<tr>
		<td>
		<div><img id="Fo" src="${myContextPath}/resources/shape/F_rectangle_Fo.png" alt="사각형공식"></div>
		<div>*a= ${a}</div>
		<div>*b= ${b}</div>
		<br>
		<div>*axb= ${result}</div>
		</td>

			<td><img src="${myContextPath}/resources/shape/F_rectangle.png" id="shape" alt="사각형"></td>
<!-- 			<td><div id="circle"></div></td> -->
			<td align=cetner>
					<div><input type="text" placeholder="a" name="a"></div>
					<div><input type="text" placeholder="b" name="b">
					<input type="submit" class=button value="계산" style="margin-left:5px;"></div>
					<div><h3>계산결과 ${result}</h3></div>
			</td>
				
		</tr>	
	
	</table>
</form>

</body>
</html>