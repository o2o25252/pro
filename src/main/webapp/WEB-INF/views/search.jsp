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
	#search_view td,#search_view th{
		border: 1px solid black;
		border-collapse: collapse;
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
				<td> <button type="button" id="ok_btn">확인</button></td>
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
  <table id="search_view">
  	<thead>
  		<tr>
  			<th> 영화명 </th>
  			<th> 제작연도 </th>
  			<th> 제작국가 </th>
  			<th> 장르 </th>
  		</tr>
  	</thead>
  	<tbody>
  	<c:forEach var="vo" items="${search }">
  	<c:if test="${ search !=null }">
  		<tr>
  			<td><a class='asd' href="javascript:go('${ vo.movieCd }')">${ vo.movieNm}</a></td>
  			<td> ${ vo.prdtYear }</td>
  			<td>${ vo.nationNm }</td>
  			<td>${ vo.genreNm }</td>
  		</tr>
  		</c:if>
  		<c:if test="${search == null }"> 검색하신 내용이 없습니다.</c:if>
  		</c:forEach>
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
    
   
  <script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ca457fdc328a1fc208d2b810f0523080"></script>
	<script>
		$(function(){
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
					
					document.nm.movieNm.value=movieNm;
					document.nm.submit();
					}
					}
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
					$("#i1").attr("src", data.vo.postURL);
					//title= "${ vo.movieNm }"
					
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