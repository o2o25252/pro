<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>NAVER LOGIN TEST</title>
<link rel="stylesheet" href="resources/css/styles.css" />
<style type="text/css">

</style>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<br>
	<center>
		<!-- 일반회원 로그인 시 발생 -->
		<c:choose>
			<c:when test="${vo.nickname != null}">
				<h2> 로그인 성공하셨습니다!!</h2>
				<h3>'${vo.nickname}' 님 환영합니다!</h3>
				<h3>
					<a href="logout">로그아웃</a>
				</h3>
			</c:when>
			
			<c:otherwise>
				<form action="userdo.inc" method="post" name="frm"
					style="width: 470px;">
					<h2>로그인</h2>
					<input type="text" name="id" id="id" class="w3-input w3-border"
						placeholder="아이디" value="${id}" autocomplete="off"> <br> <input
						type="password" id="pwd" name="pw" class="w3-input w3-border"
						placeholder="비밀번호"> <br> 
						<input type="button" id="log_btn" value="로그인"> <br>
				</form>
				<br>
				
				<!-- 카카오 -->
				<a href="https://kauth.kakao.com/oauth/authorize?client_id=3893d1bf958b0f76562256b6cd4f963e&redirect_uri=http://localhost:9090/pro/kakaologin.inc&response_type=code">
	            <img src="resources/kakao_account_login_btn_medium_narrow.png">
	        	</a>
				
				<br/>
				
				<!-- 네이버 로그인 창으로 이동 -->
				<div id="naver_id_login" style="text-align: center">
					<a href="${url}"> <img width="223"
						src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
				</div>
				<br>
				
				
				<!-- ID/PW 찾기   -->
				<div>
					<button id="but" onclick="location.href='user_info.inc'">ID/PW찾기 🌴</button>
				</div>
				
			</c:otherwise>
		</c:choose>
		
		</center>
	
		<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
		<script src="resources/js/jquery-3.4.1.min.js"></script>
		<script>
			$(function(){
				$("#log_btn").bind("click",function(){
					var id = $("#id").val();
					var pw = $("#pwd").val();
					
					var login_info ="id="+encodeURIComponent(id)+"&pw="+encodeURIComponent(pw);
					
					
					if(id.trim().length<1){
						alert("아이디 입력하세여");
						$("#id").focus();
						return;
					}
					if(pw.trim().length<1){
						alert("비밀번호를 입력하세여");
						$("#pw").focus();
						return;
					}
					$.ajax({
						url:"userdo.inc",
						data:login_info,
						dataType:"json",
						type:"post"
					}).done(function(data){
						if(data.chk){
							location.href="main.inc";
						}else{
							alert("정보가 다릅니다.");
						}
					}).fail(function(err){
						console.log(err);
					});
				});
				
			});	
		</script>
		</body>
		
</html>
		
		
		
		