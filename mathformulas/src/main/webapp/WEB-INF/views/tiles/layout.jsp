<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"  href="resources/css/Fomular.css">
<title>layout.jsp</title>
</head>
<body style="margin:0; padding:0;">
	<table border=0 style="width:100%; height:100%; min-width:700px; border-collapse:collapse;">
		<tr>
			<td colspan=2 height=10% style="padding-bottom:0;">
				<tiles:insertAttribute name="header"/><!-- header.jsp -->
			</td>
		</tr>
		
		<tr>
			<td valign="top" align=center><tiles:insertAttribute name="content"/> <!-- 중앙에 표시 --></td>
		</tr>
		
		<tr>
<%-- 			<td colspan=2 height=6% bgcolor=#f95252 margin-left=0><tiles:insertAttribute name="footer"/><!-- footer.jsp --></td> --%>
		</tr>
	
	</table>
</body>
</html>