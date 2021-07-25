<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false" errorPage="Error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<style>
      .blink {
        animation: blinker 0.6s linear infinite;
        color: #1c87c9;
        font-size: 20px;
        font-weight: bold;
        font-family: sans-serif;
      }
      @keyframes blinker {
        50% {
          opacity: 0;
        }
      }
      .blink-one {
        animation: blinker-one 1s linear infinite;
      }
      @keyframes blinker-one {
        0% {
          opacity: 0;
        }
      }
      .blink-two {
        animation: blinker-two 1.4s linear infinite;
      }
      @keyframes blinker-two {
        100% {
          opacity: 0;
        }
      }
      
	      
	fieldset {
	  border:4px solid green;
    	-moz-border-radius:8px;
    	-webkit-border-radius:8px;	
    	border-radius:12px;	
    	background-color: white;
	  }
	
	label:hover {cursor:hand;}
</style>
    

<body

	style="background-image: url('${pageContext.request.contextPath}/images/womenShoesBack.jpg');  background-repeat: no-repeat;  background-attachment: fixed;  background-size: 100% 100%;">
	<%@include file="homeHeader.jsp"%>

	
	<a align="center" style="text-decoration:none; font-family: sans-serif; color: blue; font-weight:bold; font-size: 44px;">Womens - Shoe Department - </a>
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
	<a align="center" style="text-decoration:none; font-family: sans-serif; color: red; font-weight:bold; font-size: 50px;" class="blink"><i>all HIGH HEELS are 2 for 1 !!!</i></a>
	

	
	<hr>

	<table>

		<tr>
			<c:forEach items="${womenshoeData}" var="fss">

				<td width="600"><a href="selectedShoe?id=<c:out value='${fss.id}'/>">
						<fieldset>
							<legend
								style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: green; font-size: 25px;">${fss.name}</legend>

							<div>
								<img
									src="${pageContext.request.contextPath}/images/${fss.imagelink}"
									style="float: left; width: 31%; margin-right: 1%; margin-bottom: 0.5em;">
							</div>

							<div>
								<h2
									style="position: fixed; float: Left; text-decoration: none; border-width: 5; border-color: black; text-decoration: none; font-weight: bold; font-family: sans-serif; color: black; font-size: 25px;"></h2>
								<h2
									style="width: auto; float: Left; text-decoration: none; border-width: 5; border-color: black; text-decoration: none; font-weight: bold; font-family: sans-serif; color: black; font-size: 25px;">&nbsp;
									&nbsp;PRICE:</h2>
								<h2
									style="float: Left; text-decoration: none; border-width: 5; border-color: blue; text-decoration: none; font-weight: bold; font-family: sans-serif; color: blue; font-size: 25px;">
									<i>&nbsp;${fss.price} &nbsp;</i>
								</h2>

							</div>
							<div>

								<h2
									style="flex-wrap: wrap; float: Left; text-decoration: none; border-width: 5; border-color: black; text-decoration: none; font-weight: bold; font-family: sans-serif; color: black; font-size: 23px;">
									&nbsp; &nbsp;<i> ${fss.description}</i>
								</h2>
							</div>

						</fieldset>
				</a></td>

			</c:forEach>
		</tr>
	</table>
</body>
</html>