<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/jquery-ui.min.css" />
<!-- 레이팅 링크 -->
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/styles.css"/>

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
	a:hover{text-decoration:none; color:#6cc091}

	#search_view td,#search_view th{
		border: 1px solid black;
		border-collapse: collapse;
	}
	#search_view th{
		background-color: #bcbcbc;
		text-align: center;
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
	a{
		text-decoration: none;
	}
	#box{
		height: 40px;
	}
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
	  
</style>
</head>
<body>
<jsp:include page="menu.jsp"/>
  <table id="search_view" class="table table-bordered table-hover">
  	<thead>
  		<tr>
  			<th> 영화명 </th>
  			<th> 제작연도 </th>
  			<th> 제작국가 </th>
  			<th> 장르 </th>
  		</tr>
  	</thead>
  	<tbody>
  	<c:forEach var="vo" items="${ search }">
  		<tr>
  			<td><a class='asd' href="javascript:go('${ vo.movieCd }')">${ vo.movieNm}</a></td>
  			<td> ${ vo.prdtYear }</td>
  			<td>${ vo.nationNm }</td>
  			<td>${ vo.genreNm }</td>
  		</tr>
  		
  		</c:forEach>
  		<c:if test="${ empty search }">
  		 <tr>
  		 	<td colspan="4"> 검색하신 내용이 없습니다. </td> 
  		 </tr>
  		 </c:if>
  	</tbody>
  </table>
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
  
   <script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/jquery-ui.min.js"></script>
	<script>
	function go(frm){
		
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
		}
	</script>
</body>
</html>