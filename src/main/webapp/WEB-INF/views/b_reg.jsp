<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 메뉴 css -->
<link rel="stylesheet" href="resources/css/styles.css" />
<style type="text/css">
	#registry{
		border: 1px solid black;
		margin: auto;
	}
</style>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div id="registry">
		<form action="">
			<h3>회원 가입</h3>
			<table>
				<tr>
					<th><label for="b_id">아이디:</label></th>
					<td><input type="text" id="b_id" name="b_id" placeholder="아이디를 입력하세요"/></td>
				</tr>
				<tr>
					<th><label for="b_name">이름:</label></th>
					<td><input type="text" id="b_name" name="b_name" placeholder="이름을 입력하세요"/></td>
				</tr>
				<tr>
					<th><label for="b_pw">비밀번호:</label></th>
					<td><input type="password" id="b_pw" name="b_pw" placeholder="영문/숫자 조합 6~15자"/></td>
				</tr>
				<tr>
					<th><label for="b_nick">닉네임:</label></th>
					<td><input type="text" id="b_nick" name="b_nick" placeholder="이름을 입력하세요"/></td>
				</tr>
				</table><br/><br/><br/>
			<button type="button" id="reg_btn"  class="btn btn-success">회원가입</button>&nbsp;&nbsp;
			<button type="button" id="cancle_btn" onclick="javascript:location.href='control?type=main'" class="btn btn-success">취소</button>
		</form>
	</div>
	
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script>
		$(function(){
			$("#reg_btn").bind("click",function(){
				var id = $("#b_id").val();
				var pw = $("#b_pw").val();
				var name = $("#b_name").val();
				var nick = $("#b_nick").val();
				
				if(id.trim().length<1){
					alert("아이디를 입력하세요");
					$("#b_id").focus();
				}
				if(name.trim().length<1){
					alert("이름을 입력하세요");
					$("#b_name").focus();
				}
				if(pw.trim().length<1){
					alert("비밀번호를 입력하세요");
					$("#b_pw").focus();
				}
				if(nick.trim().length<1){
					alert("닉네임을 입력하세요");
					$("#b_nick").focus();
				}
				
				var param = "id="+encodeURIComponent(id)+"&pw="+encodeURIComponent(pw)+"&name="+encodeURIComponent(name)+"&nickname="+encodeURIComponent(nickname);
				$.ajax({
					url:
				}).done(function(data){
					
				}).fail(function(err){
					console.log(err);
				});
			});
			
			$("#cancle_btn").bind("click",function(){
				location.href = "main.inc";
			});
		});
	</script>
</body>
</html>