
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Hospital Management Dashboard</title>
    <link rel="stylesheet" href="CSS/stylesHospital.css">
    
    <style>
    
    body {
            background-image: url('images/admin.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            margin: 0;
            min-height: 100vh;
    
    	 .header {
            background: linear-gradient(to right, #1e90ff, #4169e1);
            color: white;
            padding: 25px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .header img {
            height: 40px;
        }
        .nav-buttons a {
            color: black;
            text-decoration: none;
            margin-left: 10px;
            border: 1px solid white;
            padding: 5px 10px;
            border-radius: 5px;
        }
        .nav-buttons a:hover {
            background-color: #0041c2;
    
    
    </style>
    
    <script>
        function validateForm() {
            let name = document.forms["addHospital"]["name"].value.trim();
            let address = document.forms["addHospital"]["address"].value.trim();
            let phone = document.forms["addHospital"]["phone"].value.trim();
            let errors = [];

            if (!name) {
                errors.push("Hospital name is required.");
            } else if (!/^[a-zA-Z0-9 \-' ]{1,100}$/.test(name)) {
                errors.push("Name must be 1-100 characters and contain only letters, numbers, spaces, hyphens, or apostrophes.");
            }

            if (!address) {
                errors.push("Address is required.");
            } else if (!/^[a-zA-Z0-9 \-,.\ ]{1,255}$/.test(address)) {
                errors.push("Address must be 1-255 characters and contain only letters, numbers, spaces, commas, periods, or hyphens.");
            }

            if (!phone) {
                errors.push("Phone number is required.");
            } else if (!/^[0-9\- ]{10,15}$/.test(phone)) {
                errors.push("Phone number must be 10-15 digits, optionally with hyphens or spaces (e.g., 123-456-7890).");
            }

            if (errors.length > 0) {
                document.getElementById("errorMessages").innerHTML = errors.map(e => <p>${e}</p>).join("");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>

<div class="header">
        
        <div class="nav-buttons">
            <a href="AdminDashboard.jsp">Dashboard</a>
            
        </div>
    </div>

    <div class="container">
        <h1>Hospital Management Dashboard</h1>

        <!-- Error Messages -->
        <c:if test="${not empty errors}">
            <div class="error">
                <c:forEach var="error" items="${errors}">
                    <p>${error}</p>
                </c:forEach>
            </div>
        </c:if>

        <!-- Add Hospital Form -->
        <h2>Add New Hospital</h2>
        <form name="addHospital" action="hospitals" method="post" onsubmit="return validateForm()">
            <input type="hidden" name="action" value="add">
            <label>Name:</label>
            <input type="text" name="name" maxlength="100" required
                   pattern="[a-zA-Z0-9 \\-' ]{1,100}"
                   title="Name must be 1-100 characters and contain only letters, numbers, spaces, hyphens, or apostrophes."><br>
            <label>Address:</label>
            <input type="text" name="address" maxlength="255" required
                   pattern="[a-zA-Z0-9 \\-,.]{1,255}"
                   title="Address must be 1-255 characters and contain only letters, numbers, spaces, commas, periods, or hyphens."><br>
            <label>Phone:</label>
            <input type="text" name="phone" maxlength="15" required
                   pattern="[0-9\\- ]{10,15}"
                   title="Phone number must be 10-15 digits, optionally with hyphens or spaces (e.g., 123-456-7890)."><br>
            <button type="submit">Add Hospital</button>
        </form>
        <div id="errorMessages" class="error"></div>

        <!-- Hospital List -->
        <h2>Hospital List</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Address</th>
                <th>Phone</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="hospital" items="${hospitals}">
                <tr>
                    <td>${hospital.id}</td>
                    <td>${hospital.name}</td>
                    <td>${hospital.address}</td>
                    <td>${hospital.phone}</td>
                    <td>
                        <a href="hospitals?action=edit&id=${hospital.id}">Edit</a>
                        <form action="hospitals" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="id" value="${hospital.id}">
                            <button type="submit" onclick="return confirm('Are you sure?')">Delete</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>