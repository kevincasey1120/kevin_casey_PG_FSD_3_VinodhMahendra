<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false" errorPage="Error.jsp"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Selected Shoe Info</title>
</head>


<style>
.blink {
	animation: blinker 0.9s linear infinite;
	color: #1c87c9;
	font-size: 20px;
	font-weight: bold;
	font-family: sans-serif;
}

@
keyframes blinker { 50% {
	opacity: 0;
}

}
.blink-one {
	animation: blinker-one 1s linear infinite;
}

@
keyframes blinker-one { 0% {
	opacity: 0;
}

}
.blink-two {
	animation: blinker-two 1.4s linear infinite;
}

@
keyframes blinker-two { 100% {
	opacity: 0;
}

}
fieldset {
	border: 4px solid blue;
	-moz-border-radius: 8px;
	-webkit-border-radius: 8px;
	border-radius: 12px;
	background-color: white;
}

label:hover {
	cursor: hand;
}
</style>


<body
	style="background-image: url('${pageContext.request.contextPath}/images/shoesBack.jpg');  background-repeat: no-repeat;  background-attachment: fixed;  background-size: 100% 100%;">


	<%@include file="homeHeader.jsp"%>


	<h2 align="center"
		style="text-decoration: none; font-family: sans-serif; color: black; font-weight: bold; font-size: 30px;">SPORTYSHOES
		- PAYMENT PROCESSING</h2>


	<fieldset>
		<legend
			style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: black; font-size: 20px;">Please
			Verify Your Purchase</legend>
		<div>

			<form action="orderinfo">

				<input type="hidden" name="imglink"
					value="${selectedShoesData.imagelink}" /> <img
					src="${pageContext.request.contextPath}/images/${selectedShoesData.imagelink}"
					style="float: left; width: 20%; margin-right: 1%; margin-bottom: 0.5em;">

				<input type="hidden" name="name" value="${selectedShoesData.name}" />
				<label style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: blue; font-size: 28px;">${selectedShoesData.name}</label>
				<br>
				<input type="hidden" name="id" value="${selectedShoesData.id}" /> 
				<a style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: grey; font-size: 15px;"><i>Store Inventory # </i><label style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: grey; font-size: 12px;"> (${selectedShoesData.id}) </label> </a>
					

			<br>

				<c:choose>
					<c:when test="${selectedShoesData.category =='1'}">
						<c:set var="categoryName" scope="session" value="MENS" />

					</c:when>

					<c:when test="${selectedShoesData.category =='2'}">
						<c:set var="categoryName" scope="session" value="WOMENS" />
					</c:when>

					<c:when test="${selectedShoesData.category =='3'}">
						<c:set var="categoryName" scope="session" value="BOYS" />
					</c:when>

					<c:when test="${selectedShoesData.category =='4'}">
						<c:set var="categoryName" scope="session" value="GIRLS" />
					</c:when>

					<c:otherwise>
						<c:set var="categoryName" scope="session" value="UNKNOWN" />
					</c:otherwise>
				</c:choose>

				<br>
				<br>

				<input type="hidden" name="category" value="${selectedShoesData.category}" /> <b  style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: black; font-size: 20px;">Department : <label  style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: black; font-size: 20px;">${categoryName} SHOES</label> <br> 
					
					<input type="hidden" name="price" value="${selectedShoesData.price}" />
					
					<h2 style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: black; font-size: 20px;">
						Price : <label style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: black; font-size: 20px;">${selectedShoesData.price}</label>
					</h2>
				</b><br> <b> <label for="quantity">Quantity:</label></b> <input
					style="align: center; text-decoration: none; font-family: sans-serif; color: blue; font-weight: bold; font-size: 18px;"
					type="number" id="quantity" name="quantity" min="1" max="5" value=1><br>


				<br> <br>



					<br> 
						<a style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: black; font-size: 20px;">Credit Card Number: </a><input width="210px" height="45px" style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: black; font-size: 14px;" type="text" name="creditnum">
						&nbsp;&nbsp;&nbsp;
						<a style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: black; font-size: 20px;">Exp Date </a>&nbsp;<a style="text-decoration: none; font-weight: normal; font-family: sans-serif; color: black; font-size: 20px;">(mm/yy): </a>
						<input  height="45px" style="width: 50px; text-decoration: none; font-weight: bold; font-family: sans-serif; color: black; font-size: 14px;" type="text" name="creditnum">
						<a style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: red; font-size: 20px;"> *</a>
					<br>


					<br>

				<button class="blink" itemtype="submit"
					style="min-width: 70px; min-height: 35px; border: 2px solid #222222; border-radius: 5px; font-size: 32x; font-weight: bold; background: linear-gradient(to bottom, rgba(220, 34, 34, 0.7) 50%, rgba(170, 40, 40, 0.7) 50%); color: rgba(255, 255, 255, 1.0);">
					COMPLETE PURCHASE</button>


			</form>
		</div>
	</fieldset>
</body>
</html>