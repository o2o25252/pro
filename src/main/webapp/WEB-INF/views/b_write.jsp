<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/summernote-lite.min.css">
<link rel="stylesheet" href="resources/css/styles.css" />
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="resources/js/summernote-lite.min.js"></script>
<script type="text/javascript" src="resources/js/lang/summernote-ko-KR.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#str").summernote({
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
</head>
<body>
		<%--메뉴 바 가져오기 --%>
		<jsp:include page="menu.jsp" />
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="center" height="10"></td>
        </tr>
        <tr>
          <td align="center"><u><b>BBS 글쓰기</b></u></td>
        </tr>
        <tr>
          <td align="center" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td>&nbsp;</td>
              </tr>
            </table>
            
            <form action="b_add.inc" method="post" enctype="multipart/form-data" name="frm">
				<input type="hidden" name="nowPage" value="${nowPage }"/>
				<input type="hidden" name="content" id="content"/>
	            <table width="556" border="0" cellspacing="0" cellpadding="0">
	              <tr>
	                <td height="2" bgcolor="#C3C3C3"></td>
	              </tr>
	              <tr>
	                <td bgcolor="#E5E5E5"><table width="100%" border="0" cellspacing="1" cellpadding="2">
	
	                    <tr>
	                      <td width="90" height="20" align="center" bgcolor="#669AB3"><font color="#FFFFFF">작성자</font></td>
	                      <td bgcolor="#F2F7F9" align="left"> <input type="text" id="writer" name="writer" cssStyle="width:100px" theme="simple"/></td>
	                    </tr>
	
	                    <tr>
	                      <td height="20" align="center" bgcolor="#669AB3"><font color="#FFFFFF">제목</font></td>
	                      <td bgcolor="#F2F7F9" align="left"> <input type="text" id="subject" name="subject" size="50" theme="simple"/></td>
	                    </tr>
	                    <tr>
	                      <td height="20" align="center" bgcolor="#669AB3"><font color="#FFFFFF">첨부파일</font></td>
	                      <td bgcolor="#F2F7F9" align="left">
	                        <input type="file" name="upload" cssStyle="width:300px" theme="simple"/>
	                      </td>
	                    </tr>
	                    <tr>
	                      <td height="20" align="center" bgcolor="#669AB3"><font color="#FFFFFF">비밀번호</font></td>
	                      <td bgcolor="#F2F7F9" align="left"> <input type="password" id="pwd" name="pwd" cssStyle="width:200px" theme="simple"/>
	                        <font color="#0066CC">* 삭제.수정시 필요</font> </td>
	                    </tr>
	                  </table></td>
	              </tr>
	            </table>
	            
            </form>
            <table width="556" border="0" cellspacing="0" cellpadding="0">
              <tr>
              	<td height="20" align="center" bgcolor="#669AB3"><font color="#FFFFFF">내용</font></td>
              </tr>
              <tr>
              	<td bgcolor="#F2F7F9" align="left"> <textarea id="str" name="str" cols="50" rows="10" theme="simple"></textarea></td>
              </tr>
              <tr>
                <td height="20" valign="middle"><img src="resources/images/sub_it/point_line.gif" width="556" height="3"></td>
              </tr>
              <tr>
                <td align="right"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="315" align="center">
                        
                      </td>
                      <td width="241" align="right">
                      <input type="button" onclick="javascript: location.href='notice.inc?nowPage=${nowPage}'" value="목록"/>
                      <input type="button" onclick="check()" value="보내기"/>
                      <input type="reset" value="재입력"/>
                      </td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td height="19"></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
	
</body>
</html>