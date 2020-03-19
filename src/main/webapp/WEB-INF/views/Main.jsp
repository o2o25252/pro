<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/jquery-ui.min.css" />
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
	#top{
		
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
	
	<table id="week">
	<colgroup>
		<col width="50px"/>
		<col width="0px"/>
		<col width="*"/>
		<col width="100px"/>
	</colgroup>
	
		<thead>
			<tr>
				<th colspan="4">금일 박스 오피스 순위<hr/></th>
			</tr>
			<tr>
				<th>순위</th>
				<th><input type="hidden" value="영화번호"/></th>
				<th>제목</th>
				<th>개봉일</th>
			</tr>
		</thead>
			<tbody>
			</tbody>
	</table>
	<div class="box"></div>
	
	<table id="weekend">
	
	<colgroup>
		<col width="50px"/>
		<col width="0px"/>
		<col width="*"/>
		<col width="100px"/>
	</colgroup>
		<thead>
			<tr>
			
				<th colspan="4">금주 박스 오피스<hr/></th>
			</tr>
			<tr>
				<th>순위</th>
				<th><input type="hidden" value="영화번호"/></th>
				<th>제목</th>
				<th>개봉일</th>
			</tr>
		</thead>
			<tbody>
				
			</tbody>
	</table>

	
	
		<div id="view_win" style="overflow:scroll; width:500px height:150px;">
         <div id="div2"></div><!-- none  로 숨겨 둠  -->
         <img id="i1" alt="이미지 출력불가시 나올 대체 이미지 자리" src="이미지 경로" width="150" height="200">
         <h3 id="info">${moviInfo.movieNmOg }의상세 보기</h3>
         <hr/>
      	 <label id="m_name">영화명:'${vo.movieNm }'('${moviInfo.movieNmEn}')</label><br/>
         <label id="time">상영시간:'${moviInfo.showTm }'</label><br/> 
         <label id="year">제작연도:'${moviInfo.prdtYear }'</label><br/> 
         <label id="openyear">개봉연도:'${moviInfo.openDt }'</label><br/>
         <label id="genere">장르:'${moviInfo.genreNm }'</label><br/> 

         <!-- -----------------------------------------------  -->
         <hr />
        
               <label id="company">제작사:'${vo.company}'(${vo.companyNmEn })</label><br/>
         <hr/>
               <label id="nations">제작국가:'${vo.nations }'</label><br/>
         <hr/>
               <label id="d_people">감독:'${vo.directors_peopleNm }'(${vo.directors_peopleNmEn })</label><br/>
         <hr/>
               <label id="a_people">배우:'${vo.actors_peopleNm }'&nbsp;'${vo.cast }'역</label><br/>
         <hr/>
         <hr/>
             
         <button type="button" id="close_bt">닫기</button>
   </div>
   
      <form method="post" action="">
      	<input type="hidden" id="seq" value="${ vo.movieCd }">
      </form>
   
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/jquery-ui.min.js"></script>
	<script>
	$(function() {
		
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
						code += "</td><td><input type='hidden' value='";
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
						code += "</td><td><input type=hidden value='";
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
			
		}
	</script>
</body>
</html>