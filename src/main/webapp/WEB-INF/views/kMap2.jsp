<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/map1.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="map_wrap">
    <ul id="category">
        <li id="CGV" onclick="newMap('CGV')">CGV</li>       
        <li id="LOT" onclick="newMap('LOT')">롯데</li>  
        <li id="MEG" onclick="newMap('MEG')">메가</li>   
    </ul>
</div>
<form action="kmap2.inc" name="frm">
	<input type="hidden" id="name" name="name">
</form>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script>
	function newMap(name) {
		
		var addr = "";
		
		if(name == "CGV"){
			addr = "광명시 CGV";
		}else if(name == "LOT"){
			addr = "광명시 롯데시네마";
		}else if(name == "MEG"){
			addr = "광명시 메가박스";
		}
		
		$("#name").val(addr);
		
		document.frm.submit();
	}
</script>
</body>
</html>