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
						<!-- admin 일떄 버튼생성 기능 구현 해주기 --> 
						<c:if test="${ sessionScope.userVO.status eq 9}">
						<input type="button" value="공지 작성" onclick="javascript:location.href='b_write.inc?nowPage=${nowPage}'" />
						<!-- 현재 페이지 값을 준 상태로 write jsp 가기   -->
						</c:if>
					</td>
				</tr>
				<tr>
					<td>
						<table  class="table table-hover">
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
										${rowTotal-((nowPage-1)*blockList+st.index)}
										<!-- ${(nowPage-1)*blockList+st.index+1}  --> 
									</td>
									<td>
										<a href="b_view.inc?nowPage=${nowPage}&b_idx=${vo.b_idx}">
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
</body>
</html>
