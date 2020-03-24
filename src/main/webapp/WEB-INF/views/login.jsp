<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="resources/css/reg.css" />
</head>

<body>
<jsp:include page="menu.jsp"/>
<div class="container">
    <div class="container">
    <div class="row">
      <div class="col-lg-10 col-xl-9 mx-auto">
        <div class="card card-signin flex-row my-5">
          <div class="card-img-left d-none d-md-flex">
             <!-- Background image for card set in CSS! -->
          </div>
          <div class="card-body">
            <h5 class="card-title text-center">로그인</h5>
            <form class="form-signin">
             
              <div class="form-label-group">
                <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required>
                <label for="inputEmail">아이디</label>
              </div>
              
              <hr>

              <div class="form-label-group">
                <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
                <label for="inputPassword">비밀번호</label>
              </div>
              <div class="custom-control custom-checkbox mb-3">
                  <input type="checkbox" class="custom-control-input" id="customCheck1">
                  <label class="custom-control-label" for="customCheck1">비밀번호 저장</label>
                </div>
              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">로그인</button>
               <div class="text-center">
                  <a class="small" href="#">Forgot password?</a></div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
 
<script type="text/javascript" src="resources/js/bootstrap.bundle.min.js"></script>
</body>
</html>