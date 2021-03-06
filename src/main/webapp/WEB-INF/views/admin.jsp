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
	<h2 style="width: 80%; height:10%; margin: auto; padding: auto; text-align: center; margin-top: 10px;">회원 관리 페이지</h2>
	<div>
		<form id="frm" method="post" action="selectview_bbs.inc">
			<table class="table" style="width: 80%; height: 80%; margin: auto; box-shadow: 2px 2px 2px 2px #bebebe;">
				<thead>
					<tr>
						<th>ID</th>
						<th>PW</th>
						<th>NICKNAME</th>
						<th>NAME</th>
						<th>STATUS</th>
						<th>DIV</th>
						<th>BAN</th>
						<th>M_VIEW</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${u_list }" varStatus="st">
						<tr>
							<td id="id${st.index }">${vo.id }</td>
							<td>${vo.pw }</td>
							<td id="nickname${st.index }">${vo.nickname }</td>
							<td id="name${st.index }">${vo.name }</td>
							<td id="status${st.index }">${vo.status }</td>
							<td id="division${st.index}">${vo.division }</td>
							<c:if test="${vo.status eq 4  }">
								<td id="btn_area${st.index }"><input type="button"
									value="복구" onclick="recover('${st.index}')" ></td>
							</c:if>
							
							<c:if test="${vo.status ne 4  }">
								<td id="btn_area${st.index }"><input type="button"
									value="정지" onclick="ban('${st.index}')" ></td>
							</c:if>
							<td><input type="button" value="글_관리" onclick="selectview_bbs('${st.index}')"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div>
	
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
	
	//선택회원 정지 함수
	function ban(idx) {
		var id = $("#id"+idx).text();
		var param =  "id="+encodeURIComponent(id);
		$.ajax({
			url: "ban.inc",
			data: param,
			type:"post",
			dataType:"json"
		}).done(function(data){
			console.log("ban"+data.chk);
			if(data.chk){
			
				var code = "<input type='button'  value='복구' onclick='recover("+idx+")' />";
				console.log(code);
				$("#btn_area"+idx).html(code);
				
				$("#status"+idx).text("4");
			}
		}).fail(function(err){ 
			console.log("실패"+err);
		});
	}
	//선택회원 복구 함수 
	function recover(idx) {
		
		var id = $("#id"+idx).text();
		var division =$("#division"+idx).text();
		var recover_param =  "id="+encodeURIComponent(id)+"&division="+encodeURIComponent(division);

		
		$.ajax({
			url: "recover.inc",
			data: recover_param,
			type:"post",
			dataType:"json"
		}).done(function(data){
			console.log("recover"+data.chk);
			if(data.chk){
				
				var code = "<input type='button'  value='정지' onclick='ban("+idx+")'/>";
				console.log(code);
				$("#btn_area"+idx).html(code);

				$("#status"+idx).text(division);
		}
			
		}).fail(function(err){ 
			console.log("실패"+err);
		});
	}
	//선택회원의 글 목록 보기 함수 
	function selectview_bbs(idx) {
		console.log(idx);
		var nickname = $("#nickname"+idx).text();
		console.log(nickname);
		location.href="selectview_bbs.inc?nickname="+nickname;
	}
	</script>
</body>
</html>