<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Profile - eChanneling</title>
    <link rel="stylesheet" href="CSS/bootstrap.min.css">
    
    <style>
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            background-color: #ffffff;
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
        }
        .logo {
            display: flex;
            align-items: center;
        }
        .logo img {
            width: 40px;
            height: 40px;
            margin-right: 10px;
        }
        .logo span {
            color: #007bff;
            font-size: 24px;
            font-weight: bold;
        }
        .nav-links a {
            margin: 0 15px;
            text-decoration: none;
            color: #28a745;
            font-size: 16px;
        }
        .auth-buttons a {
            margin: 0 10px;
            padding: 8px 20px;
            text-decoration: none;
            color: #ffffff;
            background-color: #007bff;
            border: 1px solid #0056b3;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .auth-buttons a:hover {
            background-color: #0056b3;
        }
        .profile-container {
            max-width: 600px;
            margin: 100px auto;
            padding: 30px;
            background-color: #f0f8ff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .profile-container h1 {
            color: #007bff;
            text-align: center;
            margin-bottom: 30px;
            font-size: 28px;
        }
        .form-floating label {
            color: #0056b3;
        }
        .form-control:disabled {
            background-color: #e6f0fa;
            border-color: #007bff;
            color: #003087;
        }
        .form-control {
            border-color: #007bff;
        }
        .form-control:focus {
            border-color: #0056b3;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }
        input[type="submit"] {
            display: block;
            width: 100%;
            padding: 12px;
            margin-top: 20px;
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="auth-buttons">
            <a href="indexPatient.jsp">HOME</a>
        </div>
    </div>

    <div class="profile-container">
        <h1>My Profile</h1>
        
        <c:set var="pat" value="${Patient}"/>
        <fieldset disabled>
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="floatingInputName" name="name" value="${pat.name}" placeholder="Anura D">
                <label for="floatingInputName">Name</label>
            </div>

            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="floatingInputAge" name="age" value="${pat.age}" placeholder="22">
                <label for="floatingInputAge">Age</label>
            </div>

            <div class="form-floating mb-3">
                <input type="email" class="form-control" id="floatingInputEmail" name="email" value="${pat.email}" placeholder="name@example.com">
                <label for="floatingInputEmail">Email address</label>
            </div>

            <div class="form-floating">
                <input type="password" class="form-control" id="floatingPassword" name="password" value="${pat.password}" placeholder="Password">
                <label for="floatingPassword">Password</label>
            </div>
        </fieldset>

        <form action="Update.jsp" method="post">
            <input type="hidden" name="name" value="${pat.name}">
            <input type="hidden" name="age" value="${pat.age}">
            <input type="hidden" name="email" value="${pat.email}">
            <input type="hidden" name="password" value="${pat.password}">
            <input type="submit" value="Update">
        </form>
    </div>
</body>
</html>