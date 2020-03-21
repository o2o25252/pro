<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%
	Date today = new Date();
	SimpleDateFormat date = new SimpleDateFormat("YY년MM월dd일");
	SimpleDateFormat date1 = new SimpleDateFormat("YYYYMMdd");
	String toDay = date.format(today);
	String today1 = date1.format(today);
	
	request.setAttribute("today", toDay);
	request.setAttribute("nowday", today1);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/jquery-ui.min.css" />
<link rel="stylesheet" href="resources/css/custom.css"/>
<link rel="stylesheet" href="resources/css/styles.css"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
	#menu_header{
		margin : auto;
		border: 1px solid black;
	}
	a:hover{text-decoration:none; color:#6cc091}

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

	<jsp:include page="menu.jsp"/>
  <div id="body">
	
	<table id="week" class="table table-bordered table-hover">
	<colgroup>
		<col width="50px"/>
		<col width="*"/>
		<col width="100px"/>
	</colgroup>
	
		<thead>
			<%-- text 선택 시 달력 발생 하도록 설정 변경 할 사항 있으면 변경 --%>
			<tr>
				<th colspan="4" id="date"><a href="javascript:goday('${ nowday }')">&lt;</a>&nbsp;&nbsp;${ today } 박스 오피스 순위&nbsp;&nbsp;<a href="javascript:goday(${ nowday })">&gt;</a><hr/><input type="text" id="datepicker"/></th>
			
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
				<%-- text 선택 시 달력 발생 하도록 설정 변경 할 사항 있으면 변경 --%>
				<th colspan="3"><a href="">&lt;</a>&nbsp;&nbsp;금주 박스 오피스&nbsp;&nbsp;<a href="">&gt;</a><hr/><input type="text" id="datepicker"/></th>
			</tr>
			<tr>
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
   </div>
    
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ca457fdc328a1fc208d2b810f0523080"></script>
	<script>
	
	$(function() {
		
		$("#datepicker").datepicker();
		
		$("#date").bind("click",function(){
			$("#date").datepicker();
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
			
			// 금일 박스 오피스에 targetDt 값을 받고 넘길시 최신 api가 아니라서 영화 순위가 없음
			
			//var param = "targetDt=${ nowday }";
			//console.log(param);
			
			// 금일 박스 오피스
			$.ajax({
				url:"dd.inc",
				dataType:"json",
				//data: param,
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
		
		// 이전 선택 시
		function goday(day) {
			
			var date = day -1;
			
			var param = "targetDt="+encodeURIComponent(date);
			
			
			
			$.ajax({
				url:"last.inc",
				dataType:"json",
				data: param,
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
		
		// 상세 정보
		function go(frm){
				
			//인비 저블맨 출연진이 안나옴,출연배우들 나오게는 함
			
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
					var a_people = "배우:";
					for(var i=0; i<data.vo.avo.length; i++){
						
					a_people +=  data.vo.avo[i].peopleNm;
					
					}
					
					$("#a_people").html(a_people);
				}
				}
				
			}).fail(function(err){
				console.log(err);
			});
			
			
			
			
		}
	</script>
</body>
</html>