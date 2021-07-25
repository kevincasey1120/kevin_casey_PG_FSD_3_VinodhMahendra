<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="Error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Admin Password</title>
</head>
<body style="background-image: url('${pageContext.request.contextPath}/images/codedBlackBack.jpg');  background-repeat: no-repeat;  background-attachment: fixed;  background-size: 100% 100%;">

<%@include file="changePassHeader.jsp" %>
  
      <form name="changeform" action="changeadminPassword" onsubmit="return changePasswordvalidateForm()">
    
      <br><br>
      
      		<fieldset>
			<legend
				style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: white; font-size: 20px;">PASSWORD RESET</legend>
			<div>
				<br> 
			      <a style="text-decoration: none; font-family: sans-serif; color: white; font-size: 16px;">Current Password : <input  type="text" name="currentpassword" ></a>
			      <br><br>
			      <br><br>
			      
			      <a style="text-decoration: none; font-family: sans-serif; color: #ccffcc; font-size: 16px;">New Password : <input  type="text" name="newpassword" ></a>
			      &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			      <a style="text-decoration: none; font-family: sans-serif; color: #ccffcc; font-size: 16px;">Confirm Password : <input  type="text" name="confirmpassword" ></a>
      
       				<br><br>
       				<br>
     
      			<b> 
					<button input type="submit"
						style="width: 350; height: 40; border: 2px solid #222222; border-radius: 5px; font-size: 32x; font-weight: bold; background: linear-gradient(to bottom, rgba(178, 34, 34, 0.7) 50%, rgba(80, 4, 4, 0.7) 50%); color: rgba(255, 255, 255, 1.0);">
						RESET PASSWORD</button>
				</b>

				<br> <br>
			</div>
		</fieldset>

     
      </form>
</body>

<script>
function changePasswordvalidateForm() {
  var currentpassword = document.forms["changeform"]["currentpassword"].value;
  var newpassword = document.forms["changeform"]["newpassword"].value;
  var confirmpassword = document.forms["changeform"]["confirmpassword"].value;
  
  if (currentpassword == "") {
    alert("currentpassword must be filled out");
    return false;
  }
  if (newpassword == "") {
	    alert("newpassword must be filled out");
	    return false;
	  }
  if (confirmpassword == "") {
	    alert("confirmpassword must be filled out");
	    return false;
	  }
}
</script>
</html>