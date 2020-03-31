<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%
	Date today = new Date();
	SimpleDateFormat date = new SimpleDateFormat("YY년MM월dd일");
	SimpleDateFormat nowdate = new SimpleDateFormat("YYYYMMdd");
	SimpleDateFormat dateW = new SimpleDateFormat("YY년 w주차");
	
	String toDay = date.format(today);
	String nowDay = nowdate.format(today);
	String toWeek = dateW.format(today);
	
	request.setAttribute("today", toDay);
	request.setAttribute("nowday", nowDay);
	request.setAttribute("toweek", toWeek);
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
	#view_win h3,#view_win i1 {
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
	<div>
		<jsp:include page="menu.jsp"/>
	</div>
	
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
				<th colspan="4" id="date"><input type="button" style="background-color:transparent;  border:0px transparent solid;" id="datepicker" value="${ today }"/> 박스 오피스 순위<hr/><%-- <input type="text" id="datepicker" name="name" autocomplete="input"/><input type="button" onclick="goday()" value="확인"/>--%> </th>
			
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
				<th colspan="3"><input type="button" style="background-color:transparent;  border:0px transparent solid;" id="datepicker1" value="${ toweek }">박스 오피스<hr/></th>
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
			
		
   </div>
   
	<div id="view_win" title="영화상세">
        
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
         	  <label></label>
         <hr/>
          
         <jsp:include page="kMap2.jsp"/>        
               
         <button type="button" id="close_bt">닫기</button>
   </div>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ca457fdc328a1fc208d2b810f0523080"></script>
	<script>
	
	$(function() {
		$("#datepicker").datepicker({onSelect: function (dateText, inst) {
			goday();
		}});
		
		$("#datepicker1").datepicker({onSelect: function (dateText, inst) {
			goweek();
		}});
		
		 $.datepicker.setDefaults({
            dateFormat: 'yy-mm-dd'  
            ,showOtherMonths: true         //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true     //년도 먼저 나오고, 뒤에 월 표시
            ,changeYear: true             //콤보박스에서 년 선택 가능
            ,changeMonth: true             //콤보박스에서 월 선택 가능         
            ,yearSuffix: "년"             //달력의 년도 부분 뒤에 붙는 텍스트
            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12']                     //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
            ,dayNamesMin: ['일','월','화','수','목','금','토']                                         //달력의 요일 부분 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일']                 //달력의 요일 부분 Tooltip 텍스트
	        });                    
		
		$("#date").bind("click",function(){
			$("#date").datepicker();
		});
		
        $("#open_btn").bind("click", function() {
        	$("#view_win").dialog("option", "width", 8100 );
        });

        $("#close_bt").bind("click", function() {
           $("#view_win").dialog("close");
        });
        
    	 });
	
		$(function(){
			
			var date = $("#datepicker").val().replace('-', "").replace('-',"");
			
			var param = "targetDt="+${nowday};
			
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
			
			
			// 처음 페이지 로딩 시 금주 박스 오피스
			
			var param = "targetDt="+${nowday};
			
			$.ajax({
				url:"weekly.inc",
				dataType:"json",
				data: param,
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
		
		// 금일 날짜 선택 시
		function goday() {
			
			var date = $("#datepicker").val().replace('-', "").replace('-',"");
			
			var param = "targetDt="+encodeURIComponent(date);
			
			var yy = date.substring(2, 4);
			var mm = date.substring(4, 6);
			var dd = date.substring(6);
			
			$("#datepicker").val(yy+"년"+mm+"월"+dd+"일");
			
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
		
		// 금주 달력 선택 시
		function goweek() {
			
			var date2 = $("#datepicker1").val().replace('-', "").replace('-',"");
			
			var param = "targetDt="+encodeURIComponent(date2);
			
			$.ajax({
				url:"next.inc",
				dataType:"json",
				type: "POST",
				data: param
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
					
					$("#datepicker1").val(data.ywt_Y+"년 "+data.ywt_W+"주차");
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