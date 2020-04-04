<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<title>Modern Business - Start Bootstrap Template</title>
<!-- 레이팅 링크 -->
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

<!-- Bootstrap core CSS -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">

<!-- jquery-ui -->
<link rel="stylesheet" href="resources/css/jquery-ui.min.css" />

<style type="text/css">

#view_win {
	display: none;
	background-color : rgba( 255, 255, 255, 0.5 );
	padding: 0px;
}
#week a,#weekend a{
		color : black;
  	}
  	#week{
  		float: center;
  	}
  	
	#view_win1{
		border: 1px solid black;
		float: left;
		padding:auto;
		width: 600px;
		height: 900px;
		margin: auto;
		margin-left: 80px;
	}


</style>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<header>
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<!-- Slide One - Set the background image for this slide in the line below -->
				<div class="carousel-item active" style="background: gray">
					<div id="view_win1" title="영화상세">
		        
				         <img id="i12" width="150" height="200">
				         <h3 id="info1"></h3>
				         <hr/>
				      	 <label id="m_name1"></label><br/>
				         <label id="openyear1"></label><br/>
				         <label id="genere1"></label><br/> 
				
				         <hr />
				        
				               <label id="company1"></label><br/>
				         <hr/>
				               <label id="nations1"></label><br/>
				         <hr/>
				               <label id="d_people1"></label><br/>
				         <hr/>
				               <label id="a_people1"></label><br/>
				         <hr/>
				   </div>
				
					<table id="week" class="table table-bordered table-hover">
						<colgroup>
							<col width="50px" />
							<col width="*" />
							<col width="100px" />
						</colgroup>

						<thead>
							<%-- text 선택 시 달력 발생 하도록 설정 변경 할 사항 있으면 변경 --%>
							<tr>
								<th colspan="4" id="date"><input type="button"
									style="background-color: transparent; border: 0px transparent solid;"
									id="datepicker" value="${ today }" /> 박스 오피스 순위
									<hr />
								</th>

							</tr>
							<tr>
								<th>순위</th>
								<th>제목</th>
								<th>개봉일</th>
							</tr>
						</thead>
						<tbody id="weekTB" class="weekM">
						</tbody>
					</table>
				</div>
				<!-- Slide Two - Set the background image for this slide in the line below -->
				<div class="carousel-item" style="background: gray">
					<div id="view_win1" title="영화상세">
		        
				         <img id="i13" width="150" height="200">
				         <hr/>
				      	 <label id="m_name2"></label><br/>
				         <label id="openyear2"></label><br/>
				         <label id="genere2"></label><br/> 
				
				         <hr />
				        
				               <label id="company2"></label><br/>
				         <hr/>
				               <label id="nations2"></label><br/>
				         <hr/>
				               <label id="d_people2"></label><br/>
				         <hr/>
				               <label id="a_people2"></label><br/>
				         <hr/>
				   </div>
				
					<table id="weekend" class="table table-bordered table-hover">

						<colgroup>
							<col width="50px" />
							<col width="*" />
							<col width="100px" />
						</colgroup>

						<thead>
							<tr>
								<%-- text 선택 시 달력 발생 하도록 설정 변경 할 사항 있으면 변경 --%>
								<th colspan="3"><input type="button"
									style="background-color: transparent; border: 0px transparent solid;"
									id="datepicker1" value="${ toweek }">박스 오피스
									<hr /></th>
							</tr>
							<tr>
							</tr>
							<tr>
								<th>순위</th>
								<th>제목</th>
								<th>개봉일</th>
							</tr>
						</thead>
						<tbody class='weekendM'>
						</tbody>
					</table>
				</div>
				<!-- Slide Three -->
				<div class="carousel-item" style="background: gray">
					<jsp:include page="chartExO2.jsp" />
				</div>
			</div>


			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</header>


	<div id="view_win" title="영화상세">
		<div id="tabs">
			<ul>
				<li><a href="#tabs1">상세보기</a></li>
				<li><a href="#tabs2">평가</a></li>
			</ul>
			<div id="tabs1">
				<img id="i1" alt="이미지 출력불가시 나올 대체 이미지 자리" width="150" height="200">
		<h3 id="info"></h3>
		<hr />
		<label id="m_name"></label><br /> <label id="time"></label><br /> <label
			id="year"></label><br /> <label id="openyear"></label><br /> <label
			id="genere"></label><br />

		<!-- -----------------------------------------------  -->
		<hr />

		<label id="company"></label><br />
		<hr />
		<label id="nations"></label><br />
		<hr />
		<label id="d_people"></label><br />
		<hr />
		<label id="a_people"></label><br />
		<hr />
		<label></label>
		<hr />
		<jsp:include page="kMap2.jsp" />
		<button type="button" id="close_bt">닫기</button>
			</div>
					<!-- 레이팅  -->
					<div id="tabs2">
								<form action="coco.inc" method="post">
									<input type="hidden" id="ratinggg">
									<hr/>
									<!-- 레이팅  -->
									<div class="form-group" id="rating-ability-wrapper">
									    <label class="control-label" for="rating">
									    <span class="field-label-header">영화 리뷰 평가 </span><br>
									    <span class="field-label-info"></span>
									    <input type="hidden" id="selected_rating" name="selected_rating" value="" required="required">
									    </label>
									    <h3 class="bold rating-header" style="">
									    <span id="ratingVal" class="selected-rating">0</span><small> / 5</small>
									    </h3>
									    <button type="button" class="btnrating btn btn-default btn-lg" data-attr="1" id="rating-star-1">
									        <i class="fa fa-star" aria-hidden="true"></i>
									    </button>
									    <button type="button" class="btnrating btn btn-default btn-lg" data-attr="2" id="rating-star-2">
									        <i class="fa fa-star" aria-hidden="true"></i>
									    </button>
									    <button type="button" class="btnrating btn btn-default btn-lg" data-attr="3" id="rating-star-3">
									        <i class="fa fa-star" aria-hidden="true"></i>
									    </button>
									    <button type="button" class="btnrating btn btn-default btn-lg" data-attr="4" id="rating-star-4">
									        <i class="fa fa-star" aria-hidden="true"></i>
									    </button>
									    <button type="button" class="btnrating btn btn-default btn-lg" data-attr="5" id="rating-star-5">
									        <i class="fa fa-star" aria-hidden="true"></i>
										</button>
									</div>
									<!-- ----------------------댓글작성부분------------------- -->
									<textarea rows="8" cols="50" name="content" id="content"></textarea>
									<br/>
									<input type="button" value="등록" onclick="gogo()"/>
									<hr/>
									<!-- 댓글내용  표현-->
									<!-- 아코디언 부분  -->
									<div id="accordion">
										
									  
									</div>
								</form>
								<button type="button" id="close_bt2">닫기</button>
					</div>
		</div>
	</div>
	
	<!-- Bootstrap core JavaScript -->
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/jquery-ui.min.js"></script>
	<script src="resources/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
	var moviecode = "";
	
	$(function(){
		//레이팅 JS 
		jQuery(document).ready(function($){
	    
			$(".btnrating").on('click',(function(e) {
			
			var previous_value = $("#selected_rating").val();
			
			var selected_value = $(this).attr("data-attr");
			$("#selected_rating").val(selected_value);
			
			$(".selected-rating").empty();
			$(".selected-rating").html(selected_value);
			
			for (i = 1; i <= selected_value; ++i) {
				$("#rating-star-"+i).toggleClass('btn-warning');
				$("#rating-star-"+i).toggleClass('btn-default');
			}
			
			for (ix = 1; ix <= previous_value; ++ix) {
				$("#rating-star-"+ix).toggleClass('btn-warning');
				$("#rating-star-"+ix).toggleClass('btn-default');
			}
				$("#ratinggg").val(selected_value);
			}));
		});
		
		//아코디언	
		 $( "#accordion" ).accordion({
     			 collapsible: true
  		  });
		
		
		$("#close_bt").bind("click", function() {
			$("#view_win").dialog("close");				// dialog 닫을경우 dialog 내용 삭제
			$("#accordion").html("");
		});
		$("#close_bt2").bind("click", function() {
			$("#view_win").dialog("close");
			$("#accordion").html("");
		});

		$( "#tabs" ).tabs();
		
		// 금일 박스 오피스
		var param = "targetDt="+${nowday-1};
		
		$.ajax({
			url:"last.inc",
			dataType:"json",
			data: param,
			type: "POST"
		}).done(function(data){
			if(data.Dailyar != undefined){
				var code = "";
				
				for(var i=0; i<data.Dailyar.length; i++){

					code += "<tr class='ye'><td>";
					code += data.Dailyar[i].rnum;
					code += "<input type=hidden value='";
					code += data.Dailyar[i].movieCd;
					code += "'/></td><td><a class='elice' href=\"javascript:go('"+data.Dailyar[i].movieCd+"')\">";
					code += data.Dailyar[i].movieNm;
					code += "</a></td><td>";
					code += data.Dailyar[i].openDt;
					code += "</td></tr>";
				}
				$("#week>tbody").html(code);
				
				// 금일 순위 마우스 위치 시 옆의 내용 변환
				$(".weekM tr").mouseover(function(){
			  		
					
					var cd = $(this).children().eq(0).children().eq(0).val();
			  		
			  		var paran = "movieCd="+encodeURIComponent(cd);
			  		
			  		$.ajax({
						url: "oo.inc",
						type: "POST",
						data: paran,
						dataType : "json"
					}).done(function(data){
						if(data.vo != undefined){
							
							$("#i12").attr("src", data.vo.postURL);
							
							var code = "영화명: "+data.vo.movieNm+"("+data.vo.movieNmEn+")";
							$("#m_name1").html(code);
							var openyear = "개봉연도: "+data.vo.openDt;
							$("#openyear1").html(openyear);
							var genere = "장르: "+data.vo.genreNm;
							$("#genere1").html(genere);	
							var company = "제작사: "+data.vo.companyNm +"("+data.vo.companyNmEn+")";
							$("#company1").html(company);
							var nations = "제작국가: "+ data.vo.nationNm;
							$("#nations1").html(nations);
							var d_people = "감독: "+ data.vo.directors_peopleNm+"("+data.vo.directors_peopleNmEn+")";
							$("#d_people1").html(d_people);
							
							if(data.vo.avo != undefined){
					               var a_people = "배우:";
					               for(var i=0; i<data.vo.avo.length; i++){
					                  a_people +=  data.vo.avo[i].peopleNm;
					                  a_people +=  " / ";               
					               }
					               $("#a_people1").html(a_people);
					            }
						}
						
					}).fail(function(err){
						console.log(err);
					});
					
					
				});
				
			}
		}).fail(function(err){
			console.log(err);
		});
		
		
		// 처음 페이지 로딩 시 금주 박스 오피스
		var param = "targetDt="+${nowday-7};
		
		$.ajax({
			url:"next.inc",
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
				
				// 금주 순위에 포커스 위치 시 옆에 변환
				$(".weekendM tr").mouseover(function(){
		  		
				
				var cd = $(this).children().eq(0).children().eq(0).val();
		  		
		  		var paran = "movieCd="+encodeURIComponent(cd);
		  		
		  		$.ajax({
					url: "oo.inc",
					type: "POST",
					data: paran,
					dataType : "json"
				}).done(function(data){
					if(data.vo != undefined){
						
						$("#i13").attr("src", data.vo.postURL);
						
						var code = "영화명: "+data.vo.movieNm+"("+data.vo.movieNmEn+")";
						$("#m_name2").html(code);
						var openyear = "개봉연도: "+data.vo.openDt;
						$("#openyear2").html(openyear);
						var genere = "장르: "+data.vo.genreNm;
						$("#genere2").html(genere);	
						var company = "제작사: "+data.vo.companyNm +"("+data.vo.companyNmEn+")";
						$("#company2").html(company);
						var nations = "제작국가: "+ data.vo.nationNm;
						$("#nations2").html(nations);
						var d_people = "감독: "+ data.vo.directors_peopleNm+"("+data.vo.directors_peopleNmEn+")";
						$("#d_people2").html(d_people);
						
						if(data.vo.avo != undefined){
				               var a_people = "배우:";
				               for(var i=0; i<data.vo.avo.length; i++){
				                  a_people +=  data.vo.avo[i].peopleNm;
				                  a_people +=  " / ";               
				               }
				               $("#a_people2").html(a_people);
				            }
					}
					
				}).fail(function(err){
					console.log(err);
				});
				
				
			});
			}
		}).fail(function(err){
			console.log(err);
		});
	});
  
	// 영화 상세정보 보기
	function go(frm){
										//인비 저블맨 출연진이 안나옴,출연배우들 나오게는 함
		var paran = "movieCd="+encodeURIComponent(frm);
		moviecode= frm;// 멤버변수 쓰깅 
		$.ajax({
			url: "oo.inc",
			type: "POST",
			data: paran,
			dataType : "json"
		}).done(function(data){
			if(data.vo != undefined){
				$("#view_win").dialog({width: "600px", padding: "0px"}).parents(".ui-dialog").find(".ui-dialog-titlebar").remove();
				
				$("#i1").attr("src", data.vo.postURL);
				//var rating ="별점:"+
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
		                  a_people +=  " / ";               
		               }
		               $("#a_people").html(a_people);
		            }
		}//if의 끝
		
			gogo2();
		
		}).fail(function(err){
			console.log(err);
		});
	}
	
	//댓글 표현 함수 
	function gogo2() {
		
		var par = "movieCd="+encodeURIComponent(moviecode);
		
		$.ajax({
			url: "getComm.inc",
			type: "POST",
			data: par,
			dataType : "json"
		}).done(function(data){
			if(data.commAr != undefined){
				
				for(var i = 0; i<data.commAr.length; i++){
					var code = "";
					code += "<h3>";
					code += data.commAr[i].writer;
					code += "</h3>";
					code += "<div><label>";
					code += data.commAr[i].content;
					code += "</label></div>";
					$("#accordion").append(code);
				}				
				
			}
		}).fail(function(err){
			
		});
	}
	
	//댓글 등록 함수 
	function gogo() {
		var rating = $("#ratinggg").val(); 
		var content =$("#content").val();
		console.log(moviecode+"/"+rating+"/"+content); 
		var par = "movieCd="+encodeURIComponent(moviecode)+"&rating="+encodeURIComponent(rating)+"&content="+encodeURIComponent(content);
		$.ajax({
			url: "coco.inc",
			type: "POST",
			data: par,
			dataType : "json"
		}).done(function(data){
			
			$("#ratingVal").text("0");
			$("#content").val("");
			$("#selected_rating").val("");
			for (i = 1; i <= 5; ++i) {
				$("#rating-star-"+i).removeClass('btn-warning');
				$("#rating-star-"+i).addClass('btn-default');
			}
			
			if(data.svo != undefined){
				
				var code = "";
				code += "<h3>";
				code += data.svo.writer;
				code += "</h3>";
				code += "<div><label>";
				code += data.svo.content;
				code += "</label></div>";
				
				$("#accordion").append(code);
			}
		}).fail(function(err){
			
		});
	}
  </script>
</body>
</html>