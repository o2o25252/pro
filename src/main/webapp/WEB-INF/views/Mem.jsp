<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#hr1{
		width: 350px;
		margin-left: -100px;
	}
</style>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<h1>회원 관리 페이지 </h1>
	<c:forEach var="vo" items="${ar }" >
		<form>
		<table>
			<tr>
				<td>아이디:</td>	
				<td>
					<input type="text" value="${vo.m_id }" readonly="readonly" id="id"/>
				</td>
			</tr>
			
			<tr>
				<td>이름:</td>
				<td><input type="text" value="${vo.m_name }" name="name"></td>
			</tr>
			<tr>
				<td>비번:</td>
				<td><input type="text" value="${vo.m_pw }" name="pw"></td>
			</tr>
		</table>
		</form>
		<input id="edit" type="button" value="수정 "/>
		<input id="del" type="button" value="삭제"/>
		<hr id="hr1"/>
	</c:forEach>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
	 $(function(){
		 	$("#eidt").bind("click", function(){
		 		var pw = $("#pw").val();
		 		var name =$("name").val();
		 		
		 		var param = "pw=" + encodeURIComponent(pw) 
		 		+"&name=" + encodeURIComponent(name);
		 		
		 		$.ajax({
		 			url: "edit.inc",
		 			dataType: "json",
		 			data: param,
		 			type : "POST"
		 		}).done(function(data){
		 			
		 		}).fail(function(err){
		 			console.log(err);
		 		});
		 		
		 	})
	 });
	</script>
</body>
</html>