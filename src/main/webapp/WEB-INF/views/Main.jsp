
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%
	Date date = new Date();
%>
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
	 <!-- 지도영역 -->
		 <aside id="map">
          	<div style="width:100px;height:200px;"></div>
          	<button onclick="panTo()">지도 중심좌표 부드럽게 이동시키기</button>
          </aside>    	
	<jsp:useBean id="today" class="java.util.Date"/>
	
	<table id="week" class="table table-bordered table-hover">
	<colgroup>
		<col width="50px"/>
		<col width="*"/>
		<col width="100px"/>
	</colgroup>
	
		<thead>
			<tr>
				<th colspan="4"><a href="">&lt;</a>&nbsp;&nbsp;금일 박스 오피스 순위&nbsp;&nbsp;<a href="">&gt;</a><hr/><label>${ today }</label></th>
			</tr>
			<tr>
				<th>순위</th>
				<th>제목</th>
				<th>개봉일</th>
			</tr>
		</thead>
			<tbody>
			</tbody>
	</table>
	<div class="box">
		<hr class="h"/>
		<hr class="h"/>
	</div>
	
	<table id="weekend" class="table table-bordered table-hover">
	
	<colgroup>
		<col width="50px"/>
		<col width="*"/>
		<col width="100px"/>
	</colgroup>
		<thead>
			<tr>
			
				<th colspan="3"><a href="">&lt;</a>&nbsp;&nbsp;금주 박스 오피스&nbsp;&nbsp;<a href="">&gt;</a> <hr/><label>${ today }</label></th>
			</tr>
			<tr>
				<th>순위</th>
				<th>제목</th>
				<th>개봉일</th>
			</tr>
		</thead>
			<tbody>
				
			</tbody>
	</table>
		
		<div  id="view_win" title="영화상세"  style="overflow:auto; width:500px height:250px;">
        
         <img id="i1" alt="이미지 출력불가시 나올 대체 이미지 자리"  width="150" height="200">
         <h3 id="info"></h3>
         <hr/>
      	 <label id="m_name"></label><br/>
         <label id="time"></label><br/> 
         <label id="year"></label><br/> 
         <label id="openyear"></label><br/>
         <label id="genere"></label><br/> 

         <!-- -----------------------------------------------  -->
         <hr />
        
               <label id="company"></label><br/>
         <hr/>
               <label id="nations"></label><br/>
         <hr/>
               <label id="d_people"></label><br/>
         <hr/>
               <label id="a_people"></label><br/>
         <hr/>
         <hr/>
            
               
               
         <button type="button" id="close_bt">닫기</button>
   </div>
   
      <form method="post" action="search.inc" name="nm">
      	<input type="hidden" name="movieNm"/>
      </form>
    </div>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ca457fdc328a1fc208d2b810f0523080"></script>
	<script>
	
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	   var options = { //지도를 생성할 때 필요한 기본 옵션
	      center: new kakao.maps.LatLng(37.559765, 126.942225), //지도의 중심좌표.
	      level: 3 //지도의 레벨(확대, 축소 정도)
	   };

	   var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	   
	   function panTo() {
	       // 이동할 위도 경도 위치를 생성합니다 
	       var moveLatLon = new kakao.maps.LatLng(37.556523, 126.940216);
	       
	       // 지도 중심을 부드럽게 이동시킵니다
	       // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
	       map.panTo(moveLatLon);            
	   }        
	
	$(function() {
		
		day();
		
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
						code += "<input type='hidden' value='";
						code += data.Dailyar[i].movieCd;
						code += "'></td><td><a class='asd' href=\"javascript:go('"+data.Dailyar[i].movieCd+"')\">";
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
						code += "<input type=hidden value='";
						code += data.Weeklyar[i].movieCd;
						code += "'/></td><td><a class='asd' href=\"javascript:go('"+data.Weeklyar[i].movieCd+"')\">";
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
		
		// 상세 정보
		function go(frm){
			
			var paran = "movieCd="+encodeURIComponent(frm);
			
			$.ajax({
				url: "oo.inc",
				type: "POST",
				data: paran,
				dataType : "json"
			}).done(function(data){
				if(data.vo != undefined){
					$("#view_win").dialog();
					
					$("#i1").attr("src", data.vo.postURL);
					
					var code = "영화명: "+data.vo.movieNm+"("+data.vo.movieNmEn+")";
					$("#m_name").html(code);
					var time = "상영시간: "+data.vo.showTm+"분";
					$("#time").html(time);
					var year = "제작년도: "+data.vo.prdtYear+"년";
					$("#year").html(year);
					var openyear = "개봉연도: "+data.vo.openDt;
					$("#openyear").html(openyear);
					var genere = "장르: "+data.vo.genreNm;
					$("#genere").html(genere);	
					var company = "제작사: "+data.vo.companyNm +"("+data.vo.companyNmEn+")";
					$("#company").html(company);
					var nations = "제작국가: "+ data.vo.nationNm;
					$("#nations").html(nations);
					var d_people = "감독: "+ data.vo.directors_peopleNm+"("+data.vo.directors_peopleNmEn+")";
					$("#d_people").html(d_people);
					var info = data.vo.movieNm+"&nbsp;상세보기";
					$("#info").html(info);	
					
				if(data.vo.avo != undefined){
					for(var i=0; i<data.vo.avo.length; i++){
						
					var a_people = "배우:"+ data.vo.avo[i].peopleNm;
					$("#a_people").html(a_people);
					
					}
				}
				}
				
			}).fail(function(err){
				console.log(err);
			});
			
			function day(date) {
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
							code += "<input type='hidden' value='";
							code += data.Dailyar[i].movieCd;
							code += "'></td><td><a class='asd' href=\"javascript:go('"+data.Dailyar[i].movieCd+"')\">";
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
			}
			
		}
	</script>
</body>
</html>