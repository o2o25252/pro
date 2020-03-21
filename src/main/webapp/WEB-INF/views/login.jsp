<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<h3>로그인</h3>
	<div>
		<form action="login_ok.inc" method="post">
			<table>
				<tr>
					<td>
						<input type="text" placeholder="아이디를 입력하세요" name="id"/>
					</td>
				</tr>
				<tr>
					<td>
						<input type="password" placeholder="비밀번호를 입력하세요" name="pw"/>
					</td>
				</tr>
			</table>
			<input type="button" value="로그인" id="btn_login"/>
		</form>
	</div>
		<script src="resources/js/jquery-3.4.1.min.js"></script>
		<script type="text/javascript">
		$(function(){
			
			$("#btn_login").bind("click", function() {
				document.forms[0].submit();
			});
			
			function login(frm) {
				
				
				//frm.submit();
			}
		});
		</script>
</body>
</html>