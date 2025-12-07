<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Hospital</title>
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
        }
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
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="nav-buttons">
            <a href="AdminDashboard.jsp">Dashboard</a>
        </div>
    </div>

    <div class="container">
        <h1>Edit Hospital</h1>

        <!-- Error Messages -->
        <c:if test="${not empty errors}">
            <div class="error">
                <c:forEach var="error" items="${errors}">
                    <p>${error}</p>
                </c:forEach>
            </div>
        </c:if>

        <form name="editHospital" action="hospitals" method="post" onsubmit="return validateForm()">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="${hospital.id}">
            <label>Name:</label>
            <input type="text" name="name" value="${hospital.name}" maxlength="100" required
                   pattern="[a-zA-Z0-9 \\-' ]{1,100}"
                   title="Name must be 1-100 characters and contain only letters, numbers, spaces, hyphens, or apostrophes."><br>
            <label>Address:</label>
            <input type="text" name="address" value="${hospital.address}" maxlength="255" required
                   pattern="[a-zA-Z0-9 \\-,.]{1,255}"
                   title="Address must be 1-255 characters and contain only letters, numbers, spaces, commas, periods, or hyphens."><br>
            <label>Phone:</label>
            <input type="text" name="phone" value="${hospital.phone}" maxlength="15" required
                   pattern="[0-9\\- ]{10,15}"
                   title="Phone number must be 10-15 digits, optionally with hyphens or spaces (e.g., 123-456-7890)."><br>
            <button type="submit">Update Hospital</button>
            <a href="hospitals">Back </a>
        </form>
        <div id="errorMessages" class="error"></div>
    </div>
    
    <script>
        function validateForm() {
            let name = document.forms["editHospital"]["name"].value.trim();
            let address = document.forms["editHospital"]["address"].value.trim();
            let phone = document.forms["editHospital"]["phone"].value.trim();
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
                document.getElementById("errorMessages").innerHTML = errors.map(e => `<p>${e}</p>`).join("");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>