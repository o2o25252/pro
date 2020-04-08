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

<!-- 메뉴바 css -->
<link rel="stylesheet" href="resources/css/styles.css" />
</head>
<body>

	<%--메뉴 바 가져오기 --%>
	<jsp:include page="menu.jsp" />
	
	<form>
		<table>

			<tbody> 
				<tr>
					<th>씨네마 공지사항</th>
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
						<table>
							<tr>
								<td>번호</td>
								<td>제목</td>
								<td>글쓴이</td>
								<td>날짜</td>
								<td>조회수</td>
							</tr>
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
							<%-- list 에 없을떄 목록에 없습니다. 표시용 --%>
							<c:if test="${empty list }">
								<tr><td colspan="5">작성된 공지가 없습니다.</td></tr>
							</c:if>
						</table>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5">
						${pageCode }
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</body>
</html>
