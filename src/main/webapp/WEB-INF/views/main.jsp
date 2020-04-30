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
	font{
	}
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
	    background-size: cover;
	    margin-top: 25px;
	    background-color: #f6f3f2;
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
  /* 평점 CSS */
	.star-rating {
		width: 304px; 
	}
	.star-rating {
		display: inline-block; 
		height: 55px; 
		overflow: hidden; 
		background-image: url("resources/css/images/starRating.png");
		background-repeat: no-repeat; 
	}
	
	#nRating{
		display: inline-block; 
		height: 55px; 
		overflow: hidden; 
		background-image: url("resources/css/images/starRating.png");
		background-repeat: no-repeat; 
	}
	#hRating{
		display: inline-block; 
		height: 55px; 
		overflow: hidden; 
		background-image: url("resources/css/images/starRatingB.png");
		background-repeat: no-repeat; 
	}
	
	.star-rating span {
		background-position : left bottom; 
		line-height : 0px; 
		vertical-align : top; 
	}
/* 메인 순위 화살표 버튼 */
	.carousel-control-prev-icon,
	.carousel-control-next-icon {
	  height: 100px;
	  width: 100px;
	  background-image: none;
	}
	
	.carousel-control-next-icon:after
	{
	  content: '>';
	  font-size: 55px;
	  color: #000000;
	}
	
	.carousel-control-prev-icon:after {
	  content: '<';
	  font-size: 55px;
	  color: #000000;
	}
/* dialog CSS */
	#view_win {
		display: none;
		padding: 25px;
	}
	#dia_loading{
		width: 100%;
		height: 800px;
		margin: auto;
		background: url("resources/css/images/loading.gif");
		background-repeat: no-repeat;
		background-position: center;
	}
	#info{
		display: inline-block;
	}
	#close_bt{
		background: url("resources/css/images/ico_comm.png");
		background-repeat: no-repeat;
	    background-position: 0px -145px;
	   	float: right;
	}
	.icon{
		display: block;
	    width: 22px;
	    height: 21px;
	    font-size: 0;
	    line-height: 0;
	    text-indent: -9999px;
	}
	#dia_topLayer{
		display: none;
		padding-bottom: 40px;
	}
	#dia_Tabs{
		display: none;
	}
	.list_tab{
		padding: 0px;
		list-style: none;
		position: relative;
	    border-bottom: 1px solid #afafaf;
	    overflow: hidden;
	}
	.list_tab li{
		display: block;
		float: left;
		margin: 0px;
		padding: 0px;
		width: 270px;
	    height: 38px;
		border: 1px solid #d9d9d9;
    	border-bottom: none;
    	text-align: center;
	}
	.list_tab li:hover{
		background-color: #28A0FF;
	}
	.list_tab li a {
		display: block;
	    line-height: 38px;
	    text-decoration: none;
    	color: #28A0FF;
    }
    .list_tab li a:hover {
	    color: #ffffff;
    }
    
    #tabs1{
    	display: none;
    	overflow: auto;
    }

    #i1{
    	display: inline-block;
    	float: left;
    	margin-right: 20px;
    	width: 190px;
    	height: 280px;
    }
    #dia_info{
    	display: inline-block;
    }
    #dia_info dt{
    	float: left;
	    width: 85px;
	    margin-right: 20px;
	    font-weight: bold;
    }
    #dia_info dd{
	    overflow: hidden;
	    line-height: 25px;
	    color: #555;
    }
    .titType{
    	display: block;
    	border-left: 5px solid #373737;
    	border-bottom: 1px solid #373737;
    	padding: 4px 0 5px 10px;
    	color: #373737;
    	font-size: 20px;
    }
    #story{
    	display: block;
    	font-weight: bold;
    	font-size: 18px;
    }
    .dia_content{
    	display: inline-block;
    	margin: 12px 20px;
    }
    .star_dt{
    	display: inline-block;
    	margin-right: 20px;
    	margin-bottom: 0px; 
    	position: relative; 
    	top: -20px;
    	width: 100px;
    	font-size: 16px;
    	text-align: left;
    	font-weight: bold;
    }
    .dia_dl dt{
    	display: inline-block;
    	margin-right: 30px;
    }
    .dia_dl dd{
    	display: inline;
    }
    #tabs2{
    	display: none;
    }
    
