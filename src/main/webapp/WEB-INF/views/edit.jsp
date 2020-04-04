<%@page import="mybatis.dao.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#bbs table {
	    width:580px;
	    margin-left:10px;
	    border:1px solid black;
	    border-collapse:collapse;
	    font-size:14px;
	    
	}
	
	#bbs table caption {
	    font-size:20px;
	    font-weight:bold;
	    margin-bottom:10px;
	}
	
	#bbs table th {
	    text-align:center;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	#bbs table td {
	    text-align:left;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	.no {width:15%}
	.subject {width:30%}
	.writer {width:20%}
	.reg {width:20%}
	.hit {width:15%}
	.title{background:lightsteelblue}
	
	.odd {background:silver}
	
		
</style>
<link rel="stylesheet" href="resources/css/summernote-lite.min.css"/>
</head>
<body>
	<div id="bbs">
	<form action="b_editok.inc" method="post" encType="multipart/form-data">
		<table summary="게시판 글쓰기">
			<caption>게시판 수정</caption>
			<tbody>
				
				<tr>
					<th>제목:</th>
					<td><input type="text" id="subject" name="subject" size="45" value="${vo.subject}"/>  </td>
				</tr>
				<tr>
					<th>이름:</th>
					<td><input type="text" id="writer" name="writer" size="12" value="${ vo.writer }"/> </td>
				</tr>
			
				<tr>
					<th>첨부파일:</th>
					<td><input type="file" id="file" name="file"/>(${ vo.file_name })</td>
				</tr>

				<tr>
					<th>비밀번호:</th>
					<td><input type="password" id="pwd" name="pwd" size="12"/></td>
				</tr>

				
			</tbody>
		</table>
		
		<input type="hidden" name="nowPage" value="${ param.nowPage }"/>
		<input type="hidden" name="b_idx" value="${ vo.b_idx }"/>
		<input type="hidden" name="content" id="str" />
	</form>

		<table>
			<tbody>
				<tr>
					<th style="width:83px;">내용:</th>
					<td><textarea name="content" cols="50" rows="8" id="content" ></textarea>
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						<input type="button" value="수정" onclick="sendData()"/>
						<input type="reset" id="reset" value="다시"/>
						<input type="button" id="list" value="목록"/>
					</td>
				</tr>
			</tbody>
		</table>	
	
	</div>
	
	
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/summernote-lite.min.js"></script>
	<script src="resources/js/lang/summernote-ko-KR.min.js"></script>
	<script>
	
		$(function(){
			$("#list").bind("click",function(){
				
				location.href= "notice.inc";
				
			});
			
			$("#reset").bind("click",function(){
				
				var subject = document.getElementById("subject");
				var writer = document.getElementById("writer");
				var content = document.getElementById("content");
				var file = document.getElementById("file");
				var pwd = document.getElementById("pwd");
				
				subject.value = "";
				writer.value = "";
				content.value = "";
				file.value = "";
				pwd.value = "";
			});
			
			$("#content").summernote({
				height: 300,
				width: 550,
				lang: "ko-KR",
				callbacks:{
					onImageUpload: function (files, editor){
						for(var i=0; i<files.length; i++){
							sendFile(files[i], editor);
						}
					}
				}
			});
			
			$("#content").summernote("lineHeight", 1.0);
		});
		
		function sendFile(file, editor){
			
			var frm = new FormData();
			
			frm.append("upload", file);
			
			
			$.ajax({
				url: "saveImage.inc",
				type: "post",
				dataType: "json",
				contentType: false,
				processData: false,
				data: frm
				
			}).done(function(data){
				
				$("#content").summernote(
					"editor.insertImage", data.url);
				
				
			}).fail(function(err){
				console.log(err);
			});
		}
		
		
		function sendData(){
			for(var i=0 ; i<document.forms[0].elements.length ; i++){
				
				if(i > 1)
					break;
				
				if(document.forms[0].elements[i].value == ""){
					alert(document.forms[0].elements[i].name+"를 입력하세요");
					document.forms[0].elements[i].focus();
					return;
				}
			}
			
			var str = $("#content").val();
			$("#str").val(str);
			
			
			document.forms[0].submit();
		}
	</script>
</body>
</html>