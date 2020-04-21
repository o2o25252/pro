<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 메뉴 css -->
<link rel="stylesheet" href="resources/css/styles.css" />
<!-- 퍼플 -->
<link rel="stylesheet"
	href="resources/css/pupple.css">	
<style type="text/css">
	#registry{
		border: 1px solid black;
		margin: auto;
	}
	#box{
		color: #AA66FF
	}
</style>
</head>
<body>
<jsp:include page="menu.jsp" />
 <div class="form-wrap">
      <div class="form-wrap-inn">
          <div class="frame">
              <div class="form-content">
                  <div class="header">
                      <i class="fa fa-eye"></i>
                      <h2>회원가입</h2>
                  </div>
                  
                  <div class="login-form">
                      <form action="regOk.inc" method="post" name="frm" class="form">
                        <div class="form-group">
                          <input id="b_id" name="id" placeholder="아이디를 입력하세요" autocomplete="off" class="form-input" type="text" />
                        </div><div id="box"></div>
                        
                        <div class="form-group">
                          <input id="b_pw" name="pw" placeholder="비밀번호 영문/숫자 조합 6~15자" class="form-input" type="password" >
                        </div>
                        
                        <div class="form-group">
                          <input type="text" id="b_name" name="name" placeholder="이름을 입력하세요" autocomplete="off" class="form-input"/>
                        </div>
                        <div class="form-group">
                        	<input type="text" id="b_nick" name="nickname" placeholder="별칭을 입력하세요" autocomplete="off" class="form-input"/>
                        </div>
                        
                        <div>
                        	<button type="button" id="reg_btn"  class="btn btn-outline-danger">회원가입</button>&nbsp;&nbsp;
							<button type="button" id="cancle_btn" onclick="javascript:location.href='control?type=main'" class="btn btn-outline-danger">취소</button>
                        </div>
                        
                      </form>
                  </div>
                  
              </div>
          </div>
      </div>
 </div>
	
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script>
		var idChk = false; // 중복 으로 회원가입 체크 판단 부분 
		$(function(){
			// id 중복검사
			$("#b_id").on("keyup",function(){
			      var id = $(this).val();
			      id_info="id="+encodeURIComponent(id);
			      //console.log(id); 확인 완료
			      if(id.trim().length > 4){
			            $.ajax({
			               url:"idCheck.inc",
			               type:"post",
			               data:id_info,
			               dataType:"json"
			         }).done(function(data){
			           		if(data.tru){
			           			$("#box").text("아이디 사용 불가능");
			           			idChk = false; //불가시 중복체크 거짓 
			           		}else{
			           			$("#box").text("아이디 사용 가능");
			           			idChk = true; //가능시 중복체크 참 
			           		}
			         }).fail(function(err) {
			            console.log(err);
			         });
			      }else{
			         $("#box").text("");
			      }      
			            
			   });
			
			$("#reg_btn").bind("click",function(){
				
				var id = $("#b_id").val();
				var pw = $("#b_pw").val();
				var name = $("#b_name").val();
				var nick = $("#b_nick").val();
				var boxi =$("#box").text();
				console.log(boxi);
				
				//공백 인지 확인 유효성 검사 
				if(id.trim().length<1){
					alert("아이디를 입력하세요");
					$("#b_id").focus();
					return;
				}
				if(name.trim().length<1){
					alert("이름을 입력하세요");
					$("#b_name").focus();
					return;
				}
				if(pw.trim().length<1){
					alert("비밀번호를 입력하세요");
					$("#b_pw").focus();
					return;
				}
				if(nick.trim().length<1){
					alert("닉네임을 입력하세요");
					$("#b_nick").focus();
					return;
				}
				//중복체크 확인용 
				if(idChk == false){
					alert("아이디를 확인하세요");
					$("#b_id").focus();
					return;
				}else if(idChk == true){
					frm.submit();	
				}
			});
			
			$("#cancle_btn").bind("click",function(){
				location.href = "main.inc";
			});
			
			
			   
		});
	</script>
</body>
</html>