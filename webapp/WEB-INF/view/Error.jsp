<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sporty Shoes</title>
</head>
<body style="background-image: url('${pageContext.request.contextPath}/images/redErrorBack.jpg');  background-repeat: no-repeat;  background-attachment: fixed;  background-size: 100% 100%;">
		<h1>Error</h1>
		<h2><%=exception.getMessage() %><br/> </h2>
	 
</body>
</html>