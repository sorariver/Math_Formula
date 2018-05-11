<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>list.jsp</title>
</head>
<body>
<div align="center">
<img src="resources/imgs/list.png" width="400"/>
</div>
<center>
<h4>(TOTAL:${map.count})</center>

<table align=center width=700>
	<tr>
		<td align=right>
			<a href="writeForm.do">write my story♥</a> 
			<%-- contextpath알아보기 : <%=request.getContextPath()%> => /14_MVC 
			   따라서, 위의 a href는 이런 전체주소가 된다.  http://localhost:9000/14_MVC/ch19/writeForm.do --%>
		</td>
	</tr>
</table>

<c:if test="${map.count==0}">
	<table>
		<tr>
			<td align=center>
			there is no list ...
			</td>
		</tr>
	</table>
</c:if>
		
<c:if test="${map.count>0}">
	<table align=center  border=1 bordercolor=#9ED0F8  cellpadding=5 >
		<tr height=30>
			<td align=center width=50>number</td>
			<td align=center width=250>subject</td>
			<td align=center width=100>writer</td>
			<td align=center width=150>date</td>
			<td align=center width=50>count</td>
			<td align=center width=100>IP</td>
		</tr>
	
		<c:forEach var="dto" items="${articleList}">
			<tr>
				<td align="center">
					<c:out value="${number}"/>
					<c:set var="number" value="${number-1}"/>
				</td>
				
				<td>
					<c:if test="${dto.re_level>0}">
						<img src="resources/imgs/re.gif/imgs/level.gif" width="${5*dto.re_level}" height="16"/>
						<img src="resources/imgs/re.gif">
					</c:if>
					
					<c:if test="${dto.re_level==0}">
						<img src="resources/imgs/level.gif" width="${5*dto.re_level}" height="16"/>
					</c:if>
					
					<a href="content.do?num=${dto.num}&pageNum=${map.currentPage}">
					${dto.subject}
					</a> 
					
					<c:if test="${dto.readcount>=20}">
						<img src="resources/imgs/hot.gif" border="0" height="16"/>
					</c:if>
				</td>
				
				<td>
				<a href="mailto:${dto.email}">${dto.writer}</a>
				</td>
				
				<td>
					${dto.regdate}
				</td>
				<td>
					${dto.readcount}
				</td>
				<td>
					${dto.ip}
				</td>
						
			</tr>
		</c:forEach>
	</table>
</c:if>
<%--블럭처리, 페이지처리 --%>
<table width=700 align=center>
	<tr>
		<td align=left>
			<c:if test="${map.count>0}">
				<fmt:parseNumber var="result" value="${map.currentPage/10}" integerOnly="true"/>
			
				<c:set var="startPage" value="${result*10+1}"/>
				
				<c:set var="endPage" value="${startPage+map.pageBlock-1}"/>
	
				
				<c:if test="${endPage>map.pageCount}">
					<c:set var="endPage" value="${map.pageCount}"/>

				</c:if>	
				
				<c:if test="${startPage>10}">
					<a href="list.do?pageNum=${startPage-10}">
					[이전블럭]</a>
				</c:if>
			
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href="list.do?pageNum=${i}">
					[${i}]</a>
				</c:forEach>
				
				<!--다음블럭처리 -->
				<c:if test="${endPage<map.pageCount}">
					<a href="list.do?pageNum=${startPage+10}">
						[다음블럭]</a>
				</c:if>
				
			</c:if>
		</td>
	</tr>
</table>



</body>
</html>