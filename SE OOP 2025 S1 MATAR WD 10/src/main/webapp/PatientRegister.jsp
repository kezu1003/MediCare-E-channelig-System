<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Patient Registration - eChannel</title>
    <link rel="stylesheet" href = "CSS/bootstrap.min.css">
    <link href="CSS/patientRegister.css" rel="stylesheet">
    
    <style>
        .header {
            background-color: #1E2F97; 
            padding: 15px 30px; 
            display: flex; 
            justify-content: space-between; 
            align-items: center; 
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .header .auth-buttons {
            display: flex; 
            gap: 10px; 
        }

        .header .auth-buttons a {
            color: #fff;
            text-decoration: none; 
            font-weight: 500; 
            padding: 8px 15px; 
            border-radius: 5px; 
            transition: background-color 0.3s; 
        }

        .header .auth-buttons a:hover {
            background-color: #0056b3; 
        }
    </style>
       
</head>
<body>

	<div class="header">
        
       
        <div class="auth-buttons">
            
           
            <a href="index.jsp">HOME</a>
        </div>
    </div>

    <div class="container form-container">
        <div class="card shadow-sm">
            <div class="card-body">
                <h2 class="card-title text-center mb-4">Patient Registration</h2>
                <form method="post" action="addPatient" id="registrationForm" novalidate>
                    <div class="mb-3">
                        <label for="name" class="form-label">Name</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="Anura D" required aria-describedby="nameError">
                        <div id="nameError" class="error-feedback">Please enter a valid name (letters and spaces only).</div>
                    </div>

                    <div class="mb-3">
                        <label for="age" class="form-label">Age</label>
                        <input type="number" class="form-control" id="age" name="age" placeholder="22" min="1" max="120" required aria-describedby="ageError">
                        <div id="ageError" class="error-feedback">Please enter a valid age between 1 and 120.</div>
                    </div>

                    <div class="mb-3">
                        <label for="email" class="form-label">Email Address</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="name@example.com" required aria-describedby="emailError">
                        <div id="emailError" class="error-feedback">Please enter a valid email address.</div>
                    </div>

                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Password" required minlength="8" aria-describedby="passwordError">
                        <div id="passwordError" class="error-feedback">Password must be at least 8 characters long.</div>
                    </div>

                    <button type="submit" class="btn btn-primary w-100">Submit <i class="bi bi-arrow-right-circle"></i></button>
                </form>
                <div id="successMessage" class="alert alert-success mt-3 d-none" role="alert">
                    Registration submitted successfully!
                </div>
            </div>
        </div>
    </div>

    <script>
        document.getElementById('registrationForm').addEventListener('submit', function(event) {
            event.preventDefault();
            const form = this;
            let isValid = true;

            // Name validation
            const name = form.querySelector('#name');
            if (!name.value.match(/^[A-Za-z\s]+$/)) {
                name.classList.add('is-invalid');
                isValid = false;
            } else {
                name.classList.remove('is-invalid');
            }

            // Age validation
            const age = form.querySelector('#age');
            if (!age.value || age.value < 1 || age.value > 120) {
                age.classList.add('is-invalid');
                isValid = false;
            } else {
                age.classList.remove('is-invalid');
            }

            // Email validation
            const email = form.querySelector('#email');
            if (!email.value.match(/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/)) {
                email.classList.add('is-invalid');
                isValid = false;
            } else {
                email.classList.remove('is-invalid');
            }

            // Password validation
            const password = form.querySelector('#password');
            if (password.value.length < 8) {
                password.classList.add('is-invalid');
                isValid = false;
            } else {
                password.classList.remove('is-invalid');
            }

            // If valid, show success message and submit form
            if (isValid) {
                const successMessage = document.getElementById('successMessage');
                successMessage.classList.remove('d-none');
                setTimeout(() => {
                    form.submit();
                }, 1000);
            }
        });

      
        ['name', 'age', 'email', 'password'].forEach(id => {
            document.getElementById(id).addEventListener('input', function() {
                this.classList.remove('is-invalid');
            });
        });
    </script>
</body>
</html>