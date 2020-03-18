<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#week,#weekend {
		border: 1px solid black;	
		margin: auto;	
	}
	
	#as{
		float: right;
		line-height: 0;
		margin: auto;
		border: 1px solid black;
		width: 80px;
		height: 90px;
	}
	#dialog{
		display: none;
	}
	table td a{
		text-decoration: none;
	}
	#week{
		
	}
	.box{
		height: 50px;
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
		padding: auto;
		height: 70px;
		margin: auto;
	}
</style>
</head>
<body>
	<div id="logo">
		<a class="logo" href="control">
				<img src="resources/0000803875_001_20200309142116257.jpg" height="70px">
		</a>
	</div>
	<div id="sear">
		<table id="high">
		<tbody>
			<tr>
				<td>
					<input type="text" id="search" name="search" placeholder="검색어를 입력하세요"/>	
				</td>
				<td> <button type="button">확인</button></td>
			</tr>
			</tbody>
		</table>
	</div>
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
	<aside id="as"></aside>
	
	<div id="box"></div>
	<div id="box"></div>
	<table id="week">
	<colgroup>
		<col>
		
	</colgroup>
		<thead>
			<tr>
				<th>주간 순위<hr/></th>
			</tr>
		</thead>
		<c:forEach items="${ Dailyar }" var="vo">
			<tbody>
				<tr>
					<td>${ vo.rnum }</td>
					<td><a href="">${ vo.movieCd }</a></td>
					<td>${ vo.movieNm }</td>
					<td>${ vo.openDt }</td>
				</tr>
			</tbody>
		</c:forEach>
	</table>
	<div class="box"></div>
	<table id="weekend">
		<thead>
			<tr>
				<th>주말 순위<hr/></th>
			</tr>
		</thead>
		<c:forEach items="${ Weeklyar }" var="vo">
			<tbody>
				<tr>
					<td>${ vo.rnum }</td>
					<td><a href="">${ vo.movieCd }</a></td>
					<td>${ vo.movieNm }</td>
					<td>${ vo.openDt }</td>
				</tr>
			</tbody>
		</c:forEach>
	</table>
	
	<form action="" method="post" id="dialog">
		
	</form>
	
	<script>
		
	</script>
</body>
</html>