<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href = "CSS/bootstrap.min.css">
<link rel="stylesheet" href = "CSS/admin.css">
<jsp:include page="includes/header4.jsp">
            <jsp:param name="pageTitle" value="Patient Management" />
            <jsp:param name="activePage" value="doctors" />
            <jsp:param name="pageDescription" value="View,  update, and remove Patients in the MediCare system" />
        </jsp:include>


<meta charset="UTF-8">

</head>
<body>

<table class="table">
  <thead>
    <tr>
      <th scope="col">Name</th>
      <th scope="col">Age</th>
      <th scope="col">Email</th>
      <th scope="col">Password</th>
    </tr>
  </thead>
  <tbody>
  	<c:forEach var="pat" items="${Patient}">
  		<tr>
  			<td>${pat.name}</td>
  			<td>${pat.age}</td>
  			<td>${pat.email}</td>
  			<td>${pat.password}</td>
  			<td>
  			<form action="SingleDataButton" method = "post">
  			<input type = "hidden" name= "email" value= "${pat.email}">
  			<button type="submit" class="btn btn-info">Data</button>
  			</form>
  			</td>
  			
  			<td>
  			<form action = "DeletePatient" method= "post">
  				<input type = "hidden" name= "email" value = "${pat.email}">
  				<button type="submit" class="btn btn-danger">Delete</button>
  			
  			</form>
  			</td>
  			
  			
  			
  		</tr>
  	</c:forEach>
    
  </tbody>
</table>

</body>
</html>