<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false" errorPage="Error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reports</title>
<style>
table, td, th {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>

<style>
    select {
        width: 150px;
        margin: 10px;
    }
    select:focus {
        min-width: 150px;
        width: auto;
    }
        select {
        width: 150px;
        margin: 10px;
    }
    select:focus {
        min-width: 150px;
        width: auto;
    }
</style>

</head>
<body
	style="background-image: url('${pageContext.request.contextPath}/images/bigGreenBack.jpg');  background-repeat: no-repeat;  background-attachment: fixed;  background-size: 100% 100%;">

	<%@include file="viewSalesReportHeader.jsp"%>

	<br>
	<br>
	<br>
	<br>

	<br>
	<fieldset>
		<legend
			style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: white; font-size: 20px;">PURCHASE
			SHEET</legend>
		<div>

			<br>

			<form action="requiredreports" name="searchform">

				<b><label
					style="text-decoration: none; font-family: sans-serif; font-weight: normal; color: #ccffcc; font-size: 16px;"
					for="category">SEARCH FILTERS : </label></b> &nbsp;&nbsp;&nbsp;&nbsp; <b><label
					style="text-decoration: none; font-family: sans-serif; font-weight: normal; color: white; font-size: 16px;"
					for="category">Shoe Category:</label></b> <select name="category" width="180" height="50"
					style="width: 190px; height: 30px; text-decoration: none; font-family: sans-serif; font-weight: bold; color: blue; font-size: 18px;"
					id="category">
					<option value="none">< Choose One ></option>
					<option value="mens">Mens Wear</option>
					<option value="womens">Womens Wear</option>
					<option value="boys">Boys Wear</option>
					<option value="girls">Girls Wear</option>

				</select> <b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
				
				<label style="text-decoration: none; font-family: sans-serif; font-weight: normal; color: white; font-size: 16px;"
					for="category">Purchase Date:</label>
					
					&nbsp;&nbsp;&nbsp;
					
				</b> &nbsp;&nbsp; <b> <input type="date" name="date" width="70" height="35" style="align: center; text-decoration: none; font-family: sans-serif; font-weight: bold; color: blue; font-size: 18px;"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

					<button  itemtype="submit"
						style="min-width: 70px;   min-height: 35px; border: 2px solid #222222; border-radius: 5px; font-size: 32x; font-weight: bold; background: linear-gradient(to bottom, rgba(220, 34, 34, 0.7) 50%, rgba(170, 40, 40, 0.7) 50%); color: rgba(255, 255, 255, 1.0);"
						>   	GET PURCHASE REPORTS    </button>
				</b>

			</form>

			<br>
			<table id='myTable'>
				<tr>
					<th width=140 bordercolor="white" bgcolor="#ccffcc">Purchase-id</th>
					<th width=140 bordercolor="white" bgcolor="#ccffcc">Shoe-id</th>
					<th width=140 bordercolor="white" bgcolor="#ccffcc">Brand Name</th>
					<th width=140 bordercolor="white" bgcolor="#ccffcc">Price</th>
					<th width=140 bordercolor="white" bgcolor="#ccffcc">Quantity</th>
					<th width=140 bordercolor="white" bgcolor="#ccffcc">Price(Total)</th>
					<th width=140 bordercolor="white" bgcolor="#ccffcc">Shoe
						Category</th>
					<th width=140 bordercolor="white" bgcolor="#ccffcc">Date</th>
				</tr>
			

				
				<c:forEach items="${orderedShoeList}" var="row" >

				<c:set var="rowCount" value="${rowCount + 1}" scope="page"/>

					<c:choose>
						<c:when test="${row.category=='1'}">
							<c:set var="categoryName" scope="session" value="MENS"/>
						</c:when>

						<c:when test="${row.category=='2'}">
							<c:set var="categoryName" scope="session" value="WOMENS" />
						</c:when>

						<c:when test="${row.category=='3'}">
							<c:set var="categoryName" scope="session" value="BOYS" />
						</c:when>

						<c:when test="${row.category=='4'}">
							<c:set var="categoryName" scope="session" value="GIRLS" />
						</c:when>

						<c:otherwise>
							<c:set var="categoryName" scope="session" value="UNKNOWN" />
						</c:otherwise>
					</c:choose>


					<tr>
						<td align="center"
							style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: white; font-size: 14px;"
							width=140>${row.orderid}</td>
						<td align="center"
							style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: white; font-size: 14px;"
							width=140>${row.shoeid}</td>
						<td
							style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: white; font-size: 14px;"
							width=140><a>${row.name}</a></td>
						<td align="center"
							style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: #ccffcc; font-size: 14px;"
							width=140>${row.price}</td>
						<td align="center"
							style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: white; font-size: 14px;"
							width=140><a>${row.quantity}</a></td>
						<td
							style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: #ccffcc; font-size: 14px;"
							width=140><a>${row.totalprice}</a></td>
						<td align="center"
							style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: white; font-size: 14px;"
							width=140>${categoryName}</td>
						<td align="center"
							style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: white; font-size: 14px;"
							width=140><a>${row.date}</a></td>
					</tr>
				</c:forEach>
			</table>
			<br> <br>
		</div>
	</fieldset>

	<br>

	<b
		style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: white; font-size: 18px;">Net
		Profit (Sales): </b> &nbsp;&nbsp;
	<b
		style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: #ccffcc; font-size: 18px;">${totalSales}</b>

	&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;


	<b
		style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: white; font-size: 18px;">Total
		Number of Sales: </b> &nbsp;&nbsp;
	<b
	
		style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: yellow; font-size: 18px;">${rowCount}</b>
</body>



<!-- <script type="text/javascript">
	function reportvalidateForm() {
		var date = document.forms["searchform"]["date"].value;
		if (date == "") {
			alert("Date must be select");
			return false;
		}

	}
</script>-->



	<script>
function doSearchFiltering() {
	
  var inputA, filterA, inputB, filterB, table, tr, td, i, txtValueA, txtValueB;
  
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  
  inputA = document.getElementById("category");
  filterA = inputA.value.toUpperCase();
  
  inputB = document.getElementById("date");
  filterB = inputB.value.toUpperCase();
  
  

  for (i = 0; i < tr.length; i++) {
	  
    tdA = tr[i].getElementsByTagName("td")[6];
    tdB = tr[i].getElementsByTagName("td")[7];
    
    if (tdA && tdB) {
    	
      txtValueA = tdA.textContent || tdA.innerText;
      txtValueB = tdB.textContent || tdB.innerText;
      
      if ((txtValueA.toUpperCase().indexOf(filterA) > -1) && (txtValueB.toUpperCase().indexOf(filterB) > -1)) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
      
    }else if (tdA) {
    	
    	 txtValueA = tdA.textContent || tdA.innerText;
       
         if (txtValueA.toUpperCase().indexOf(filterA) > -1) {
           tr[i].style.display = "";
         } else {
           tr[i].style.display = "none";
         }
         
    } else if (tdB) {
    	
	   	 txtValueB = tdB.textContent || tdB.innerText;
	      
	        if (txtValueB.toUpperCase().indexOf(filterB) > -1) {
	          tr[i].style.display = "";
	        } else {
	          tr[i].style.display = "none";
	        }
   }    
  }
}
</script>



</html>