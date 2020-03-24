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
<link rel="stylesheet" href="resources/css/custom.css"/>
<link rel="stylesheet" href="resources/css/styles.css"/>
<script src="https://cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js?skin=sunburst"></script>
<style type="text/css">


	#view_win {
	   display: none;
	}
	#view_win h3 {
	   margin-left: 40px;
	}
	#view_win i1 {
	   margin-left: 40px;
	}
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
	<div id="top">
	
			<c:if test="${empty ok  }">
				<aside id="as">
					<a href="login.inc">로그인</a>&nbsp; <a href="reg.inc">회원가입</a>
				</aside>
			</c:if>
			<!-- 일반회원 로그인 -->
			<c:if test="${ ok eq 0  }">
				<aside id="as">
					<label>${memvo.m_name }님 화영합니다</label> <a href="out.inc">로그아웃</a>
				</aside>
			</c:if>
			<!-- 관리자 로그인 		-->
			<c:if test="${ ok eq 0 and memvo.m_id eq id }">
				<aside id="as">
					<a href="mem.inc">회원관리</a>
				</aside>
			</c:if>
	<div id="logo">
		<a class="logo" href="main.inc">
				<img src="resources/0000803875_001_20200309142116257.jpg" height="70px">
		</a>
	</div>
	<div id="sear">
		<table id="high">
		<tbody>
			<tr>
				<td>
					<input type="text" id="search" name="search" placeholder="영화제목을 입력하세요" class="form-control"/>	
				</td>
				<td> <input type="button" id="ok_btn" value="확인" class="btn btn-primary"/></td>
			</tr>
			</tbody>
		</table>
	</div>
	</div>
	<div id="menu_header" >
  	<ul id="menu">
		<li class="li"><a href="#">영화</a></li>
    	<li class="li"><a href="#">예매</a></li>
    	<li class="li"><a href="kMap.inc">극장찾기</a></li>
    	<li class="li"><a href="#">이벤트</a> </li>
    	<li class="li"> <a href="#">스토어</a> </li>
    	<li class="li"> <a href="#">혜택</a> </li>
  	</ul>
  </div>
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