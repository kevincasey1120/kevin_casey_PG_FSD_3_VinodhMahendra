<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="Error.jsp" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign In</title>
</head>
<body>




	<%@include file="homeHeader.jsp"%>




	<form action="adminsignin" 
style="background-image: url('${pageContext.request.contextPath}/images/loginBack.png');  background-repeat: no-repeat;  background-attachment: fixed;  background-size: 100% 100%;"
	>
		<hr>



		<fieldset>
			<legend
				style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: green; font-size: 25px;">${fss.name}</legend>

			<div>
				<h1
					style="text-decoration: none; font-family: sans-serif; color: white; font-weight: bold; font-size: 55px;">Please
					Login Below</h1>
				<b><font color="red">${errorMessage}</font></b>

				<h2
					style="text-decoration: none; font-family: sans-serif; color: white; font-weight: bold; font-size: 28px;">
					UserName &nbsp; &nbsp; <input
						style="text-decoration: none; font-family: sans-serif; color: black; font-weight: bold; font-size: 28px;"
						type="text" name="username">
				</h2>
				<h2
					style="text-decoration: none; font-family: sans-serif; color: white; font-weight: bold; font-size: 28px;">
					Password &nbsp; &nbsp;&nbsp; <input
						style="text-decoration: none; font-family: sans-serif; color: black; font-weight: bold; font-size: 28px;"
						type="password" name="password">
				</h2>


				<br>
				<br>


				<h2 align="left" class="container">
					<button class="blink" itemtype="submit"
						style="align: center; min-width: 290px; min-height: 30px; border: 5px solid #aaffaa; border-radius: 5px; font-size: 30px; font-weight: bold; background: linear-gradient(to bottom, rgba(255, 255, 255, 0.7) 50%, rgba(200, 200, 200, 0.7) 50%); color: rgba(0, 0, 0, 1.0);">
						Click To Login</button>
				</h2>
			</div>

		</fieldset>


	</form>

</body>
</html>