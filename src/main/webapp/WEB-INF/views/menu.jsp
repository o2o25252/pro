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
	background-color: #eee;
}

#holder {
	width: 900px;
	height: 140px;
	line-height: 140px;
	border: 3px solid puple;
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
#u_navbar{
	border: 4px solid red;
}
</style>
</head>
<body>
	<div id="holder" style="margin: auto;">
		<div id="h_logo">
			<a class="navbar-brand" href="main.inc"> <font style="vertical-align: inherit;"> <font style="vertical-align: inherit;"> <img src="resources/css/images/KakaoTalk_20200410_165204848.png" style="width: 80px; height: 80px"> </font></font></a>
		</div>
		<!-- 검색 부분  -->
		<div id="h_search">
			<div class="form-inline my-2 my-lg-0" id="h_searchbtn">
				<input class="form-control mr-sm-2" type="text" id="search"
					placeholder="Search" style="width: 400px; "/>
				<button class = "btn btn-primary" type="button"
					id="ok_btn">
					<font style="vertical-align: inherit;"> <font
						style="vertical-align: inherit;"> 검색 </font>
					</font>
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
	<div></div>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary" id="navbar">
		<div class="collapse navbar-collapse" id="navbarColor01">
			<ul class="navbar-nav mr-auto" id="u_navbar">
				<li class="nav-item"><a class="nav-link" href="kMap.inc"> <font
						style="vertical-align: inherit;"><font
							style="vertical-align: inherit; color: #ffffff; ;"> 지도 </font></font></a></li>
				<li class="nav-item"><a class="nav-link" href="ranking.inc">
						<font style="vertical-align: inherit;"><font
							style="vertical-align: inherit; color: #ffffff; "> 순위 </font></font>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="notice.inc">
						<font style="vertical-align: inherit;"><font
							style="vertical-align: inherit; color: #ffffff;"> 공지 </font></font>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="statistics.inc">
						<font style="vertical-align: inherit;"><font
							style="vertical-align: inherit; color: #ffffff;"> 공식통계 </font></font>
				</a></li>
			</ul>
			
		</div>
		<div>
			
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