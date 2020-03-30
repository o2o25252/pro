<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/jquery-ui.min.css" />
<link rel="stylesheet" href="resources/css/custom.css"/>
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
               <jsp:include page="kMap2.jsp"/> 
         <button type="button" id="close_bt">닫기</button>
   </div>
  
   <script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/jquery-ui.min.js"></script>
	<script>
	
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