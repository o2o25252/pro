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
							<button type="button" onclick="del()">삭제</button>
							<button type="button" onclick="list_go()">목록</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		
		<form  name="frm" method="post">
			<input type="hidden" name="b_idx" value="${ param.b_idx }"/>
			<input type="hidden" id="cPage" name="nowPage" value="${ param.nowPage }">
		</form>
		
	</div>
	
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/jquery-ui.min.js"></script>
	<script type="text/javascript">
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
		
	</script>
	
</body>
</html>