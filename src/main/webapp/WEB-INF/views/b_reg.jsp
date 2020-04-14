<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 메뉴 css -->
<link rel="stylesheet" href="resources/css/styles.css" />
<style type="text/css">
	#registry{
		border: 1px solid black;
		margin: auto;
	}
	#box{
		border: 3px solid red;
		
	}
</style>
</head>
<body>
	
	<jsp:include page="menu.jsp" />
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<div id="registry">
		<form action="regOk.inc" method="post" name="frm">
			<h3>회원 가입</h3>
			<table>
				<tr>
					<th><label for="b_id">아이디:</label></th>
					<td><input type="text" id="b_id" name="id" placeholder="아이디를 입력하세요" autocomplete="off"/><div id="box"></div> </td>
				</tr>
				<tr>
					<th><label for="b_name">이름:</label></th>
					<td><input type="text" id="b_name" name="name" placeholder="이름을 입력하세요" autocomplete="off"/></td>
				</tr>
				<tr>
					<th><label for="b_pw">비밀번호:</label></th>
					<td><input type="password" id="b_pw" name="pw" placeholder="영문/숫자 조합 6~15자"/></td>
				</tr>
				<tr>
					<th><label for="b_nick">닉네임:</label></th>
					<td><input type="text" id="b_nick" name="nickname" placeholder="이름을 입력하세요" autocomplete="off"/></td>
				</tr>
				</table><br/><br/><br/>
			<button type="button" id="reg_btn"  class="btn btn-success">회원가입</button>&nbsp;&nbsp;
			<button type="button" id="cancle_btn" onclick="javascript:location.href='control?type=main'" class="btn btn-success">취소</button>
		</form>
	</div>
	
	
	<script>
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
			           		}else{
			           			$("#box").text("아이디 사용 가능");
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
				
				frm.submit();
			});
			
			$("#cancle_btn").bind("click",function(){
				location.href = "main.inc";
			});
			
			
			   
		});
	</script>
</body>
</html>