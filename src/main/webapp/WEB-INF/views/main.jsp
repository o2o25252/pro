<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	Date today = new Date();
	SimpleDateFormat date = new SimpleDateFormat("YY년MM월dd일");
	SimpleDateFormat dateW = new SimpleDateFormat("YY년 w주차");
	
	String toDay = date.format(today);
	String toWeek = dateW.format(today);
	
	request.setAttribute("today", toDay);
	request.setAttribute("toweek", toWeek);
	 
	SimpleDateFormat date1 = new SimpleDateFormat("YYYYMMdd");
	
	Calendar yDay = Calendar.getInstance();
	yDay.add(Calendar.DATE , -1);

	Calendar yWeek = Calendar.getInstance();
	yWeek.add(Calendar.DATE , -7);
	yWeek.set(Calendar.DAY_OF_WEEK,Calendar.MONDAY);
	
	String beforeD = date1.format(yDay.getTime());
	String beforeW = date1.format(yWeek.getTime());
	
	request.setAttribute("beforeD", beforeD);
	request.setAttribute("beforeW", beforeW);
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

<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
	#view_win {
		display: none;
		background-color : rgba( 255, 255, 255, 0 );
	}
	#week a,#weekend a{
		text-decoration: none;
		color: #000000;
		float: left;
  	}
  	#week{
  		width: 490px;
  		height: 435px;
  	}
  	#weekend{
  		width: 490px;
  		height: 435px;
  	}
  	.trBorder{
  		border-bottom: 1px solid rgba(80, 80, 80, 0);
  	}
	.view_win{
		float: left;
		text-align: left;
		width: 254px;		
		height: 414px;
		margin-left: 20px;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
	}
	.m_img{
		float: left;
		width: 290px;
		height: 410px;
	}
	dt{
		display:  inline-block;
		width: 65px;
		height: 20px;
		margin-right: 20px;
	}
	.category{
		font-size: 14px;
		font-weight: bold;
	}
	dd{
		display:  inline-block;
		width: 165px;
		height: 20px;
		font-size: 14px;
		color: #2A2A2A;
		margin-bottom: 5px;
	}
	#chart{
		margin: auto;
	}
	#tit{
		position: relative;
	    font-size: 30px;
	    text-align: center;
	    font-weight: bold;
	    line-height: 1;
	    letter-spacing: -0.01em;
	    margin: auto;
	    margin-top: 40px;
	    padding: auto;
	    width: auto;
	}
	#tit:before{
		position: absolute;
	    top: 50%;
	    left: 0;
	    width: 425px;
	    height: 1px;
	    background: url(resources/css/images/bg30.png);
	    content: '';
	}
	#tit:after{
		position: absolute;
	    top: 50%;
	    right: 0;
	    width: 425px;
	    height: 1px;
	    background: url(resources/css/images/bg60.png);
	    content: '';
	}
	.ico_comm{
		background: url(resources/css/images/ico_comm.png) 0 0 no-repeat;
	    font-size: 0;
	    line-height: 0;
	    text-indent: -9999px;
	    width: 20px;
	    height: 20px;
	    background-position: -40px -25px;
	    display: inline-block;
	}
	#c_info{
		padding: 60px 0;
	    background: url(resources/css/images/product_bg.jpg) 0 0 no-repeat;
	    background-size: cover;
	    margin-top: 25px;
	}
	#ico{
		float: right;
		margin: auto;
		margin-top: 8px;
	}
	#tit2{
		position: relative;
	    font-size: 22px;
	    font-weight: bold;
	    margin: auto;
	}
	#c_information{
		width: 30%;
		margin-left: 130px;
	}
	#c_subject{
		width: 65%;
	}
	#c_date{
		width: 35%;
	}
	#c_infotable{
		width: 100%;
		border-top: 2px solid black;
	}
	.divpop {
	  	position: absolute; 
	  	display:none;
  	}
  .button_area {position:absolute;bottom:0;left:10px;} 
