<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	tr{height:40px;}
	table{
	margin:auto;
	line-height:40px;
	border:1;
	border-color:#9ED0F8;
	width:500px;
	}
	</style>
	
	<script type="text/javascript">
function editSave(){
	if(document.editForm.inputpwd.value==''){
		alert("암호를 입력하시오");
		document.editForm.inputpwd.focus();
		return false;
	}
	return true;
}
</script>

</head>
<body>
<!-- 로그인상태인지 체크 -->
<c:if test="${empty sessionScope.id}">
<script>
	alert("you can't edit the post without login >>");
	
    location.href="login.do";
// HTML	<meta http-equiv="Refresh" content="0;url=${ctxpath}/member/main.do"/>

	//history.go(-1);
</script>
	
</c:if>



<div align="center">
<img src="resources/imgs/update.png" width="400"/>
</div>
<center>${msg}</center>
	<form name="editForm" method="post" action="edit.do" onSubmit="return editSave()">
		<table align=center  align=center  border=1 bordercolor=#9ED0F8  cellpadding=5 width=700> 
		 	<tr height=40px>
		 		<td>writer</td>
		 		<td>
		 			<input type=hidden name=num id=num value="${boardDto.num}" size=10/>
		 			<input type=text name=writer id=writer value="${boardDto.writer}" size=10/>
		 		</td>
		 	</tr>
		 	
		 	<tr height="40px">
		 		<td>subjtect</td>
		 		<td><input type="text" name="subject" id="subject" value="${boardDto.subject}" size=30/></td>
		 	</tr>
		 	
		 	<tr height="40px">
		 		<td>email</td>
		 		<td><input type="text" name="email" id="email" value="${boardDto.email}" size=30/></td>
		 	</tr>
		 	
		 	<tr height=40px>
		 		<td>content</td>
		 		<td><textArea name="content" id="content" rows=13 cols=40>${boardDto.content}</textArea></td>
		 	</tr>
		 	
		 	<tr>
		 		<td>password</td>
		 		<td><input type="password" name="inputpwd" id="inputpwd" size="10"/></td>
		 	</tr>
		 	
		 	<tr>
		 		<td colspan=2 align=center>
		 			<input type="submit" value="modify">
		 			<input type="reset" value="reset">
		 			<input type="button" value="go back to list" onClick="document.location.href='list.do'">
		 		</td>
		 	</tr>
		 	
		 	
		 	
		</table>
		
	</form>


</body>
</html>