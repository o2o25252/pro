<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Loading...  
</h1>
<form method="post"></form>
</body>
<script type="text/javascript">
	document.forms[0].action = "realmain.inc"
	document.forms[0].submit();
</script>
</html>