</style>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<header>
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
			</ol>
			<div class="carousel-inner" role="listbox"
				style="background: linear-gradient(-45deg, rgb(46, 53, 56), rgb(243, 245, 246));">
				<!-- 금일 순위 -->
				<!-- Slide One - Set the background image for this slide in the line below -->
				<div class="carousel-item active" style="height: 694px;">
					<table style="margin: auto; margin-top: 100px">
						<thead>
							<tr>
								<th colspan="2" id="date"><label>${ today } 박스 오피스 순위</label></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<div id="">
										<div class="m_img">
											<img id="i12" width="290" height="410">
										</div>
										<div class="view_win" style="">
											<label id="m_name1"></label><br />
											<hr />
											<dt class="category">개봉일</dt><dd id="openyear1"></dd><br />
											<dt class="category">제작상태</dt><dd id="prdtStatNm1"></dd><br />
											<dt class="category">영화구분</dt><dd id="typeNm1"></dd><br />
											<hr />
											<dt class="category">관람등급</dt><dd id="watchGradeNm1"></dd><br />
											<dt class="category">상영시간</dt><dd id="showTm1"></dd><br />
											<dt class="category">제작국가</dt><dd id="nations1"></dd><br />
											<hr />
											<dt class="category">감독</dt><dd id="d_people1"></dd><br />
											<dt class="category">장르</dt><dd id="genere1"></dd><br />
											<dt class="category">배급사</dt><dd id="company1"></dd><br />
											<hr />
										</div>
									</div>
								</td>
								<td>
									<table id="week" class="table-hover" style="margin-left: 45px; border: 0px solid;">
										<colgroup>
											<col width="60px" />
											<col width="*" />
											<col width="150px" />
										</colgroup>
										<thead style="border-bottom: 2px solid black; text-align: left;">
											<tr>
												<th></th>
												<th>영화명</th>
												<th>개봉일</th>
											</tr>
										</thead>
										<tbody id="weekTB" class="weekM" style="text-align: left; border: 0px solid;">
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- Slide Two - Set the background image for this slide in the line below -->
				<!-- 주간 순위 -->
				<div class="carousel-item" style="height: 694px;">
					<table style="margin: auto; margin-top: 100px">
						<thead>
							<tr>
								<th colspan="2"><label>${ toweek }박스 오피스</label></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<div class="m_img">
										<img id="i13" width="290" height="410">
									</div>
									<div class="view_win" title="영화상세">
										<hr />
										<dt class="category">개봉일</dt><dd id="openyear2"></dd><br />
										<dt class="category">제작상태</dt><dd id="prdtStatNm2"></dd><br />
										<dt class="category">영화구분</dt><dd id="typeNm2"></dd><br />
										<hr />
										<dt class="category">관람등급</dt><dd id="watchGradeNm2"></dd><br />
										<dt class="category">상영시간</dt><dd id="showTm2"></dd><br />
										<dt class="category">제작국가</dt><dd id="nations2"></dd><br />
										<hr />
										<dt class="category">감독</dt><dd id="d_people2"></dd><br />
										<dt class="category">장르</dt><dd id="genere2"></dd><br />
										<dt class="category">배급사</dt><dd id="company2"></dd><br />
										<hr />
									</div>
								</td>
								<td>
									<table id="weekend" class="table-hover" style="margin-left: 45px; border: 0px solid;">
										<colgroup>
											<col width="60px" />
											<col width="*" />
											<col width="150px" />
										</colgroup>
										<thead style="border-bottom: 2px solid black; text-align: left;">
											<tr>
												<th></th>
												<th>영화명</th>
												<th>개봉일</th>
											</tr>
										</thead>
										<tbody class='weekendM' style="text-align: left; border: 0px solid;">
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- Slide Three -->
				<div class="carousel-item" style="height: 694px;">
					<div style="margin: auto; text-align: center;">
						<jsp:include page="chartExO2.jsp" />
					</div>
				</div>
			</div>
			
			<div id="divpop1" class="divpop" style="position: absolute; right: 11%; top: 230px; z-index: 200; visibility: visible;">
				<table style="width: 490px; height: 340px;">
					<tbody>
						<tr>
							<td style="height: 340px; text-align: center; background-color: white">
								<a href="">
									
								</a>
							</td>
						</tr>
						<tr>
							<td style="height: 5px; background-color: #000000;"></td>
						</tr>
						<tr>
							<td style="height: 25px; text-align: right; background-color: #000000; display: block; padding: 0px 20px;">
								<div class="button_area">
									<input type="checkbox" id="todaycloseyn" name="chkbox"><font style="color: #eee; margin-right: 15px;">오늘 하루 이 창을 열지 않습니다.</font>
									<a href="#" id="chkclose" onclick="javascript:closeWin(1);">
										<font style="color: #eeeeee">
											<b>[닫기]</b>
										</font>
									</a>
								</div>	
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> 
				<span class="sr-only">Previous</span>
			</a> 
			<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next"> 
				<span class="carousel-control-next-icon" aria-hidden="true"></span> 
				<span class="sr-only">Next</span>
			</a>
		</div>
	</header>
	
	<div id="c_info">
		
		<div id="c_information" class="container">
			<div id="information">
				<h3 id="tit2">공지사항<a href="notice.inc"><span class="ico_comm" id="ico"></span> </a></h3>
			</div>
			<table id="c_infotable">
				<tbody id="c_body"> 
					<tr>
						<td>
							<table  class="table table-hover">
								<tbody>	
									<c:forEach var="vo" items="${ list }" begin="0" end="4">
										<tr>
											<td id="c_subject">
												<a href="b_view.inc?nowPage=${nowPage}&b_idx=${vo.b_idx}">
													${vo.subject }
												</a>
											</td>	
											<td id="c_date">${fn:substring(vo.write_date,0,10)}</td>
										</tr>
									</c:forEach>
								</tbody>	
								<%-- list 에 없을떄 목록에 없습니다. 표시용 --%>
								<c:if test="${empty  list }">
									<tr><td colspan="5">작성된 공지가 없습니다.</td></tr>
								</c:if>
							</table>
						</td>
					</tr>
				</tbody>
				
			</table>
		</div>
	</div>
	<div id="view_win" title="영화상세">
		<div id="tabs">
			<ul>
				<li><a href="#tabs1">상세보기</a></li>
				<li><a href="#tabs2">평가</a></li>
			</ul>
			<div id="tabs1">
				<img id="i1" alt="이미지 출력불가시 나올 대체 이미지 자리" width="150" height="200">
				<div style="display: inline-block; float: right; border: 3px solid red;">
					<div class="wrap-star">
						<h5 style="text-align: center;">네이버 평점</h5>
						<div class='star-rating'>
							<span id="nRating" style="width: 30%"></span>
						</div>
					</div>
					<div class="wrap-star">
						<h5 style="text-align: center;">KINEMA 평점</h5>
						<div class='star-rating'>
							<span id="hRating" style="width: 30%"></span>
						</div>
					</div>
				</div>
				<h3 id="info"></h3>
				<hr />
				<label id="m_name"></label><br />
				<label id="time"></label><br />
				<label id="year"></label><br />
				<label id="openyear"></label><br />
				<label id="genere"></label><br />
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
					<hr />
					<!-- 레이팅  -->
					<div class="form-group" id="rating-ability-wrapper">
						<label class="control-label" for="rating"> <span
							class="field-label-header">영화 리뷰 평가 </span><br> <span
							class="field-label-info"></span> <input type="hidden"
							id="selected_rating" name="selected_rating" value=""
							required="required">
						</label>
						<h3 class="bold rating-header" style="">
							<span id="ratingVal" class="selected-rating">0</span><small>
								/ 5</small>
						</h3>
						<button type="button" class="btnrating btn btn-default btn-lg"
							data-attr="1" id="rating-star-1">
							<i class="fa fa-star" aria-hidden="true"></i>
						</button>
						<button type="button" class="btnrating btn btn-default btn-lg"
							data-attr="2" id="rating-star-2">
							<i class="fa fa-star" aria-hidden="true"></i>
						</button>
						<button type="button" class="btnrating btn btn-default btn-lg"
							data-attr="3" id="rating-star-3">
							<i class="fa fa-star" aria-hidden="true"></i>
						</button>
						<button type="button" class="btnrating btn btn-default btn-lg"
							data-attr="4" id="rating-star-4">
							<i class="fa fa-star" aria-hidden="true"></i>
						</button>
						<button type="button" class="btnrating btn btn-default btn-lg"
							data-attr="5" id="rating-star-5">
							<i class="fa fa-star" aria-hidden="true"></i>
						</button>
					</div>
					<!-- ----------------------댓글작성부분------------------- -->
					<textarea rows="8" cols="50" name="content" id="content"></textarea>
					<br /> <input type="button" value="등록" onclick="writeRating()" />
					<hr />
					<!-- 댓글내용  표현-->
					<!-- 아코디언 부분  -->
					<div id="accordion"></div>
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
		var param = "targetDt="+${beforeD};
		
		$.ajax({
			url:"http://localhost:5000/dailyRank?setDate=${beforeD}",
			dataType:"json",
			type: "POST"
		}).done(function(data){
			if(data != undefined){
				var code = "";
				
				for(var i=0; i<data.length; i++){
					code += "<tr class='trBorder'><td>";
					code += data[i].rank;
					code += "<input type=hidden value='";
					code += data[i].movieCd;
					code += "'/></td><td><a class='elice' href=\"javascript:movieDetailInfo('"+data[i].movieCd+"')\">";
					code += data[i].movieNm;
					code += "</a></td><td>";
					code += data[i].openDt;
					code += "</td></tr>";
				}
				$("#week>tbody").html(code);
				
				// 금일 순위 마우스 위치 시 옆의 내용 변환
				$(".weekM tr").mouseenter(function(){
			  		
					var cd = $(this).children().eq(0).children().eq(0).val();
			  		
			  		var paran = "movieCd="+encodeURIComponent(cd);
			  		
			  		$.ajax({
						url: "movieSimpleInfo.inc",
						type: "POST",
						data: paran,
						dataType : "json"
					}).done(function(data){
						if(data.vo != undefined){
							$("#i12").attr("src", data.vo.postURL);
		                     
							var code = ""+data.vo.movieNm;
							$("#m_name1").html(code);
							var openyear = ""+data.vo.openDt.substring(0,4)+"-"+data.vo.openDt.substring(4,6)+"-"+data.vo.openDt.substring(6);
							$("#openyear1").html(openyear);
		                    
							var prdtStatNm = data.vo.prdtStatNm;
							$("#prdtStatNm1").html(prdtStatNm);
		                     
							var typeNm = data.vo.typeNm;
							$("#typeNm1").html(typeNm);
		                     
							var watchGradeNm = data.vo.watchGradeNm;
							$("#watchGradeNm1").html(watchGradeNm);
		                     
							var showTm = data.vo.showTm;
							$("#showTm1").html(showTm);
		                                          
							var genere = ""+data.vo.genreNm;
							$("#genere1").html(genere);   
							var company = ""+data.vo.companyNm;
							$("#company1").html(company);
							var nations = ""+ data.vo.nationNm;
							$("#nations1").html(nations);
							var d_people = ""+ data.vo.directors_peopleNm;
							$("#d_people1").html(d_people);
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
		$.ajax({
			url:"http://localhost:5000/weeklyRank?setDate=${beforeW}",
			dataType:"json",
			type: "POST"
		}).done(function(data){
			if(data != undefined){
				var code = "";
				for(var i=0; i<data.length; i++){
					code += "<tr class='trBorder'><td>";
					code += data[i].rank;
					code += "<input type=hidden value='";
					code += data[i].movieCd;
					code += "'/></td><td><a href=\"javascript:movieDetailInfo('"+data[i].movieCd+"')\">";
					code += data[i].movieNm;
					code += "</a></td><td>";
					code += data[i].openDt;
					code += "</td></tr>";
				}
			
				$("#weekend>tbody").html(code);
				
				// 금주 순위에 포커스 위치 시 옆에 변환
				$(".weekendM tr").mouseenter(function(){
			  		var cd = $(this).children().eq(0).children().eq(0).val();
			  		var paran = "movieCd="+encodeURIComponent(cd);
			  		
			  		$.ajax({
						url: "movieSimpleInfo.inc",
						type: "POST",
						data: paran,
						dataType : "json"
					}).done(function(data){
						if(data.vo != undefined){
							$("#i13").attr("src", data.vo.postURL);
			                  
							var code = ""+data.vo.movieNm;
							$("#m_name2").html(code);
							var openyear = ""+data.vo.openDt.substring(0,4)+"-"+data.vo.openDt.substring(4,6)+"-"+data.vo.openDt.substring(6);
							$("#openyear2").html(openyear);
			                  
							var prdtStatNm = data.vo.prdtStatNm;
							$("#prdtStatNm2").html(prdtStatNm);
			                  
							var typeNm = data.vo.typeNm;
							$("#typeNm2").html(typeNm);
			                  
							var watchGradeNm = data.vo.watchGradeNm;
							$("#watchGradeNm2").html(watchGradeNm);
			                  
							var showTm = data.vo.showTm;
							$("#showTm2").html(showTm);
			                  
							var genere = ""+data.vo.genreNm;
							$("#genere2").html(genere);   
							var company = ""+data.vo.companyNm;
							$("#company2").html(company);
							var nations = ""+ data.vo.nationNm;
							$("#nations2").html(nations);
							var d_people = ""+ data.vo.directors_peopleNm;
							$("#d_people2").html(d_people);
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
	function movieDetailInfo(frm){
		var paran = "movieCd="+encodeURIComponent(frm);
		moviecode= frm;	// 멤버변수 사용
		$.ajax({
			url: "movieDetailInfo.inc",
			type: "POST",
			data: paran,
			dataType : "json"
		}).done(function(data){
			if(data.vo != undefined){
				$("#view_win").dialog({width: "600px", padding: "0px"}).parents(".ui-dialog").find(".ui-dialog-titlebar").remove();
				$("#i1").attr("src", data.vo.postURL);
				
				// var rating ="별점:"+ data.vo.nRating;			
				if(data.vo.nRating != "null"){
					var nRating = Math.round(Number(data.vo.nRating)*10);
					console.log(nRating);
					$("#nRating").css("width", nRating+"%");					
				}else{
					$("#nRating").css("width", "0%");
				}	
				
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
				var info = data.vo.movieNm+"&nbsp;";
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
			printRating();
		}).fail(function(err){
			console.log(err);
		});
	}
	
	// 평점 표현 함수 
	function printRating() {
		var par = "movieCd="+encodeURIComponent(moviecode);
		$.ajax({
			url: "printRating.inc",
			type: "POST",
			data: par,
			dataType : "json"
		}).done(function(data){
			if(data.commAr != undefined){
				for(var i = 0; i<data.commAr.length; i++){
					console.log(data.commAr[i].rating);
					var code = "";
					code += "<h3>";
					code += data.commAr[i].writer;
					code += "</h3>";
					
					code += "<div id='rate'><label style='color:#FFC107;'>";
	                code += data.commAr[i].rating+"점";
	                code += "</label></div>";
	                
					code += "<div><label>";
					code += data.commAr[i].content;
					code += "</label></div>";
					$("#accordion").append(code);
				}
				$("#rate").val("");
			}
		}).fail(function(err){
		});
	}
	
	// 평점 등록 함수 
	function writeRating() {
		var rating = $("#ratinggg").val(); 
		var content =$("#content").val();
		$("#ratinggg").val("0"); 
		var par = "movieCd="+encodeURIComponent(moviecode)+"&rating="+encodeURIComponent(rating)+"&content="+encodeURIComponent(content);
		$.ajax({
			url: "writeRating.inc",
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
				
				code += "<div><label style='color:#FFC107;'>";
                code += data.svo.rating+"점";
                code += "</label></div>";
				
				code += "<div><label>";
				code += data.svo.content;
				code += "</label></div>";
				
				$("#accordion").append(code);
			}
		}).fail(function(err){
			alert("재시도");
		});
	}
	//쿠키설정	
	function setCookie( name, value, expiredays ){
	    var todayDate = new Date();
	    todayDate.setDate( todayDate.getDate() + expiredays );
	    document.cookie = name + '=' + escape( value ) + '; path=/; expires=' + todayDate.toGMTString() + ';'
	}

	//쿠키 불러오기
	function getCookie(name) 
	{ 
	    var obj = name + "="; 
	    var x = 0; 
	    while ( x <= document.cookie.length ) 
	    { 
	        var y = (x+obj.length); 
	        if ( document.cookie.substring( x, y ) == obj ) 
	        { 
	            if ((endOfCookie=document.cookie.indexOf( ";", y )) == -1 ) 
	                endOfCookie = document.cookie.length;
	            return unescape( document.cookie.substring( y, endOfCookie ) ); 
	        } 
	        x = document.cookie.indexOf( " ", x ) + 1; 
	        if ( x == 0 ) 
	            break; 
	    } 
	    return ""; 
	}
		
	//닫기 버튼 클릭시
	function closeWin(key)
	{
	    if($("#todaycloseyn").prop("checked")){
	    	
	        setCookie('divpop'+key, 'Y' , 1 );
	    }
	    $("#divpop"+key+"").hide();
	}
  
	$(function(){	

		if(getCookie("divpop1") !="Y"){
			$("#divpop1").show();
		}

	});
	
	</script>
</body>
</html>