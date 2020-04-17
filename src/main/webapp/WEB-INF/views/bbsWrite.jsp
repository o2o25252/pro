<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/summernote-lite.min.css">
<link rel="stylesheet" href="resources/css/styles.css"/>
<style type="text/css">
	.content{
		text-align: left;
	}
</style>
</head>
<body>
	<div>
	<jsp:include page="menu.jsp" />
	</div>
	<div>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td valign="top">
	      <table border="0" cellspacing="0" cellpadding="0"  style="width:800px; margin: auto;">
	        <tr>
	          <td align="center" height="10"></td>
	        </tr>
	        <tr>
	          <td align="center"><u><b>BBS 글쓰기</b></u></td>
	        </tr>
	        <tr>
	          <td align="center" valign="top">
	          <table width="100%" border="0" cellspacing="0" cellpadding="0">
	              <tr>
	                <td>&nbsp;</td>
	              </tr>
	            
	           </table>
	            <form action="bbsAdd.inc" method="post" enctype="multipart/form-data" name="frm" style="border: 1px solid gray;">
					<input type="hidden" name="nowPage" value="${nowPage }"/>
					<input type="hidden" name="content" id="content"/>
		            <table  border="0" cellspacing="0" cellpadding="0" style="width : 800px;">
		              <tr>
		                <td height="2" bgcolor="#C3C3C3"></td>
		              </tr>
		              <tr style="text-align: left;">
		                <td bgcolor="#E5E5E5">
		                <table border="0" cellspacing="1" cellpadding="2" style="width: 800px;">
		                    <tr>
		                      <td width="90" height="20" align="center" bgcolor="#669AB3"><font color="#FFFFFF">작성자</font></td>
		                      <td bgcolor="#F2F7F9" align="left" class="content"> <input type="text" id="writer" name="writer" theme="simple"/></td>
		                    </tr>
		                    <tr>
		                      <td height="20" align="center" bgcolor="#669AB3"><font color="#FFFFFF">제목</font></td>
		                      <td bgcolor="#F2F7F9" align="left" class="content"> <input type="text" id="subject" name="subject" theme="simple"/></td>
		                    </tr>
		                    <tr>
		                      <td height="20" align="center" bgcolor="#669AB3"><font color="#FFFFFF">첨부파일</font></td>
		                      <td bgcolor="#F2F7F9" align="left" class="content">
		                      	<input type="file" name="upload" cssStyle="width:300px" theme="simple"/>
		                      </td>
		                    </tr>
		                    <tr>
		                      <td height="20" align="center" bgcolor="#669AB3"><font color="#FFFFFF">비밀번호</font></td>
		                      <td bgcolor="#F2F7F9" align="left" class="content"> <input type="password" id="pwd" name="pwd" cssStyle="width:200px" theme="simple"/>
		                      <font color="#0066CC">* 삭제.수정시 필요</font> </td>
		                    </tr>
		                  </table></td>
		              </tr>
		            </table>
		           </form>
	            <table  border="0" cellspacing="0" cellpadding="0">
	              <tr>
	              	<td height="20" align="center" bgcolor="#669AB3"><font color="#FFFFFF">내용</font></td>
	              </tr>
	              <tr>
	              	<td bgcolor="#F2F7F9" align="left" style="text-align: left;"><textarea id="str" name="str" cols="80" rows="10"></textarea></td>
	              </tr>
	              <tr>
	                <td height="20" valign="middle"><img src="resources/images/sub_it/point_line.gif" width="556" height="3"></td>
	              </tr>
	              <tr>
	                <td align="right"> 
	                <table width="100%" border="0" cellspacing="0" cellpadding="0">
	                    <tr>
	                      <td width="241" align="right" style="text-align: right;">
		                      <input type="button" onclick="javascript: location.href='notice.inc?nowPage=${nowPage}'" value="목록" class="repSumbit btn btn-danger"/>
		                      <input type="button" onclick="check()" value="보내기" class="repSumbit btn btn-primary"/>
	                      </td>
	                    </tr>
	                  </table>
	              </tr>
	            </table>
	        <tr>
	          <td height="19"></td>
	        </tr>
	      </table>
	    </td>
	  </tr>
	</table>
	</div>
	<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="resources/js/summernote-lite.min.js"></script>
	<script type="text/javascript" src="resources/js/lang/summernote-ko-KR.min.js"></script>
	<script type="text/javascript">
	$(function(){
		$("#str").summernote({
			height: 400,
			width: 800,
			lang: "ko-KR",
			callbacks:{
				onImageUpload: function (files, editor){
					for(var i=0; i<files.length; i++){
						sendFile(files[i], editor);
					}
				}
			}
		});
		$("#str").summernote("lineHeight", 1.0);
	});
	
	function sendFile(file, editor){
		var frm = new FormData();
		frm.append("upload", file);
		 
		$.ajax({
			url: "saveImage.inc",
			type: "post",
			data: frm,
			dataType: "json",
			contentType: false,
			processData: false
		}).done(function(data){
			$("#str").summernote("editor.insertImage", data.url);
		}).fail(function(err){
			console.log(err);
		});
	}

	function check(){
		//유효성 검사
		var writer = $("#writer").val().trim();
		var title = $("#subject").val().trim();
		var str = $("#str").val().trim();
		var pwd = $("#pwd").val().trim();
		
		if(writer.length < 1){
			alert("작성자를 입력하세요!");
			$("#writer").focus();
			return;
		}
		
		if(title.length < 1){
			alert("제목을 입력하세요!");
			$("#subject").focus();
			return;
		}
		
		if(pwd.length < 1){
			alert("비밀번호를 입력하세요!");
			$("#pwd").focus();
			return;
		}
		
		if(str.length < 1){
			alert("내용을 입력하세요!");
			$("#str").focus();
			return;
		}
		
		$("#content").val(str);
		
		document.frm.submit(); 
	}
</script>
</body>
</html>