<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border=0 style="width:100%; min-width:700px; border-collapse:collapse;">
		<tr height=10%>
			<td colspan=2 height=60>
				<tiles:insertAttribute name="header"/><!-- header.jsp -->
			</td>
		</tr>
		
		<tr height=80%>
			<td valign="top"><tiles:insertAttribute name="content"/> <!-- 중앙에 표시 --></td>
		</tr>
		
		<tr align="bottom">
			<td colspan=2 height=100><tiles:insertAttribute name="footer"/><!-- footer.jsp --></td>
		</tr>
	
	</table>
</body>
</html>