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

<form action="trianglewR.do">
	<table align=center margin-top=30px>
		<tr>

			<td><img id="F_triangle" src="${myContextPath}/resources/shape/F_trianglewR.png" alt="삼각형"></td>
			<td align=cetner>
					<div><input type="text" placeholder="b" name="b"></div>
					<div><input type="text" placeholder="c" name="c"></div>
					<div><input type="text" placeholder="sinA" name="sinA"></div>
					<input type="submit" class=button value="계산">
					<br>
					<h3>계산결과 ${result}</h3>							
			</td>
		</tr>	
	</table>
</form>

</body>
</html>