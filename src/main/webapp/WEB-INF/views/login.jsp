<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>NAVER LOGIN TEST</title>
</head>
<body>
	<h1>Login Form</h1>
	<hr>
	<br>
	<center>
		<c:choose>
			<c:when test="${vo.nickname != null}">
				<h2>네이버 아이디 로그인 성공하셨습니다!!</h2>
				<h3>'${vo.nickname}' 님 환영합니다!</h3>
				<h3>
					<a href="logout">로그아웃</a>
				</h3>
			</c:when>
			<c:otherwise>
				<form action="login.userdo" method="post" name="frm"
					style="width: 470px;">
					<h2>로그인</h2>
					<input type="text" name="id" id="id" class="w3-input w3-border"
						placeholder="아이디" value="${id}"> <br> <input
						type="password" id="pwd" name="pwd" class="w3-input w3-border"
						placeholder="비밀번호"> <br> <input type="submit"
						value="로그인" onclick="#"> <br>
				</form>
				<br>
				<!-- 구글  -->
				<a href="https://accounts.google.com/o/oauth2/v2/auth?scope=https%3A//www.googleapis.com/auth/drive.metadata.readonly&include_granted_scopes=true&response_type=token&state=state_parameter_passthrough_value&redirect_uri=http%3a%2f%2flocalhost%3a9090%2fpro%2flogin.inc&client_id=959152787145-hum5jhsftmkgp03ouofpnrj4jjqinjjs.apps.googleusercontent.com">google login</a>

				<!-- 네이버 로그인 창으로 이동 -->
				<div id="naver_id_login" style="text-align: center">
					<a href="${url}"> <img width="223"
						src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
				</div>
				<br>
			</c:otherwise>
		</c:choose>