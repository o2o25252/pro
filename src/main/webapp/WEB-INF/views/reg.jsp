<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="logo">
		<a class="logo" href="main.inc"> <img
			src="resources/0000803875_001_20200309142116257.jpg" height="70px">
		</a>
	</div>
	<div>
		<form action="add.inc" method="post">
			<table class="t1" id="t1">
				<tr>
					<td><label>아이디:</label></td>
					<td><input name="id" type="text" placeholder="id를 입력하세요" /></td>
				</tr>
				<tr>
					<td><label>이름:</label></td>
					<td><input name="name" type="text" placeholder="이름를 입력하세요" /></td>
				</tr>
				<tr>
					<td><label>비밀번호:</label></td>
					<td><input name="pw" type="password" placeholder="비밀번호를 입력하세요" /></td>
				</tr>

			</table>
			<button onclick="reg(this.form)">가입</button>
		</form>
	</div>

	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
					$(function(){
						function reg(frm) {
							frm.submit();
						}
					});
	</script>
</body>
</html>