</style>

</head>

<body style="background-color: #ffffff; width: 80%; margin: auto;">
	<div id="h_Top"></div>
	<jsp:include page="menu.jsp" />
	
	<div style="height: 10px;"></div>
	<header>
		
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			</ol>
			<div class="carousel-inner" role="listbox"
				style="background-color: #F9FFFF; padding: 20px 0px;">
				<!-- 금일 순위 -->
				<!-- Slide One - Set the background image for this slide in the line below -->
				<div class="carousel-item active" style="height: 500px;">
					<table style="margin: auto;">
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
				<div class="carousel-item" style="height: 500px;">
					<table style="margin: auto; padding: 30px 0px;">
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
			</div>
			<!-- 팝업창 -->
			<div id="divpop1" class="divpop" style="position: absolute; right: 11%; top: 230px; z-index: 200; visibility: visible;">
				<table style="width: 490px; height: 340px;">
					<tbody>
						<tr>
							<td style="height: auto; text-align: center; background-color: white">
									<a href="notice.inc">
										<img alt="코로나 조심" src="resources/css/images/108.png" width="490px;" height="450px;">
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
	<div style="position: fixed; bottom: 600px; right: 10px; z-index: 99;">
				<a href="#h_Top" style="display: block; float: right; text-align: center; color: black; background: rgba(0,0,0,0.2);">
					<img src="resources/css/images/btn_top_arrow.png">
				</a>
			</div>
	<!-- 클린센터 신고 박스 -->
	<div style="width: 100%; padding: 30px 0 30px 0; height: 350px; display: block;">
		<!--  -->
		<div style="margin: 110px; width: 1200px; margin: 0 auto;">
			<div style="border: 1px solid #d8d8d8; background-color: #fff; width: 45%; height: 100%; padding: 30px; float: left;">
				<div style="background: url(resources/css/images/icon_clean_center.png) 25px 0 no-repeat; padding: 0 0 0 150px;">
					<div style="font-size: 26px; line-height: 30px; color: #000;">클린센터신고</div>
					<p style="font-size: 14px; line-height: 20px; color: #5b5b5b; padding: 10px 0 0 0; ">
						영화진흥위원회는 임직원의 투명하고 청렴한 공직사회를 
						<span style="display: block;">실현하기 위하여 클린(불편부조리)신고센터를 운영하고 있습니다.</span>
					</p>
				</div>
				<div style="width: 100%; border: 1px dashed #d9d9d9; margin: 30px 0 30px 0"></div>
				<div style="float: left;">
					<img alt="클린신고 연락처" src="resources/css/images/icon_cleancenter_phone.png" style="border: none; vertical-align: middle;">
				</div>
				<p style="float: left; font-size: 20px; line-height: 26px; color: #000; font-weight: 500; padding: 8px 0 0 10px;">051.720.4731</p>
			</div>
			
			<!-- 공정 환경 조성 센터 이미지 -->
			<div style="float: right; width: 45%; height: 100%; background-color: #fff; border: 1px solid #d8d8d8; padding: 20px; position: relative;">
				<div style="position: absolute; bottom: 0; right: 0">
					<img alt="공정 환경 조성 센터 이미지" src="resources/css/images/unfair_img.png" style="border: none; vertical-align: middle;">
				</div>
				<a href="https://www.kofic.or.kr/kofic/business/guid/introUnfairCenter.do">
					<div style="font-size: 26px; line-height: 30px; color: #000;">공정환경조성센터</div>
					<strong style="color: #ff4c3a; font-weight: 700;">신고전화</strong>
					<p style="font-size: 26px; line-height: 28px; color: #000; font-weight: 700;">1855-0511</p>
					<p style="font-size: 14px; line-height: 20px; color: #5b5b5b; padding: 10px 0 0 0;">
						<img alt="" src="resources/css/images/unfair_list_01.jpg" style="border: none; vertical-align: middle;">영화산업 불공정행위 
						<span style="color: #ff6e00; !important;">상담과 신고 제보</span>
					</p>
					<p style="font-size: 14px; line-height: 20px; color: #5b5b5b; padding: 10px 0 0 0;">
						<img alt="" src="resources/css/images/unfair_list_02.jpg" style="border: none; vertical-align: middle;"> 영화산업 성희롱 성폭력
						<span style="color: #ff6e00; !important;">상담과 신고·제보</span>
					</p>
				</a>
				<div style="width: 300px; padding-top: 5px; border-top: 1px solid #d9d9d9; line-height: 24px;">
					<a href="http://solido.kr" target="_blank" title="한국영화 성평등 센터 든든 바로가기" style="font-size: 14px; color: #000; display: block;">
						한국영화 성평등센터 든든 바로가기
						<img alt="한국영화 성평등센터 든든 바로가기" src="resources/css/images/icon_right_arrow.png" style="margin-left: 5px;">
					</a>
				</div>
				<div>
					<a href="http://www.sinmungo.kr/film/" target="_blank" title="영화인 신분고 바로가기" style="font-size: 14px; color: #000; display: block;">
						영화인 신문고 바로가기
						<img alt="영화인 신문고 바로가기" src="resources/css/images/icon_right_arrow.png" style="margin-left: 5px;">
					</a>
				</div>
			</div>
		</div>
	</div>
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
								
									<c:forEach var="vo" items="${ sessionScope.list }" begin="0" end="4">
										<tr>
											<td id="c_subject">
												<a href="bbsView.inc?nowPage=${nowPage}&b_idx=${vo.b_idx}">
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
	<div id="view_win">
		<div id="dia_loading"></div>
		<div id="dia_topLayer">
			<h3 id="info"></h3><a id="close_bt" class="icon"><span>닫기</span></a>
		</div>
		<div id="dia_Tabs">
			<ul class="list_tab">
				<li id="tabLi1"><a id="tabA1" href="javaScript:tabs2Open()">상세보기</a></li>
				<li id="tabLi2"><a id="tabA2" href="javaScript:tabs1Open()">평가</a></li>
			</ul>
		</div>
		<div id="tabs1">
			<img id="i1">
				<dl id="dia_info">		
					<dt>요약정보</dt><dd id="summary"></dd>
					<dt>개봉연도</dt><dd id="openyear"></dd>
					<dt>제작연도</dt><dd id="year"></dd>
					<dt>제작상태</dt><dd id="prdtStatNm"></dd>
				</dl>
				<div class="wrap-star">
					<p class="star_dt">네이버 평점</p>
					<div class='star-rating'>
						<span id="nRating" style="width: 30%"></span>
					</div>
				</div>
				<div class="wrap-star">
					<p class="star_dt">KINEMA 평점</p>
					<div class='star-rating'>
						<span id="hRating" style="width: 30%"></span>
					</div>
				</div>
			<div>
				<strong id="dia_synop" class="titType" style="margin-top: 30px;">시놉시스</strong>
				<div class="dia_content">
					<label id="story"></label>
					<label id="storyCon"></label>
				</div>
			</div>
			<div>
				<strong id="dia_makers" class="titType">만든사람들</strong>
				<div class="dia_content">
				<dl class="dia_dl">
					<dt style="color: #5076db;">감독</dt><dd id="director"></dd>
					<br/>
					<dt style="color: #5076db;">배우</dt><dd id="actor"></dd>
				</dl>
				</div>
			</div>
			<div>
				<strong id="dia_conpany" class="titType">영화사</strong>
				<div class="dia_content" id="company"></div>
			</div>
			<div>
				<strong id="dia_tec" class="titType">등급분류 / 기술정보</strong>
				<div class="dia_content">
					<dl>
						<dt style="color: #5076db;">등급분류 / 기술</dt><dd id="tec"></dd><br/>
					</dl>
				</div>
			</div>
			<div id=dia_map>
				<strong id="dia_maptit" class="titType">내 주변 영화관</strong>
				<div style="margin-top: 80px; margin-left: 30px;">
					<jsp:include page="kMap2.jsp" />
				</div>
			</div>
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
		</div>
	</div>

	<!-- Bootstrap core JavaScript -->
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/jquery-ui.min.js"></script>
	<script src="resources/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
	var moviecode = "";
	
	$(function(){
		
		if(getCookie("divpop1") !="Y"){
			$("#divpop1").show();
		}
		
		//레이팅 JS 
		jQuery(document).ready(function($){
			
			$("#tabA2").css("color", "#28A0FF");
			$("#tabLi2").css("background-color", "#ffffff");
			$("#tabA1").css("color", "#ffffff");
			$("#tabLi1").css("background-color", "#28A0FF");
	    
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
		
		if(getCookie("divpop1") !="Y"){
			$("#divpop1").show();
		}
		
		//아코디언	
		$( "#accordion" ).accordion({
			collapsible: true
		});
		
		$("#close_bt").bind("click", function() {
			$("#dia_loading").css("display", "block");
			
			$("#dia_topLayer").css("display", "none");
			$("#dia_Tabs").css("display", "none");
			$("#tabs1").css("display", "none");
			$("#tabs2").css("display", "none");
			$("#view_win").dialog("close");				// dialog 닫을경우 dialog 내용 삭제
			$("#accordion").html("");
			
			$("#tabA2").css("color", "#28A0FF");
			$("#tabLi2").css("background-color", "#ffffff");
			$("#tabA1").css("color", "#ffffff");
			$("#tabLi1").css("background-color", "#28A0FF");
		});
		
		$( "#tabs" ).tabs();
		
		// 금일 박스 오피스
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
               code += "'/></td><td><a href=\"javascript:movieDetailInfo('"+data[i].movieCd+"')\">";
               code += data[i].movieNm;
               code += "</a></td><td>";
               code += data[i].openDt;
               code += "</td></tr>";
            }
            $("#week>tbody").html(code);
            
            // 금일 순위 마우스 위치 시 옆의 내용 변환
            $(".weekM tr").mouseenter(function(){
                 //children().eq(0) 하나만 했을떄  TR 값이 넘오 오고 children().eq(0) 2번했을경우 해당 행의 TR 값이 넘어온다 .
               var cd = $(this).children().eq(0).children().eq(0).val();
               
                 $.ajax({
                    url:"http://localhost:5000/movieSimpleInfo?movieCd="+cd,
                  type: "POST",
                  dataType : "json"
               }).done(function(data){
                  if(data != undefined){
                     $("#i12").attr("src", data[0].imageSrc);

                     var code = data[0].movieNm;
                     $("#m_name1").html(code);
                     var openyear = data[0].openDt;
                     $("#openyear1").html(openyear);
                          
                     var prdtStatNm = data[0].prdtStatNm;
                     $("#prdtStatNm1").html(prdtStatNm);
                           
                     var typeNm = data[0].typeNm;
                     $("#typeNm1").html(typeNm);
                           
                     var watchGradeNm = data[0].watchGradeNm;
                     $("#watchGradeNm1").html(watchGradeNm);
                           
                     var showTm = data[0].showTm;
                     $("#showTm1").html(showTm);
                                                
                     var genere = data[0].genreNm;
                     $("#genere1").html(genere);   
                     var company = data[0].companyNm;
                     $("#company1").html(company);
                     var nations = data[0].nationNm;
                     $("#nations1").html(nations);
                     var d_people = data[0].peopleNm;
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
                 
                 $.ajax({
                    url:"http://localhost:5000/movieSimpleInfo?movieCd="+cd,
                  type: "POST",
                  dataType : "json"
               }).done(function(data){
                  if(data != undefined){
                     $("#i13").attr("src", data[0].imageSrc);
                           
                     var code = ""+data[0].movieNm;
                     $("#m_name2").html(code);
                     var openyear = ""+data[0].openDt;
                     $("#openyear2").html(openyear);
                           
                     var prdtStatNm = data[0].prdtStatNm;
                     $("#prdtStatNm2").html(prdtStatNm);
                           
                     var typeNm = data[0].typeNm;
                     $("#typeNm2").html(typeNm);
                           
                     var watchGradeNm = data[0].watchGradeNm;
                     $("#watchGradeNm2").html(watchGradeNm);
                           
                     var showTm = data[0].showTm;
                     $("#showTm2").html(showTm);
                           
                     var genere = ""+data[0].genreNm;
                     $("#genere2").html(genere);   
                     var company = ""+data[0].companyNm;
                     $("#company2").html(company);
                     var nations = ""+ data[0].nationNm;
                     $("#nations2").html(nations);
                     var d_people = ""+ data[0].peopleNm;
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
		$("#view_win").dialog({width: "50%", padding: "0px"}).parents(".ui-dialog").find(".ui-dialog-titlebar").remove();
		
		var paran = "movieCd="+encodeURIComponent(frm);
		moviecode= frm;	// 멤버변수 사용
		$.ajax({
			url: "movieDetailInfo.inc",
			type: "POST",
			data: paran,
			dataType : "json"
		}).done(function(data){
			if(data.vo != undefined){
				$("#dia_loading").css("display", "none");
				
				$("#i1").attr("src", data.vo.postURL);
				
				// var rating ="별점:"+ data.vo.nRating;			
				if(data.vo.nRating != "null"){
					var nRating = Math.round(Number(data.vo.nRating)*10);
					console.log(nRating);
					$("#nRating").css("width", nRating+"%");					
				}else{
					$("#nRating").css("width", "0%");
				}
				
				var typeNm = data.vo.typeNm;				// 장편, 단편
				var genre = data.vo.genreNm;				// 장르
				var showTm = data.vo.showTm+"분";			// 상영시간
				var watchGradeNm = data.vo.watchGradeNm;	// 관람등급
				var nationNm = data.vo.nationNm				// 제작국가 명
				
				var summary = typeNm+" | "+genre+" | "+showTm+" | "+watchGradeNm+" | "+nationNm;
				$("#summary").html(summary);
				
				var year = data.vo.prdtYear+"년";
				$("#year").html(year);
				var openyear = data.vo.openDt;
				$("#openyear").html(openyear);
				
				var info = data.vo.movieNm+"&nbsp;";
				$("#info").html(info);

				if(data.vo.directors != undefined){
					var director = data.vo.directors;
					$("#director").html(director);
				}

				if(data.vo.actors != undefined){
					var actor = data.vo.actors;
					$("#actor").html(actor);
				}
				
				var strCompany = "";
				if(data.vo.companyNm != undefined){
					strCompany += '<dl class="dia_dl">'
					for(var x = 0; x<data.vo.companyNm.length; x++){
						strCompany += '<dt style="color: #5076db;">';
						strCompany += data.vo.companyPartNm[x];
						strCompany += '</dt>';
						strCompany += '<dd id="distributor">';
						strCompany += data.vo.companyNm[x];
						strCompany += '</dd><br/>';
					}
					strCompany += "</dl>"
					console.log(strCompany);
					$("#company").html(strCompany);				
				}
				
				var story = data.vo.story;
				$("#story").html(story);
				var storyCon = "&nbsp;"+data.vo.storyCon;
				$("#storyCon").html(storyCon);
				
				
			}//if의 끝
			
			$("#dia_topLayer").css("display", "block");
			$("#dia_Tabs").css("display", "block");
			$("#tabs1").css("display", "block");
			
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
  
	
	function tabs1Open() {
		$("#tabs1").css("display", "none");
		$("#tabs2").css("display", "block");
		
		$("#tabA1").css("color", "#28A0FF");
		$("#tabLi1").css("background-color", "#ffffff");
		$("#tabA2").css("color", "#ffffff");
		$("#tabLi2").css("background-color", "#28A0FF");
	}
	function tabs2Open() {
		$("#tabs1").css("display", "block");
		$("#tabs2").css("display", "none");
		
		$("#tabA1").css("color", "#ffffff");
		$("#tabLi1").css("background-color", "#28A0FF");
		$("#tabA2").css("color", "#28A0FF");
		$("#tabLi2").css("background-color", "#ffffff");
	}
	</script>
</body>
</html>