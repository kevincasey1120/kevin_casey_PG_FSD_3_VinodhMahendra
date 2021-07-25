<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false" errorPage="Error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Form</title>
<style>
table, td, th {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
</head>
<body style="background-image: url('${pageContext.request.contextPath}/images/adminBack.jpg');  background-repeat: no-repeat;  background-attachment: fixed;  background-size: 100% 100%;">

	<h2 align="center" style="text-decoration:none; font-family: sans-serif; color: #66ff67; font-weight:bold; font-size: 30px;">ADMINISTRATOR TOOLS</h2>
	<br>
	<a style="text-decoration:none; font-family: sans-serif; color: green; font-weight:bold; font-size: 20px;">ADMINISTRATOR ACCESS: </a> 
	<a style="text-decoration:none; font-family: sans-serif; color: #66ff67; font-size: 20px;">( GRANTED )</a>
&nbsp; &nbsp; &nbsp; 
	<a style="text-decoration:none; font-family: sans-serif; color: green; font-weight:bold; font-size: 20px;">ACCOUNT: </a> 
	<a style="text-decoration:none; font-family: sans-serif; color: #66ff67; font-size: 20px;">(  ${username} )</a>
	

	<%@include file="adminHeader.jsp"%>
	<hr>

	<table>
		<tr>
			<th>Name</th>
			<th>Price</th> 
			<th>Category</th>
			<th>Img_Link</th>
			<th>Update</th>
			<th>Delete</th>

		</tr>
		<c:forEach items="${men_women_kids_ShoeDataname}" var="fss">
			<tr>
				<td>${fss.name}</td>
				<td>${fss.price}</td>
				<td>${fss.category}</td>
				<td>${fss.imagelink}</td>

				<td><a href="updateProduct?id=<c:out value='${fss.id}' />">update</a></td>
				<td><a href="deleteProduct?id=<c:out value='${fss.id}' />">delete</a></td>

			</tr>
		</c:forEach>

	</table>


</body>

<script>

</script>
</html>