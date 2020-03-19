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
		width: 500px;
	}
	td{
		text-align: center;
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
		<a class="logo" href="main.inc">
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
  <div id="box"></div>
	
	<div id="box"></div>
	<div id="box"></div>
	<table id="week">
	<colgroup>
		<col width="10px"/>
		<col width="0px"/>
		<col width="*"/>
		<col width="100px"/>
	</colgroup>
		<thead>
			<tr>
				<th colspan="4">금일 박스 오피스 순위<hr/></th>
			</tr>
		</thead>
			<tbody>
			</tbody>
	</table>
	<div class="box"></div>
	
	<table id="weekend">
	<colgroup>
		<col width="10px"/>
		<col width="0px"/>
		<col width="*"/>
		<col width="100px"/>
	</colgroup>
		<thead>
			<tr>
				<th colspan="4">금주 박스 오피스<hr/></th>
			</tr>
		</thead>
			<tbody>
				
			</tbody>
	</table>

	
	<form action="" method="post" id="dialog">
		
	</form>
	
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/jquery-ui.min.js"></script>
	<script>
		
		$(function(){
			
			// 금일 박스 오피스
			$.ajax({
				url:"dd.inc",
				dataType:"json",
				type: "POST"
			}).done(function(data){
				if(data.Dailyar != undefined){
					
					var code = "";
					for(var i=0; i<data.Dailyar.length; i++){
						code += "<tr><td>";
						code += data.Dailyar[i].rnum;
						code += "</td><td><input type=hidden value='";
						code += data.Dailyar[i].movieCd;
						code += "'/></td><td><a href=''>";
						code += data.Dailyar[i].movieNm;
						code += "</a></td><td>";
						code += data.Dailyar[i].openDt;
						code += "</td></tr>";
					}
					$("#week>tbody").html(code);
				}
			}).fail(function(err){
				console.log(err);
			});
			
			// 금주 박스 오피스
			$.ajax({
				url:"weekly.inc",
				dataType:"json",
				type: "POST"
			}).done(function(data){
				if(data.Weeklyar != undefined){
					
					var code = "";
					for(var i=0; i<data.Weeklyar.length; i++){
						code += "<tr><td>";
						code += data.Weeklyar[i].rnum;
						code += "</td><td><input type=hidden value='";
						code += data.Weeklyar[i].movieCd;
						code += "'/></td><td><a href=''>";
						code += data.Weeklyar[i].movieNm;
						code += "</a></td><td>";
						code += data.Weeklyar[i].openDt;
						code += "</td></tr>";
					}
					
					$("#weekend>tbody").html(code);
				}
			}).fail(function(err){
				console.log(err);
			});
			
		});
		
		function go(no){
			
			
			
		}
	</script>
</body>
</html>