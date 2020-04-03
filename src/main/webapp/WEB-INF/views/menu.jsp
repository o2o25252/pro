<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/jquery-ui.min.css" />
<style type="text/css">

	 #div1 {
	    display: none;
	 }
	 #div2 {
	    display: none;
	 }
	#week,#weekend {
		border: 1px solid black;	
		margin: auto;	
		width: 500px;
	}
	
	td{
		text-align: center;
	}
	
	#dialog{
		display: none;
	}
	table td a{
		text-decoration: none;
	}
	#menu a:hover {
		color : blue;
	}
	.li{
		color: black;
		list-style: none;
		margin : auto;
	}
	
	#menu_header{
		margin : auto;
		border: 1px solid black;
	}
	a:hover{text-decoration:none; color:#6cc091}

	ul#menu{
			margin: 0;
			padding: 0;
			list-style: none;
			font: 15px sans-serif;
			line-height: 44px;
			text-align: center;
			text-decoration: none;
			background-color: rgba(75, 75, 93, 0.85);
		}
	ul#menu>li{
		display: inline-block;
		width: 150px;
		margin: auto;
		
	}
	.li:hover{
		color: #6cc091;
	}
	ul#menu>li>a{
		color: #efefef;
		text-decoration: none;	
	}
	#logo{
		width: 100px;
		height: 70px;
		float: left;
	}
	#logo a{
		padding: auto;
	}
	
	#high{
		float: auto;
		height: 70px;
		margin: auto;
	}
	#as{
		float: right;
		padding-top: 20px;
	}
	#as a{
		text-align: center;
		text-decoration: none;
	}
	
	#map{
		display: inline-block;
		margin: auto;
		overflow-y: auto;
		border: 1px solid black;
		position: fixed;
		width: 240px;
	}
	.h{
		border: 3px solid black;
		width: 500px;
		 }
	#week a,#weekend a{ 
		text-decoration: none;
	}	 
	table th{
		text-align: center;
	}
	.cal_month{
		width: 220px;
	}
	 #body {
    background-color: #eee;
  }
</style>
</head>
<body>
	<nav class = "navbar navbar-expand-lg navbar-dark bg-dark">
 	 <a class="navbar-brand" href="main.inc"> <font style = "vertical-align : inherit;"> <font style = "vertical-align : inherit;"> 로고 </font> </font> </a>
  <button class = "navbar-toggler"type = "button"data-toggle = "collapse"data-target = "# navbarColor02"aria-controls = "navbarColor02"aria-expanded = "false"aria-label = "탐색 ">
    <span class = "navbar-toggler-icon"> </span>
  </button>

  <div class = "collapse navbar-collapse"id = "navbarColor02">
    <ul class = "navbar-nav mr-auto">
     
      <li class = "nav-item">
        <a class="nav-link" href="kMap.inc"> <font style = "vertical-align : inherit;"><font style = "vertical-align : inherit;"> 지도 </font></font></a>
      </li>
      <li class = "nav-item">
        <a class="nav-link" href="chart.inc"> <font style = "vertical-align : inherit;"><font style = "vertical-align : inherit;"> 순위 </font></font></a>
      </li>
      
      <li class = "nav-item">
        <a class="nav-link" href="notice.inc"> <font style = "vertical-align : inherit;"><font style = "vertical-align : inherit;"> 공지 </font></font></a>
      </li>
    </ul>
    <div class = "form-inline my-2 my-lg-0">
      <input class = "form-control mr-sm-2" type ="text" id="search" placeholder="Search"/>
      <button class = "btn btn-secondary my-2 my-sm-0" type = "button" id="ok_btn"> <font style = "vertical-align : inherit;"> <font style = "vertical-align : inherit;"> 검색 </font> </font> </button>
    </div>
    <div>
	    <!-- 로그인 전 -->
	      <c:if test="${empty sessionScope.userVO.nickname }">
	         <aside id="as">
	            <a href="login.inc">로그인</a>&nbsp; <a href="reg.inc">회원가입</a>
	         </aside>
	      </c:if>
	         <!-- 네이버 로그인시 -->
	      <c:if test="${ !empty sessionScope.userVO.nickname and sessionScope.userVO.status eq 1}">
	      		<label>N_${userVO.nickname }님 환영합니다</label> <a href="logout">로그아웃</a>
	      </c:if>
	      <!-- 카카오 로그인시 -->
	      <c:if test="${ !empty sessionScope.userVO.nickname and sessionScope.userVO.status eq 2}">
	              <label>K_${userVO.nickname }님 환영합니다</label> <a href="logout">로그아웃</a>
	      </c:if>
    </div>
  </div>
</nav>
  	<div id="body">
      <form method="post" action="search.inc" name="nm">
      	<input type="hidden" name="movieNm"/>
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
		
		$(".asd").bind("click", function() {
			var seq = $(".asd").val();
			console.log(seq);
			$("#seq").val() = seq;
			document.froms[0].submit();
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