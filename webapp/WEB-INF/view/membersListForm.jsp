<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false" errorPage="Error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customers Information</title>
<style>
table, td, th {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
</head>
<body
	style="background-image: url('${pageContext.request.contextPath}/images/bluBlackBack.jpg');  background-repeat: no-repeat;  background-attachment: fixed;  background-size: 100% 100%;">

	<%@include file="viewMembersHeader.jsp"%>

	<br>
	<br>
	<br>

	<form action="requiredmembers" name="searchUserform"
		onsubmit="return userSearchForm()">

		<b><label
			style="text-decoration: none; font-family: sans-serif; font-weight: normal; color: #ccffcc; font-size: 16px;"
			for="category">SEARCH FILTERS : </label></b> &nbsp;&nbsp;&nbsp;&nbsp; <b><label
			style="text-decoration: none; font-family: sans-serif; font-weight: normal; color: white; font-size: 16px;"
			for="category">FirstName:</label></b> <input id='myFirstNameInput'
			onkeyup='doSearchFiltering()' type="text" name="firstname"> </select> <b>

			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label
			style="text-decoration: none; font-family: sans-serif; font-weight: normal; color: white; font-size: 16px;"
			for="category">LastName:</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</b> &nbsp;&nbsp; <b> <input id='myLastNameInput' type="text"
			onkeyup='doSearchFiltering()' name="lastname">
		</b>
	</form>


	<br>
	<table id='myTable'>

		<tr class="header">
			<th width=140 bordercolor="white" bgcolor="#ffffcc">Firstname</th>
			<th width=140 bordercolor="white" bgcolor="#ffffcc">Lastname</th>
			<th width=140 bordercolor="white" bgcolor="#ffffcc">Password</th>
			<th width=140 bordercolor="white" bgcolor="#ffffcc">CategoryId</th>
			<th width=140 bordercolor="white" bgcolor="#ffffcc">Phone</th>
			<th width=140 bordercolor="white" bgcolor="#ffffcc">Email</th>

		</tr>

		<c:forEach items="${usersList}" var="usee">

			<c:choose>
				<c:when test="${usee.rollid=='1'}">
					<c:set var="memberTypeName" scope="session" value="ADMIN" />
				</c:when>

				<c:when test="${usee.rollid=='2'}">
					<c:set var="memberTypeName" scope="session" value="MEMBER" />
				</c:when>

				<c:otherwise>
					<c:set var="memberTypeName" scope="session" value="UNKNOWN" />
				</c:otherwise>

			</c:choose>
	
			<tr>
				<td align="center"
					style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: white; font-size: 14px;">${usee.firstname}</td>
				<td align="center"
					style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: white; font-size: 14px;">${usee.lastname}</td>
				<td align="center"
					style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: white; font-size: 14px;">${usee.password}</td>
				<td align="center"
					style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: white; font-size: 14px;">${memberTypeName}</td>
				<td align="left"
					style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: white; font-size: 14px;">${usee.phone}</td>
				<td align="left"
					style="text-decoration: none; font-weight: bold; font-family: sans-serif; color: white; font-size: 14px;">${usee.email}</td>
			</tr>
		</c:forEach>

	</table>


	<script>
function doSearchFiltering() {
	
  var inputA, filterA, inputB, filterB, table, tr, td, i, txtValueA, txtValueB;
  
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  
  inputA = document.getElementById("myFirstNameInput");
  filterA = inputA.value.toUpperCase();
  
  inputB = document.getElementById("myLastNameInput");
  filterB = inputB.value.toUpperCase();
  
  

  for (i = 0; i < tr.length; i++) {
	  
    tdA = tr[i].getElementsByTagName("td")[0];
    tdB = tr[i].getElementsByTagName("td")[1];
    
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

</body>

</html>