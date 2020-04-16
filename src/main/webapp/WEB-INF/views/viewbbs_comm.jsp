<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/styles.css" />
</head>
<body>
	<%--메뉴 바 가져오기 --%>
	<jsp:include page="menu.jsp" />
	<c:if test="${empty c_list  }">
		<h3>${nickname }님의 댓글이 없습니다.</h3>
	</c:if>
	
	<c:if test="${!empty c_list }">
	<h3>${nickname }님의 작성한 댓글 </h3>
	<div>
		<table>
			<thead>
			<tr>
				<th>C_IDX</th>
				<th>WRITER</th>
				<th>CONTENT</th>
				<th>WRITE_DATE</th>
				<th>IP</th>
				<th>B_IDX</th>
				<th>STATUS</th>
			</tr>	
			</thead>
			<tbody>
				<c:forEach var="vo" items="${c_list }" varStatus="st">
					<tr>
						<td id="c_idx${st.index }">${vo.c_idx }</td>
						<td>${vo.writer }</td>
						<td id="content${st.index }">${vo.content }</td>
						<td>${vo.write_date }</td>
						<td>${vo.ip }</td>
						<td id="b_idx${st.index }">${vo.b_idx }</td>
						<td id="status${st.index }">${vo.status }</td>
						<c:if test="${vo.status eq 0 }">
							<td id="btn_area${st.index }"><input type="button"
									value="삭제" onclick="ban('${st.index}')" ></td>
						</c:if>
						<c:if test="${vo.status eq 1  }">
								<td id="btn_area${st.index }"><input type="button"
									value="복구" onclick="recover('${st.index}')" ></td>
							</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	</c:if>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
	//선택회원 정지 함수
	function ban(idx) {
		var c_idx = $("#c_idx"+idx).text();
		var b_idx= $("#b_idx"+idx).text();
		//console.log(c_idx);
		var param =  "c_idx="+encodeURIComponent(c_idx);
		
		$.ajax({
			url: "comment_ban.inc",
			data: param,
			type:"post",
			dataType:"json"
		}).done(function(data){
			console.log("ban"+data.chk);
			if(data.chk){
			
				var code = "<input type='button'  value='복구' onclick='recover("+idx+")' />";
				console.log(code);
				$("#btn_area"+idx).html(code);
				
				$("#status"+idx).text("1");
			}
		}).fail(function(err){ 
			console.log("실패"+err);
		});
	}
	
	//선택회원 복구 함수 
	function recover(idx) {
		var c_idx = $("#c_idx"+idx).text();
		var b_idx= $("#b_idx"+idx).text();
		
		var recover_param =  "c_idx="+encodeURIComponent(c_idx);

		
		$.ajax({
			url: "comment_recover.inc",
			data: recover_param,
			type:"post",
			dataType:"json"
		}).done(function(data){
			console.log("recover"+data.chk);
			if(data.chk){
				
				var code = "<input type='button'  value='삭제' onclick='ban("+idx+")'/>";
				console.log(code);
				$("#btn_area"+idx).html(code);

				$("#status"+idx).text("0");
		}
			
		}).fail(function(err){ 
			console.log("실패"+err);
		});
	}
	</script>
</body>
</html>