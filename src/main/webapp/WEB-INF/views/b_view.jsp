<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="resources/css/jquery-ui.min.css"/>
<link rel="stylesheet" href="resources/css/styles.css" />
<style type="text/css">
	#v_bbs{
		border: 1px solid black;
		border-collapse: collapse;
		float: center;
		width: 600px;
		height: 150px;
		margin: auto;
	}
	#v_bbs th,#v_bbs td{
		border: 1px solid black;
	}
	#v_bbs{
		text-decoration: none;
	}
	#v_bbs{
		text-align: center;
	}
	#v_bbs th{
		padding:4px 10px;
	}
	#v_bbs td{
		text-align: left;
		padding:4px 10px;
	}
	#noti{
		margin: auto;
		height: 90px;
	}
	#del_win{
		display: none;
	}
	
</style>

</head>
<body>
	<jsp:include page="menu.jsp"/>
	
	<div id="bbs">
		<form method="post">
			<table id="v_bbs">
				<tbody>
					<tr>
						<th>제목:</th>
						<td>${ vo.subject }</td>
						<th>조회수:</th>
						<td>${ vo.hit }</td>
					</tr>
					<tr>
						<th>첨부 파일:</th>
						<td colspan="3">
							<c:if test="${ vo.file_name != null and fn:length(vo.file_name) >4 }">
								<a href="javascript: download('${vo.file_name }')">
									${vo.file_name }
									클릭시 다운로드
								</a>
							</c:if>
						</td>
					</tr>
					<tr>
						<th>이름:</th>
						<td colspan="3">${ vo.writer }</td>
					</tr>
					<tr>
						<th>내용:</th>
						<td colspan="3"><pre>${ vo.content }</pre></td>
					</tr>
					<tr>
						<td colspan="4" >
							<button type="button" onclick="edit()">수정</button>
							<button type="button" id="del_btn" >삭제</button>
							<button type="button" onclick="list_go()">목록</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<!-- 댓글 입력란 -->
		<hr/>
		
			<form action="" method="post">
				<div>
					<input type="hidden" id="b_idx" name="b_idx" value="${vo.b_idx }">
					<table>
						<tbody>
							<tr>
								<td><label for="c_writer">작성자:</label></td>
								<td><input type="text"  id="c_writer" name="c_writer"/> </td>
							</tr>
							<tr>
								<td><label for="c_content">내용:</label></td>
								<td><textarea cols="" rows="" id="c_content" name="c_content"></textarea> </td>
							</tr>
							<tr>
								<td><label for="c_pwd">비밀번호:</label></td>
								<td><input type="password" id="c_pwd" name="c_pwd"/></td>
							</tr>
							<tr>
								<td><input type="button" value="저장" onclick="add_coment()"/></td>
							</tr>
						</tbody>
					</table>
				</div>
			</form>
		
		<!-- 댓글 출력란 -->
				<div id="comm_add">
					
				</div>
		
		<form  name="frm" method="post">
			<input type="hidden" name="b_idx" value="${ param.b_idx }"/>
			<input type="hidden" id="cPage" name="nowPage" value="${ param.nowPage }">
		</form>
		
		
	</div>
	<div id="del_win">
         <form>
               <input type="hidden" name="b_idx" id="b_idx"
                  value="${vo.b_idx }"/>
               <label for="b_pw">비밀번호:</label>
               <input type="password" id="b_pw" name="b_pw"/>
               <br/>
               <button type="button" id="delete_bt">삭제</button>
               <button type="button" id="close_bt">닫기</button>
               <input type="hidden" name="nowPage" value="${param.nowPage }">
         </form>
   </div>
	
	
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/jquery-ui.min.js"></script>
	<script type="text/javascript">
	var b_idx =$("#b_idx").val();
	
	//목록
		function list_go(){

			document.frm.action = "notice.inc";
			document.frm.submit();
			
		}
	//다운로드 서블릿 이동	
		function download(fname){
			console.log(fname);
			location.href="FileDownload?dir=/resources/upload&f_name="+fname;
			
		}
		
	
	// 수정 화면 전환
		function edit(){
			document.frm.action = "editgo.inc";
			document.frm.submit();
		
	}

	$(function () {
		
		view_coment();
		
		// 삭제 다이어로그 
		$("#del_btn").bind("click",function(){
			$("#del_win").css("display", "block");
			$("#del_win").dialog();
		});
		
		$("#close_bt").bind("click",function(){
			$("#del_win").dialog("close");
		});
		
		$("#delete_bt").bind("click",function(){
			// pw
			var b_idx =$("#b_idx").val();
			var pw =$("#b_pw").val();
			
			console.log(pw);
			
			var param = "b_idx="+encodeURIComponent(b_idx)
			+"&pw="+encodeURIComponent(pw);
			
			
			$.ajax({
				url: "b_del.inc",
				data: param,
				type:"post",
				dataType:"json"
			}).done(function(data){
				$("#dwl_win").dialog("close");
				
				if(data.chk){
					alert("삭제성공");					
					location.href="notice.inc?nowPage=${param.nowPage}";
				}else
					alert("비밀번호가 틀렸어요 확인해보세요");
				
							
			}).fail(function(err){
				console.log("실패");
				alert(err);
			});
			
		});
		
	});
	//댓글 등록 함수
	function add_coment(){
		var c_writer =$("#c_writer").val();
		var c_pwd = $("#c_pwd").val();
		var c_content = $("#c_content").val();
		console.log(c_writer);
		
		//등록후 초기화
		$("#c_writer").val("");
		$("#c_pwd").val("");
		$("#c_content").val("");
		
		var c_info = "b_idx="+encodeURIComponent(b_idx)+"&c_writer="+encodeURIComponent(c_writer)+
		"&c_pwd="+encodeURIComponent(c_pwd)+"&c_content="+encodeURIComponent(c_content);
		
		$.ajax({
			url: "comm_add.inc",
			data: c_info,
			type:"post",
			dataType:"json"
		}).done(function(data){
			
			view_coment();		// 댓글 표현
			
		}).fail(function(err){
			console.log("실패");
			alert(err);
		});
	}
	//댓글 표현 함수 
	function view_coment() {
		
		var view_cinfo ="b_idx="+encodeURIComponent(b_idx);
		
		$.ajax({
			url: "comm_view.inc",
			data: view_cinfo,
			type:"post",
			dataType:"json"
		}).done(function(data){
			if(data.c_ar != undefined){
				
				console.log(data);
				
				var code ="";
				for(var i =0; i<data.c_ar.length; i++){
					code += "<hr/><label>작성자 : </label>";
					code += "<label>";
					code += data.c_ar[i].writer;
					code += "</label>";
					code += "<br/>";
					code += "<label>내용 : </label>";
					code += "<label>";
					code += data.c_ar[i].content;
					code += "</label>";
				}
				$("#comm_add").html(code);
			}
						
		}).fail(function(err){
			console.log("실패");
			alert(err);
		});
	}
	
	
	</script>
	
</body>
</html>