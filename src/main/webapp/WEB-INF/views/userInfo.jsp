<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/styles.css" />
<style type="text/css">
	.login-container{
    margin-top: 5%;
    margin-bottom: 5%;
}
.login-form-1{
    padding: 5%;
    box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
}
.login-form-1 h3{
    text-align: center;
    color: #333;
}
.login-form-2{
    padding: 5%;
    background: #0062cc;
    box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
}
.login-form-2 h3{
    text-align: center;
    color: #fff;
}
.login-container form{
    padding: 10%;
}
.btnSubmit
{
    width: 50%;
    border-radius: 1rem;
    padding: 1.5%;
    border: none;
    cursor: pointer;
}
.login-form-1 .btnSubmit{
    font-weight: 600;
    color: #fff;
    background-color: #0062cc;
}
.login-form-2 .btnSubmit{
    font-weight: 600;
    color: #0062cc;
    background-color: #fff;
}
.login-form-2 .ForgetPwd{
    color: #fff;
    font-weight: 600;
    text-decoration: none;
}
.login-form-1 .ForgetPwd{
    color: #0062cc;
    font-weight: 600;
    text-decoration: none;
}
	
</style>
</head>
<body>
	<jsp:include page="menu.jsp" />
	
	<div class="container login-container">
            <div class="row">
                <div class="col-md-6 login-form-1">
                    <h3>아이디 찾기</h3>
                    <form>
                        <div class="form-group">
                            <input type="text" class="form-control" id="idsearch"
					name="idsearch" placeholder="이름을 입력해주세요" />
                        </div>
                        
                        <div class="form-group">
                            <input type="button" id="id_btn" value="아이디 찾기" class="btnSubmit" />
                        </div>
                        
                    </form>
                </div>
                
                <div class="col-md-6 login-form-2">
                    <h3>비밀번호 찾기</h3>
                    <form>
                        <div class="form-group">
                            <input type="text" id="pwsearch"
						name="pwsearch" placeholder="별칭을 입력해주세요" class="form-control" />
                        </div>
                        <div class="form-group">
                            <input type="button" id="pw_btn" value="비밀번호 찾기" class="btnSubmit"  />
                        </div>
                    </form>
                </div>
            </div>
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