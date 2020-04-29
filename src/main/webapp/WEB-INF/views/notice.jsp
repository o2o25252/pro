<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 선생님이한 게시판 css  -->
<link rel="stylesheet" href="resources/css/text.css" />
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<!-- 메뉴바 css -->
<link rel="stylesheet" href="resources/css/styles.css" />
</head>
<body>
	<%--메뉴 바 가져오기 --%>
	<jsp:include page="menu.jsp" />
	<div class="container">
		<table style="width: 1000px;">
			<h2 style="height: 50px; margin-top: 20px;">씨네마 공지 사항</h2>
			<tbody> 
				<tr style="float:right">
					<td>
						<input type="text" placeholder="검색" id="search_bbs" name="search_bbs"/>
						<button type="button" id="search_btn" > 검색 </button>
						<!-- admin 일떄 버튼생성 기능 구현 해주기 --> 
						<c:if test="${ sessionScope.userVO.status eq 9}">
						<input type="button" value="공지 작성" onclick="javascript:location.href='bbsWrite.inc?nowPage=${nowPage}'" />
						<!-- 현재 페이지 값을 준 상태로 write jsp 가기   -->
						</c:if>
					</td>
				</tr>
				<tr>
					<td>
						<table id="table1" class="table table-hover">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>글쓴이</th>
									<th>날짜</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>	
							<c:forEach var="vo" items="${list }" varStatus="st">
								<tr>
									<td bgcolor="#f2f7f5">
									
										<input type="hidden" value="row"> 
										${rowTotal-((nowPage-1)*blockList+st.index)}
										<!-- ${(nowPage-1)*blockList+st.index+1}  --> 
									</td>
									<td >
										<a href="bbsView.inc?nowPage=${nowPage}&b_idx=${vo.b_idx}">
											${vo.subject }
										</a>
									</td>
									<td>
										${vo.writer}
									</td>
									<td>
										${fn:substring(vo.write_date,0,10) }
									</td>
									<td>${vo.hit }</td>
								</tr>
								</c:forEach>
							</tbody>	
							
							<%-- list 에 없을떄 목록에 없습니다. 표시용 --%>
							<c:if test="${empty list }">
								<tr><td colspan="5">작성된 공지가 없습니다.</td></tr>
							</c:if>
						</table>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<div>
					<tr>
						<td colspan="5" class="pagination">
							<div style="margin: auto;">
								${pageCode}
							</div>
						</td>
					</tr>
				</div>	
			</tfoot>
		</table>
	</div>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		$(function() {
			
			
			$("#search_btn").bind("click",function(){
				var s_bbs = $("#search_bbs").val();
				var param = "subject="+encodeURIComponent(s_bbs);
				
				$.ajax({
					url:"Bbs_search.inc",
			         dataType:"json",
			         type: "POST",
					data:param
				}).done(function(data){
					if(data.ar != undefined){
						var code = "";
						var cd = 1;
						for(var i=0; i<data.ar.length;i++){
							code += "<tr><td bgcolor='#f2f7f5'>";
							code += cd++;
							code += "</td><td>";
							code += data.ar[i].subject;
							code += "</td><td>";
							code += data.ar[i].writer;
							code += "</td><td>";
							code += data.ar[i].write_date.substring(0,10);
							code += "</td><td>";
							code += data.ar[i].hit;
							code += "</td></tr>"
						}	
						
					$("#table1>tbody").html(code);
					}
				}).fail(function(err){
					
				});
				
			});
			
		});
	</script>
</body>
</html>
