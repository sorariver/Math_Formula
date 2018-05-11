<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
    

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
function deleteSave(){
	if(document.delForm.inputpwd.value==''){
		alert("암호를 입력하시오");
		document.delForm.inputpwd.focus();
		return false;
	}
	return true;
}
</script>

</head>
<body>
<c:if test="${empty sessionScope.id}">
<script>
	alert("you can't delete the post without login >>");
	
    location.href="login.do";
// HTML	<meta http-equiv="Refresh" content="0;url=${ctxpath}/member/main.do"/>

	//history.go(-1);
</script>
	
</c:if>

<center>${msg}</center>
<div align="center">
<img src="resources/imgs/delete.png" width="400"/>
</div>
<form name="delForm" method="post" action="delete.do" onSubmit="return deleteSave()">
	<table align=center width=700>
	
			<td align=center>
				here! :
				<input type="password" name="inputpwd" size=8>
				<input type="hidden" name="num" value="${num}">
			</td>
		</tr>
		
		<tr height=30>
			<td align=center>
				<input type="submit" value="delete">
				<input type="button" value="go back to list" onClick="document.location.href='list.do'">
			</td>
		</tr>
		
	
	</table>
</form>
</body>
</html>