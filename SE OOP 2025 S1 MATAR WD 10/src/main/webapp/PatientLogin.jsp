<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href = "CSS/patientLogin.css">
<link href="CSS/bootstrap.min.css" rel="stylesheet" >
<meta charset="UTF-8">
<title>Patient Login</title>

	<style>
        .header {
           display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 25px 20px;
            background: linear-gradient(to right, #1e90ff, #4169e1);
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
            color: #d5dbe8;
            font-size: 16px;
        }
        .auth-buttons a {
            margin: 0 10px;
            padding: 5px 15px;
            text-decoration: none;
            color: #d5dbe8;
            border: 1px solid #007bff;
            border-radius: 5px;
        }
    </style>

</head>
<body>

	<div class="header">
        
       
        <div class="auth-buttons">
            
           
            <a href="index.jsp">HOME</a>
        </div>
    </div>

<form action= "PatientLogin" method= "post">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" name = "email" aria-describedby="emailHelp">
    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" name = "password">
  </div>
  <button type="submit" class="btn btn-primary">Login</button>
</form>

</body>
</html>