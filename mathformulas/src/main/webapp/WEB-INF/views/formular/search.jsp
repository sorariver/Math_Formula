<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../tiles/common.jsp"%>
<%@page import="java.util.*"%>

<!-- <html> -->
<!-- <head> -->
<!-- <script type="text/javascript" src="//code.jquery.com/jquery-3.2.1.min.js"></script> -->
<!-- <link rel="stylesheet" type="text/css"  href="resources/css/Fomular.css"> -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR"> -->
<!-- <title>Insert title here</title> -->
<!-- </head> -->
<!-- <body> -->


 <form method=get action="main.do?" align="center">
	<input type=text id="Keyword" name="Keyword" placeholder="어떤 도형의 넓이를 알고싶으세요?" style="width:800px; padding: 20px 10px; line-height: 10px;">
	<input type=submit value="go" hidden="true" >
 </form>


<br>
<c:if test="${initial==0}">
<!-- Welcome to visit ⁽⁽٩(๑˃̶͈̀ ᗨ ˂̶͈́)۶⁾⁾  -->
<table align=center style="width:100px;">
<tr>
	<td>
		<a href="rectangle.do" ><img src="${myContextPath}/resources/shape/F_rectangle.png" alt="사각형"></a>
	</td>
	<td>
		 <a href="round.do" ><img src="${myContextPath}/resources/shape/F_round.png" alt="원"></a>
	</td>
	<td>
		 <a href="triangleList.do" ><img src="${myContextPath}/resources/shape/F_triangle.png" alt="삼각형"></a>
	</td>
</tr>
</table>
</c:if>
<c:if test="${initial==2}">
oops, no result for "${Keyword}". 
Please check your formula on the below list
</c:if>


<%--list--%>
<c:if test="${initial==1 || initial==2}">
<table align=center>
<c:forEach var="dto" items="${list}"> 
<tr class="frame">
		<td class="${dto.Img}"><img src="${myContextPath}/resources/shape/${dto.Img}.png" id="${dto.No}"></td>
<%-- 		<div id="${dto.Formular_name}" style="color:#fe0458"><b>${dto.Formular_name}</b></div> --%>
</tr>

<script type="text/javascript">
$(function(){
    $('#${dto.No}').click(function(){
    	//alert("it works! ${dto.s_no}");
    	location.href="${dto.Fomular_name}.do";
    	
    });
});
</script>
</c:forEach>
</table>
</c:if>
<div style="margin-left:50%;">
<span>
	<c:if test="${count>0}">
				<fmt:parseNumber var="result" value="${currentPage/6}" integerOnly="true"/>
				<c:set var="startPage" value="${result*6+1}"/>
				<c:set var="endPage" value="${startPage+pageBlock-1}"/>
				
				<c:if test="${endPage>pageCount}">
					<c:set var="endPage" value="${pageCount}"/>
				</c:if>	
				
				<c:if test="${startPage>10}">
					<a href="main.do?pageNum=${startPage-6}&Keyword=${Keyword}">
					[이전블럭]</a>
				</c:if>
				<nav class="pagination">
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href="main.do?pageNum=${i}&Keyword=${Keyword}">
					${i}</a>
				</c:forEach>
				</nav>
		
				<c:if test="${endPage<pagecount}">
					<a href="main.do?pageNum=${startPage+6}&Keyword=${Keyword}">
						[다음블럭]</a>
				
				</c:if>
				
			</c:if>
</span>
</div>
<!-- </body> -->
<!-- </html> -->