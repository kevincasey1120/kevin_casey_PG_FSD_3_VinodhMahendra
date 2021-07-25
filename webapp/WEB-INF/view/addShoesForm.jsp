<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="Error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Product</title>
</head>

<body
	style="background-image: url('${pageContext.request.contextPath}/images/niceBlueBack.png');  background-repeat: no-repeat;  background-attachment: fixed;  background-size: 100% 100%;">

	<%@include file="addShoesHeader.jsp"%>

	<form name="addShoesForm" class="addflightformstyle"
		action="addnewproduct" onsubmit="return addUserValidationForm()"
		style="text-decoration: none; font-family: sans-serif; font-weight: normal; color: white; font-size: 16px;">

		<br>
		<br>

		<fieldset>
			<legend
				style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: white; font-size: 20px;">NEW PRODUCTS</legend>
			<div>

				<br> Product Category : <input type="radio" id="men"
					name="weartype" value="Mens_Wear"> <label for="men">Mens Wear</label> 
					
					&nbsp;&nbsp;&nbsp;
					
					<input type="radio" id="women" name="weartype" value="Womens_Wear"> <label for="women">Womens Wear</label>
					
					&nbsp;&nbsp;&nbsp;
					
				 	<input type="radio" id="boys" name="weartype" value="Boys_Wear"> <label for="boys">Boys Wear</label> 
					
					&nbsp;&nbsp;&nbsp;
					
				 	<input type="radio" id="girls" name="weartype" value="Girls_Wear"> <label for="girls">Girls Wear</label> 
					
					
				<br>
				<br> Brand Name : <input style="width:200px;" class="textboxstyle" type="text"
					 name="prod_name"> <br>
					
						<br>
				<br> Shoe Description: <input style="width:3000px;" class="textboxstyle" type="text"
					 name="prod_description"> <br>
					

					
				<br>Price (USD) : <input style="width:80px;" class="textboxstyle" type="text"
					 name="prod_price"> <br>

				<br>&nbsp;ImagePath : <input style="width:350px;" class="textboxstyle" type="text" name="prod_img"> <br>
				<br>

			</div>
		</fieldset>
		
		<br><br>
	
		<input type="submit" value="Add New Product">
		
	</form>

</body>

<script type="text/javascript">
	function addUserValidationForm() {
		var weartype = document.forms["addProductform"]["weartype"].value;
		var prod_name = document.forms["addProductform"]["prod_name"].value;
		var prod_decription = document.forms["addProductform"]["prod_decription"].value;
		var prod_price = document.forms["addProductform"]["prod_price"].value;
		var prod_img = document.forms["addProductform"]["prod_img"].value;

		if (weartype == "") {
			alert("weartype must be filled out");
			return false;
		}
		if (prod_name == "") {
			alert("prod_name must be filled out");
			return false;
		}
		if (prod_price == "") {
			alert("prod_price must be filled out");
			return false;
		}
		if (prod_img == "") {
			alert("prod_img must be filled out");
			return false;
		}

	}
</script>

</html>