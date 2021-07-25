<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="Error.jsp"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head">
<title>SportyShoes Kiosk</title>
</head>


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
    </style>





<body
	style="background-image: url('${pageContext.request.contextPath}/images/shoesBack.jpg');  background-repeat: no-repeat;  background-attachment: fixed;  background-size: 100% 100%;">


	<b><p>
	<a href="signin" style="text-decoration: none; font-family:sans-serif; color:Blue; font-size: 20px;" >Account Login</a>   |   <a href="signup" style="text-decoration: none; color: blue" class="blink" >Register Here</a>
	</p></b>

	<%@include file="homeHeader.jsp"%>

	<table bgcolor="#aaaabb" border="4" cellpadding="20" cellspacing="20"
		id="header-container">

		<tr>
			<td align="center" valign="top" id="header"><div id="spacer"></div>
				<a href="menshoes"> <img
					src="${pageContext.request.contextPath}/images/mensBigButton.png"
					border="0"
					style="center: left; width: 30%; margin-right: 0.25%; margin-bottom: 0.2em;">

			</a> <a href="womenshoes"> <img
					src="${pageContext.request.contextPath}/images/womensBigButton.png"
					style="center: left; width: 30%; margin-right: 0.25%; margin-bottom: 0.2em;">

			</a></td>
		</tr>

		<tr>
			<td align="center" valign="top" id="header"><div id="spacer"></div>
			<a href="boyshoes"> <img
				src="${pageContext.request.contextPath}/images/boysBigButton.png"
				style="center: left; width: 30%; margin-right: 0.25%; margin-bottom: 0.2em;">

			</a>
			<a href="girlshoes"> <img
				src="${pageContext.request.contextPath}/images/girlsBigButton.png"
				style="center: left; width: 30%; margin-right: 0.25%; margin-bottom: 0.2em;">
			</a>
			</td>
		</tr>
	</table>

	<hr>
</body>
</html>
