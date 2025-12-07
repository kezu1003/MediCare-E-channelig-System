<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(135deg, #e3f2fd, #bbdefb);
            min-height: 100vh;
            margin: 0;
            display: flex;
            flex-direction: column;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            background: linear-gradient(to right, #1e90ff, #4169e1);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
        }
        
       
        .auth-buttons a {
            padding: 8px 20px;
            text-decoration: none;
            color: black;
            background-color: #1e88e5;
            border-radius: 25px;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        .auth-buttons a:hover {
            background-color: #1565c0;
        }
        .login-container {
            margin: 120px auto 50px;
            max-width: 400px;
            background: #ffffff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .login-container h2 {
            color: #1e88e5;
            margin-bottom: 25px;
            font-weight: 600;
        }
        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }
        .form-group label {
            color: #1565c0;
            font-size: 14px;
            font-weight: 500;
            margin-bottom: 5px;
            display: block;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #90caf9;
            border-radius: 8px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }
        .form-group input:focus {
            outline: none;
            border-color: #1e88e5;
            box-shadow: 0 0 5px rgba(30, 136, 229, 0.3);
        }
        .btn-login {
            width: 100%;
            padding: 12px;
            background-color: #1e88e5;
            border: none;
            border-radius: 8px;
            color: #ffffff;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .btn-login:hover {
            background-color: #1565c0;
        }
        .error {
            color: #d32f2f;
            font-size: 14px;
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <div class="header">
        
            <p align="center">Admin Portal</p>
        </div>
        <div class="auth-buttons">
            <a href="index.jsp">Home</a>
        </div>
    

    <div class="login-container">
        <h2>Admin Login</h2>
        <form action="AdminLoginServlet" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit" class="btn-login">Login</button>
        </form>
        <% if (request.getAttribute("errorMessage") != null) { %>
            <p class="error"><%= request.getAttribute("errorMessage") %></p>
        <% } %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>