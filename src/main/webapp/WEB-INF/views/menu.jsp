<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/jquery-ui.min.css" />
<style type="text/css">

a:hover {
	text-decoration: none;
	color: #6cc091
}

.h {
	border: 3px solid black;
	width: 500px;
}

#body {
	width: 80%;
}

#holder {
	height: 140px;
	line-height: 140px;
	text-align: center;
}
#h_logo,#h_search,#h_login{
	display: inline-block;
}
#h_logo{
	margin-right: 30px;
}
#h_login{
	margin-left: 30px;
	text-align: right;
}
#navbar{
	height: 60px;
	width: auto;
	padding: auto;
}
.change{
	 color: #FFFFFF;
}
.change:hover {
	color: black;
}
</style>
</head>
<body style="margin: auto;">
	<div id="holder">
		<div id="h_logo">
			<a class="navbar-brand" href="main.inc"><img src="resources/css/images/KakaoTalk_20200410_165204848.png" style="width: 80px; height: 80px"></a>
		</div>
		<!-- 검색 부분  -->
		<div id="h_search">
			<div class="form-inline my-2 my-lg-0" id="h_searchbtn">
				<input class="form-control mr-sm-2" type="text" id="search"
					placeholder="Search" style="width: 400px; "/>
				<button class="btn" type="button" style="background-color: #594F4F;"
					id="ok_btn"><font style="color: #ffffff;">검색</font>
				</button>
			</div>
		</div>
		<div id="h_login">
			<!-- 로그인 전 -->
			<c:if test="${empty sessionScope.userVO.nickname }">
				<a href="login.inc">로그인</a>&nbsp; <a href="reg.inc">회원가입</a>
			</c:if>
			<!-- 홈 로그인 시 -->
			<c:if
				test="${ !empty sessionScope.userVO.nickname and sessionScope.userVO.status eq 0}">
				<label>H_${userVO.nickname }님 환영합니다</label>
				<a href="logout">로그아웃</a>
			</c:if>
			<!-- 네이버 로그인시 -->
			<c:if
				test="${ !empty sessionScope.userVO.nickname and sessionScope.userVO.status eq 1}">
				<label>N_${userVO.nickname }님 환영합니다</label>
				<a href="logout">로그아웃</a>
			</c:if>
			<!-- 카카오 로그인시 -->
			<c:if
				test="${ !empty sessionScope.userVO.nickname and sessionScope.userVO.status eq 2}">
				<label>K_${userVO.nickname }님 환영합니다</label>
				<a href="logout">로그아웃</a>
			</c:if>

			<!-- 관리자 로그인 시 -->
			<c:if
				test="${ !empty sessionScope.userVO.nickname and sessionScope.userVO.status eq 9}">
				<a href="admin.inc" style="color: green;">M_${userVO.nickname }님 환영합니다</a>
				<a  href="logout" >로그아웃</a>
			</c:if>
		</div>
	</div>
	<nav class="navbar navbar-expand-lg navbar-dark" id="navbar" style="background-color: #28A0FF; text-align: center;  box-shadow: 2px 2px 2px 2px #bebebe; ">
		<div class="collapse navbar-collapse" id="navbarColor01" >
			<ul class="navbar-nav" id="u_navbar" style="margin: auto;">
				<li class="nav-item" style="padding-left: 80px; padding-right: 80px;  color: #FFFFFF;"><a class="nav-link" href="notice.inc"><font
							class="change">공지</font>
				</a></li>
				<li class="nav-item" style="padding-left: 80px; padding-right: 80px"><a class="nav-link" href="ranking.inc"><font
							class="change">순위</font>
				</a></li>
				<li class="nav-item" style="padding-left: 80px; padding-right: 80px"><a class="nav-link" href="statistics.inc"><font
							class="change">공식통계</font>
				</a></li>
				<li class="nav-item" style="padding-left: 80px; padding-right: 80px"><a class="nav-link" href="kMap.inc"><font
							class="change">주변 영화관</font>
				</a></li>
			</ul>
		</div>
	</nav>
	<div id="body">
		<form method="post" action="search.inc" name="nm">
			<input type="hidden" name="movieNm" />
		</form>
	</div>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/jquery-ui.min.js"></script>
	<script>
	
	$(function() {
		// 검색 정보
		$("#ok_btn").bind("click",function(){
			var movieNm = $("#search").val().trim().replace(/ /g, "%20");
			if(movieNm==0){
				alert("입력하세요");
			}else{
				document.nm.movieNm.value=movieNm;
				document.nm.submit();
			}
		});
		
		$("#search").keydown(function(key){
			if (key.keyCode == 13) {
				var movieNm = $("#search").val().trim().replace(/ /g, "%20");
				
				if(movieNm==0){
					alert("입력하세요");
				}else{
				document.nm.movieNm.value= movieNm;
				document.nm.submit();
				}
			}
		});
		
        $("#open_btn").bind("click", function() {
           $("#view_win").dialog();
           $("#view_win").css("display", "block");

        });

        $("#close_bt").bind("click", function() {

           $("#view_win").dialog("close");
        });
        
			
		});
	</script>
</body>
</html>