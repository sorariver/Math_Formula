<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../tiles/common.jsp"%>
<script type="text/javascript" src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<html>
<head>
<link rel="stylesheet" type="text/css"  href="resources/css/Fomular.css">
<style>
#circle {
	width: 100px;
	height: 100px;
	background: #F551B0;
	-moz-border-radius: 50px;
	-webkit-border-radius: 50px;
	border-radius: 50px;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="round.do">
<table align=center margin-top=30px>
		<tr>
		<td>
		<div><img id="Fo" src="${myContextPath}/resources/shape/F_round_Fo.png" alt="원공식"></div>
		<div>*r= ${r}</div>
		<div>*r²= ${r*r}</div>
		<div>*π= 3.14</div>
		<br>
		<div>*πr²= 3.14 x ${r*r} = ${result}</div>
		</td>

			<td><img src="${myContextPath}/resources/shape/F_round.png" id="shape" alt="원"></td>
<!-- 			<td><div id="circle"></div></td> -->
			<td align=cetner>
					<div><input type="text" placeholder="r" name="r">
					<input type="submit" class=button value="계산" style="margin-left:5px;"></div>
					<div><h3>계산결과 ${result}</h3></div>
			</td>
				
		</tr>	
	
	</table>
</form>

</body>
</html>