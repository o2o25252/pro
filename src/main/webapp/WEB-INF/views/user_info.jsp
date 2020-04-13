<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/styles.css" />
</head>
<body>
	<jsp:include page="menu.jsp" />
	<!-- ID 찾기 -->
	<div>
		<!-- 이름으로 찾기 -->
		<form action="">
			<label>아이디 찾기 :</label> <br /> <input type="text" id="idsearch"
				name="idsearch" placeholder="이름을 입력해주세요"> <br /> <br /> <input
				type="button" id="id_btn" value="아이디 찾기" />
		</form>
	</div>
	<br />
	<!-- PW 찾기 -->
	<div>
		<form>
			<label>비밀번호 찾기 :</label> <br /> <input type="password" id="pwsearch"
				name="pwsearch" placeholder="별칭을 입력해주세요"> <br /> <br /> <input
				type="button" id="pw_btn" value="비밀번호 찾기" />
		</form>
	</div>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		$(function() {
			//이름으로 아이디 찾기
			$("#id_btn").bind("click", function() {
				var name_info = $("#idsearch").val();
				console.log(name_info);
				id_info = "name_info=" + encodeURIComponent(name_info);
				$.ajax({

					url : "idsearch.inc",
					type : "post",
					data : id_info,
					dataType : "json"

				}).done(function(data) {
					alert("아이디는" + data.id);
				}).fail(function(err) {
					console.log(err);
				});
			});

			$("#pw_btn").bind("click", function() {
				var nickname_info = $("#pwsearch").val();
				console.log(nickname_info);
				pw_info = "nickname_info=" + encodeURIComponent(nickname_info);
				$.ajax({

					url : "pwsearch.inc",
					type : "post",
					data : pw_info,
					dataType : "json"

				}).done(function(data) {
					alert("비밀번호는" + data.pw);
				}).fail(function(err) {
					console.log(err);
				});
			});
		});
	</script>
</body>
</html>