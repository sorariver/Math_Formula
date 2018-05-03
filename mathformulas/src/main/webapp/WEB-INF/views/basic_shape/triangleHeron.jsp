<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../tiles/common.jsp"%>

<html>
<head>
<link rel="stylesheet" type="text/css"  href="resources/css/Fomular.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="triangleHeron.do">
	<table align=center margin-top=30px>
		<tr>
		<td>
		<div><img id="Fo" src="${myContextPath}/resources/shape/F_triangleHeron_Fo.png" alt="삼각형공식"></div>
		<div>*s= ${a}+${b}+${c} / 2 = ${s}</div>
		<div>*(s-a)= ${s}-${a} = ${s-a}</div>
		<div>*(s-b)= ${s}-${b} = ${s-b}</div>
		<div>*(s-c)= ${s}-${c} = ${s-c}</div>
		<br>
		<div>*√${s}(${s-a})(${s-b})(${s-c})=${result}</div>
		</td>

			<td><img id="shape" src="${myContextPath}/resources/shape/F_triangleHeron.png" alt="삼각형"></td>
			<td align=cetner>
					<div><input type="text" placeholder="a" name="a"></div>
					<div><input type="text" placeholder="b" name="b"><input type="submit" class=button value="계산" style="margin-left:5px;"></div>
					<div><input type="text" placeholder="c" name="c"></div>
					<div><h3>계산결과 ${result}</h3></div>
			</td>
				
		</tr>	
	

	</table>
</form>

</body>
</html>