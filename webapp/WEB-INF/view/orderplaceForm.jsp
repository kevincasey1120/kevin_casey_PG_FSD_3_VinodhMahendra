<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="Error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>OrderPlace</title>
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
      

	container {
		display: block;
		margin: 0 auto;
		text-align: center;
		display: flex;
}

button {
    position: relative;
    top: 50%;
    transform: translateY(-50%);
    margin: auto;
}
</style>


<body >


	<h2 align="center"
		style="text-decoration: none; font-family: sans-serif; color: green; font-weight: bold; font-size: 30px;">--------------------
		PAYMENT RECIEVED ------------------</h2>

	<br>
	<br>
	<h2 align="center"
		style="text-decoration: none; font-family: sans-serif; color: black; font-weight: bold; font-size: 30px;">THANK
		YOU for Your Order, Please Come Again</h2>

	<br>
	<br>
	<br>

	<br>


	<form href="home">

		<h2 align="center" class="container">
			<button class="blink" itemtype="submit" onclick="home" formaction="home"
				style="align: center; min-width: 290px; min-height: 65px; border: 5px solid #226622; border-radius: 5px; font-size: 66x; font-weight: bold; background: linear-gradient(to bottom, rgba(40, 255, 49, 0.7) 50%, rgba(40, 170, 40, 0.7) 50%); color: rgba(0, 50, 0, 1.0);">
				RETURN TO HOMEPAGE</button>
		</h2>
	</form>

</body>
</html>