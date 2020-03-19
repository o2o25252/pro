<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
	#search_view td,#search_view th{
		border: 1px solid black;
		border-collapse: collapse;
	}
	#search_view {
		border: 1px solid black;
		border-collapse: collapse;
		margin: auto;
		width: 600px;
		padding: auto;
	}
	#search_view th{
		background-color: #xexexe;
	}
	table td{
		text-align: center;
	}
</style>
</head>
<body>
	<div id="top">
	<aside id="as">
		<a href="">로그인</a>&nbsp;
		<a href="mem.inc">회원가입</a>
	</aside>

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
					<input type="text" id="search" name="search" placeholder="영화제목을 입력하세요"/>	
				</td>
				<td> <button type="button">확인</button></td>
			</tr>
			</tbody>
		</table>
	</div>
	</div>
	<div id="box"></div>
	<div id="menu_header" >
  	<ul id="menu">
		<li class="li"><a href="#">영화</a></li>
    	<li class="li"><a href="#">예매</a></li>
    	<li class="li"><a href="#">극장</a></li>
    	<li class="li"><a href="#">이벤트</a> </li>
    	<li class="li"> <a href="#">스토어</a> </li>
    	<li class="li"> <a href="#">혜택</a> </li>
  	</ul>
  </div>
  <table id="search_view">
  	<thead>
  		<tr>
  			<th> 영화명 </th>
  			<th> 제작연도 </th>
  			<th> 제작국가 </th>
  			<th> 장르 </th>
  		</tr>
  	</thead>
  	<tbody>
  	<c:forEach var="vo" items="${search }">
  		<tr>
  			<td><a href="">${ vo.movieNm}</a></td>
  			<td> ${ vo.prdtYear }</td>
  			<td>${ vo.nationNm }</td>
  			<td>${ vo.genreNm }</td>
  		</tr>
  		</c:forEach>
  	</tbody>
  </table>
  
</body>
</html>