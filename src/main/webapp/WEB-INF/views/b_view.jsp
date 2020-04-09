<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap core CSS -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/jquery-ui.min.css"/>
<link rel="stylesheet" href="resources/css/styles.css" />
<style type="text/css">
	#bbs{
		padding: auto;
	}
	#v_bbs{
		border: 1px solid black;
		border-collapse: collapse;
		float: center;
		width: 900px;
		height: auto;
		padding: auto;
		margin: auto;
	}
	#v_bbs th,#v_bbs td{
		border: 1px solid black;
	}
	#v_bbs th{
		background-color: #C3C3C3;
	}
	#del_win{
		display: none;
	}
	.show{display: block;}
	.none{display: none; }
	label{
		display: inline-block;
		width: auto;
	}
	#notice{
		width: auto;
		text-align: center;
	}
	#heights{
		margin-top: 10px;
		margin-bottom: 10px;
	}
</style>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div id="bbs" class="container">
		<form method="post">
			<div id="notice">
				<div id="heights"></div>
				<h2>공지사항</h2>
			</div>
			<table id="v_bbs" class="table">
				<tbody>
					<tr>
						<th><label>제목:</label></th>
						<td>${ vo.subject }</td>
						<th><label>조회수:</label></th>
						<td>${ vo.hit }</td>
					</tr>
					<tr>
						<th><label>첨부 파일:</label></th>
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
						<th><label>이름:</label></th>
						<td colspan="3">${ vo.writer }</td>
					</tr>
					<tr>
						<th><label>내용:</label></th>
						<td colspan="3"><pre>${ vo.content }</pre></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="4" style="text-align: right; background-color: #F2F7F9;">
						<c:if test="${ sessionScope.userVO.status eq 9}">
							<button type="button" onclick="edit()" class="repSumbit btn btn-primary">수정</button>
							<button type="button" id="del_btn" class="repSumbit btn btn-warning">삭제</button>
							</c:if>
							<button type="button" onclick="list_go()" class="repSumbit btn btn-danger">목록</button>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
		<!-- 댓글 입력란 -->
		<hr/>
		<form action="b_editok.inc" method="post">
			<div id="text_box">
				<input type="hidden" id="b_idx" name="b_idx" value="${vo.b_idx }">
				<input type="hidden" id="b_id" name="b_id" value="${userVO.nickname }">
				<table>
					<tbody> 
						<h2></h2>
						<tr>
							<td><input type="hidden" id="c_writer2" value="${userVO.nickname }"/></td>
						</tr>
						<tr>
							<td><textarea cols="130" rows="6" id="c_content" name="c_content"></textarea>&nbsp;&nbsp;</td>
							<td><input type="button" value="저장" onclick="add_coment()" class="repSumbit btn btn-danger"/></td>
						</tr>
					</tbody>
				</table>
			</div>
			<hr/>
			<hr/>
		</form>
		
		<!-- 댓글 출력란 -->
		<div id="comm_add">
			
		</div>
		<form  name="frm" method="post">
			<input type="hidden" name="b_idx" value="${ param.b_idx }"/>
			<input type="hidden" id="cPage" name="nowPage" value="${ param.nowPage }"/>
		</form>
		</div>
		
	<!-- 게시물 -->	
	<div id="del_win">
         <form>
               <input type="hidden" name="b_idx" id="b_idx"
                  value="${vo.b_idx }"/>
               <label for="b_pw">비밀번호:</label>
               <input type="password" id="b_pw" name="b_pw"/>
               <br/>
               <button type="button" id="delete_bt" class="repSumbit btn btn-danger">삭제</button>
               <button type="button" id="close_bt" class="repSumbit btn btn-primary">닫기</button>
               <input type="hidden" name="nowPage" value="${param.nowPage }">
         </form>
   </div>
	<
	
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
			document.frm.action = "b_editgo.inc";
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
			+"&pwd="+encodeURIComponent(pw);
			
			
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
		//엔터시 등록
		$("#c_pwd").keydown(function(key){
			if (key.keyCode == 13) {
				var pw = $("#c_pwd").val().trim().replace(/ /g, "%20");
				
				if(pw==0){
					alert("비밀번호 입력하세요");
				}
				
			}
		});
		
	});
	//댓글 등록 함수
	function add_coment(){
		var c_writer =$("#c_writer2").val();
		var c_pwd = $("#c_pwd").val();
		var c_content = $("#c_content").val();
		console.log(c_writer);
		//등록후 초기화
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
			
			view_coment(c_pwd);		// 댓글 표현
			
		}).fail(function(err){
			console.log("실패");
			alert(err);
		});
	}
	//댓글 표현 함수 
	function view_coment(c_pwd) {
		
		var c_pwd = c_pwd; //댓글 삭제시 필요 
		var c_idx = $("#c_idx").val();//댓글 삭제시 필요
		var c_writer2 = $("#c_writer2").val();// writer 가져오기
		
		
		var view_cinfo ="b_idx="+encodeURIComponent(b_idx);
		
		$.ajax({
			url: "comm_view.inc",
			data: view_cinfo,
			type:"post",
			dataType:"json"
		}).done(function(data){
			if(data.c_ar = undefined){
				
				var code ="";
				for(var i =0; i<data.c_ar.length; i++){
					
					code += "<hr/><form><label>작성자 : </label>";
					code += "<label>"+data.c_ar[i].writer+"</label>";
					code += "<br/>";
					code += "<label>내용 : </label>";
					code += "<span class='show' id='sp"+i+"'>";
					code += data.c_ar[i].content;
					code += "</span>";
					
					code += "<textarea class='none' name='content' id='content"+i+"' rows='2' cols='12'>"+data.c_ar[i].content+"</textarea>";
					code += "</br>";
					code += "<input type='hidden' name='c_c_idx' id='c_c_idx"+i+"' value=\"";
					code += data.c_ar[i].c_idx;
					code += "\"/>";
					if((${ sessionScope.userVO.status} == 9)  || ("${sessionScope.userVO.nickname}" == data.c_ar[i].writer)){
						code += "<input type='text' class='none' name='c_pwd' id='c_pwd"+i+"'/>";
						code += "<input type = 'button' onclick=\"c_del("+data.c_ar[i].c_idx+")\" value=\'삭제\' class='repSumbit btn btn-danger'/>";
						code += "<input type = 'button' onclick='c_edit("+i+")' value='수정' class='repSumbit btn btn-warning'/></form>";
					}
				}
				$("#comm_add").html(code);
			}
						
		}).fail(function(err){
			console.log(err);
		});
	}
	// 댓글 삭제시
	function c_del(c_idx,c_pwd){
		var writer = $("#b_id").val();
		var del_cinfo ="c_idx="+encodeURIComponent(c_idx)+"&writer="+encodeURIComponent(writer);
		
		$.ajax({
			url: "comm_del.inc",
			data: del_cinfo,
			type:"post",
			dataType:"json"
		}).done(function(data){
			
			if(data.chk){
				if(data.writer == writer){
					alert("댓글삭제 완료");
					location.href="b_view.inc?nowPage=${nowPage}&b_idx=${b_idx}";
				}
			}else{
				alert("삭제 실패!");
			}
		}).fail(function(err){
			console.log(err)
		});
		
		
	}
	
	var value = true;
	//댓글 수정
	function c_edit(idx){
		
		if(value){ //처음 수정버튼을 누렀을 때는 수정할 수 있는 화면으로 전환!!
			//수정선택시 해당 폼객체를 얻어낸다.
			frm = document.forms[idx+2];
			
			$("#sp"+idx).removeClass("show");
			$("#sp"+idx).addClass("none");//jquery로 클래스 지정
			$("#content"+idx).removeClass("none");
			$("#content"+idx).addClass("show");
			$("#c_id"+idx).removeClass("none");
			$("#c_id"+idx).addClass("show");
			
			value = false;
		}else{//수정버튼을 두번째(짝수번째) 클릭했을 때는 DB의 내용을 수정해야 한다.
			//확인 완료 
			var c_idx = $("#c_c_idx"+idx).val();
			var c_content = $("#content"+idx).val();
			var writer = $("#b_id").val();
			var edit_cinfo ="c_idx="+encodeURIComponent(c_idx)+"&writer="+encodeURIComponent(writer)+"&content="+encodeURIComponent(c_content);
			
			$.ajax({
				url: "c_editok.inc",
				data: edit_cinfo,
				type:"post",
				dataType:"json"
			}).done(function(data){
				
				if(data.chk){
					
					$("#sp"+idx).removeClass("none");
					$("#sp"+idx).addClass("show");//jquery로 클래스 지정
					$("#content"+idx).removeClass("show");
					$("#content"+idx).addClass("none");
					$("#c_pwd"+idx).removeClass("shone");
					$("#c_pwd"+idx).addClass("none");
					
					$("#sp"+idx).text(c_content); //텍스트 에어리어 입력한 값을 sp 에 삽입하는 부분 
					
					
					alert("댓글 수정 성공");
					
				}else{
					alert("댓글 수정 실패!");
				}
			}).fail(function(err){
				console.log(err)
			});
			value = true;
		}
	}
	</script>
	
</body>
</html>