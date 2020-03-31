<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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


  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Modern Business - Start Bootstrap Template</title>


  <!-- Custom styles for this template -->
  <link href="resources/css/modern-business.css" rel="stylesheet">
  <link rel="stylesheet" href="resources/css/jquery-ui.min.css" />
  <link rel="stylesheet" href="resources/css/custom.css"/>
  <link rel="stylesheet" href="resources/css/styles.css"/> 
  <script src="https://cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js?skin=sunburst"></script>
  <style type="text/css">
  	#view_win {
	   display: none;
	}
	#week a,#weekend a{
		color : black;
  	}
  	#week{
  		float: center;
  	}
  	
	#show{
		border: 1px solid black;
		float: left;
	}
	/*
	.elice:hover{
		background: red;
	}
	*/
  </style>
</head>
<body>
	<jsp:include page="menu.jsp"/>
  <header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <!-- Slide One - Set the background image for this slide in the line below -->
        <div class="carousel-item active" style="background:gray">
        	<table id="show">
        		<tbody>
        			
        		</tbody>
        	</table>
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
        </div>
        <!-- Slide Two - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background:gray">
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

  <!-- Page Content -->
  <div class="container">

    <h1 class="my-4">Welcome to Modern Business</h1>
 
 
    <!-- Marketing Icons Section -->
    <div class="row">
      <div class="col-lg-4 mb-4">
        <div class="card h-100">
          <h4 class="card-header">Card Title</h4>
          <div class="card-body">
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary">Learn More</a>
          </div>
        </div>
      </div>
      <div class="col-lg-4 mb-4">
        <div class="card h-100">
          <h4 class="card-header">Card Title</h4>
          <div class="card-body">
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis ipsam eos, nam perspiciatis natus commodi similique totam consectetur praesentium molestiae atque exercitationem ut consequuntur, sed eveniet, magni nostrum sint fuga.</p>
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary">Learn More</a>
          </div>
        </div>
      </div>
      <div class="col-lg-4 mb-4">
        <div class="card h-100">
          <h4 class="card-header">Card Title</h4>
          <div class="card-body">
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary">Learn More</a>
          </div>
        </div>
      </div>
    </div>
    <!-- /.row -->

    <!-- Portfolio Section -->
    <h2>Portfolio Heading</h2>

    <div class="row">
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">Project One</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">Project Two</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">Project Three</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos quisquam, error quod sed cumque, odio distinctio velit nostrum temporibus necessitatibus et facere atque iure perspiciatis mollitia recusandae vero vel quam!</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">Project Four</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">Project Five</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">Project Six</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque earum nostrum suscipit ducimus nihil provident, perferendis rem illo, voluptate atque, sit eius in voluptates, nemo repellat fugiat excepturi! Nemo, esse.</p>
          </div>
        </div>
      </div>
    </div>
    <!-- /.row -->

    <!-- Features Section -->
    <div class="row">
      <div class="col-lg-6">
        <h2>Modern Business Features</h2>
        <p>The Modern Business template by Start Bootstrap includes:</p>
        <ul>
          <li>
            <strong>Bootstrap v4</strong>
          </li>
          <li>jQuery</li>
          <li>Font Awesome</li>
          <li>Working contact form with validation</li>
          <li>Unstyled page elements for easy customization</li>
        </ul>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis, omnis doloremque non cum id reprehenderit, quisquam totam aspernatur tempora minima unde aliquid ea culpa sunt. Reiciendis quia dolorum ducimus unde.</p>
      </div>
      <div class="col-lg-6">
        <img class="img-fluid rounded" src="http://placehold.it/700x450" alt="">
      </div>
    </div>
    <!-- /.row -->

    <hr>

    <!-- Call to Action Section -->
    <div class="row mb-4">
      <div class="col-md-8">
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias, expedita, saepe, vero rerum deleniti beatae veniam harum neque nemo praesentium cum alias asperiores commodi.</p>
      </div>
      <div class="col-md-4">
        <a class="btn btn-lg btn-secondary btn-block" href="#">Call to Action</a>
      </div>
    </div>

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>

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

  <!-- Bootstrap core JavaScript -->
  <script src="resources/js/jquery-3.4.1.min.js"></script>
  <script src="resources/js/bootstrap.bundle.min.js"></script>
  <script src="resources/js/jquery.min.js"></script>
  <script src="resources/js/jquery-ui.min.js"></script>
  <script type="text/javascript">
  
  $(function(){
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
					code += "<tr><td class='elice'>";
					code += data.Dailyar[i].rnum;
					code += "<input type='hidden' value='";
					code += data.Dailyar[i].movieCd;
					code += "'></td><td class='elice'><a class='asd' href=\"javascript:go('"+data.Dailyar[i].movieCd+"')\">";
					code += data.Dailyar[i].movieNm;
					code += "</a></td><td class='elice'>";
					code += data.Dailyar[i].openDt;
					code += "</td></tr>";
				}
				$("#week>tbody").html(code);
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
					code += "<tr><td class='elice'>";
					code += data.Weeklyar[i].rnum;
					code += "<input type=hidden value='";
					code += data.Weeklyar[i].movieCd;
					code += "'/></td><td class='elice'><a class='asd' href=\"javascript:go('"+data.Weeklyar[i].movieCd+"')\">";
					code += data.Weeklyar[i].movieNm;
					code += "</a></td><td class='elice'>";
					code += data.Weeklyar[i].openDt;
					code += "</td></tr>";
				}
				
				$("#weekend>tbody").html(code);
			}
		}).fail(function(err){
			console.log(err);
		});
		
		$('.elice').mouseenter(function (){
		    console.log("안녕");
		    console.log("안녕");
		    console.log("안녕");
		    console.log("안녕");
		    console.log("안녕");
		  });
		
	});
  
  $(function(){
	  $("#open_btn").bind("click", function() {
      	$("#view_win").dialog("option", "width", 8100 );
      });

      $("#close_bt").bind("click", function() {
         $("#view_win").dialog("close");
      });
       
  });
  
  $(function(){

	  
  })
  
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
