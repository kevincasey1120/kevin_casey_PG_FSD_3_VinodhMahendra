<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="Error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>
</head>
<body>

	<%@include file="homeHeader.jsp"%>

	<hr>
	<form name="adduserform" action="signupnewuser"
		onsubmit="return addUserValidationForm()">

		<h3
			style="text-decoration: none; font-family: sans-serif; color: Blue; font-size: 30px;">ACCOUNT
			REGISTRATION FORM</h3>
		<br>


		<form>
			<fieldset>
				<legend
					style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: Blue; font-size: 20px;">Please	select your new account type:</legend>
				<div>
					<input type="radio"	id="user" name="roll" value="user" > <label for="user-choice">New Member</label>
						&nbsp; &nbsp; 
					<input type="radio" id="admin" name="roll" value="admin" > <label for="admin-choice">Administrator</label> 
				</div>
			</fieldset>


			<br> <br> <br>


			<fieldset>
				<legend
					style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: Blue; font-size: 20px;">Member Name:</legend>
				<div>
					<br> 
						FirstName (UserName): <input type="text" name="firstname">
						<a style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: red; font-size: 16px;"> *</a>
						
						&nbsp; &nbsp; &nbsp; 
						
						LastName : <input type="text" name="lastname">
						<a style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: red; font-size: 16px;"> *</a>
					<br>
				</div>
			</fieldset>


			<br> <br> <br>


			<fieldset>
				<legend
					style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: Blue; font-size: 20px;">Login
					Data:</legend>
				<div>
					<br> 
						Password : <input type="text" name="password">
						<a style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: red; font-size: 16px;"> *</a>
						
						&nbsp; &nbsp;  &nbsp; 
						
						Confirm Password : <input type="text" name="confirmpassword"> 
						<a style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: red; font-size: 16px;"> *</a>
					<br>
				</div>
			</fieldset>

			<br> <br> <br>

			<fieldset>
				<legend
					style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: Blue; font-size: 20px;">Contact Information:</legend>
				<div>
					<br> 
						Phone Number : <input type="text" name="mobileno">
						<a style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: red; font-size: 16px;"> *</a>
						<br> <br> 
						
						Email Address: <input type="text" name="email">
						<a style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: red; font-size: 16px;"> *</a>
					<br>
				</div>
			</fieldset>


			<div id="sDiv" style="font-size: 50px; font-weight: bold; color: rgba(255, 220, 200, 1.0); text-align: left;">
				<button
					style="width: 300; height: 35; border: 2px solid #222222; border-radius: 5px; font-size: 32x; font-weight: bold; background: linear-gradient(to bottom, rgba(178, 34, 34, 0.7) 50%, rgba(80, 4, 4, 0.7) 50%); color: rgba(255, 255, 255, 1.0);">CREATE
					ACCOUNT</button>
			</div>
		</form>



	</form>
</body>
<script type="text/javascript">
function addUserValidationForm() {
	   
	  var firstname = document.forms["adduserform"]["firstname"].value;
	  var lastname = document.forms["adduserform"]["lastname"].value;
	  var password = document.forms["adduserform"]["password"].value;
	  var confirmpassword = document.forms["adduserform"]["confirmpassword"].value;
	  var roll = document.forms["adduserform"]["roll"].value;
	  var mobileno = document.forms["adduserform"]["mobileno"].value;
	  var email = document.forms["adduserform"]["email"].value;
	   
	  
	  if (firstname == "") {
		    alert("firstname must be filled out");
		    return false;
		  }
	  if (lastname == "") {
		    alert("lastname must be filled out");
		    return false;
		  }
	  if (password == "") {
		    alert("password must be filled out");
		    return false;
		  }
		  if (confirmpassword == "") {
			    alert("confirmpassword must be filled out");
			    return false;
			  }
		  if (roll == "") {
			    alert("roll must be filled out");
			    return false;
			  }
		  if (mobileno == "") {
			    alert("mobileno must be filled out");
			    return false;
			  }
		  if (email == "") {
			    alert("email must be filled out");
			    return false;
			  }	  
	  
	}
</script>
</html>