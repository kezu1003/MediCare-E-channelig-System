<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Healthcare Provider</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <style>
        .form-container {
            max-width: 800px;
            margin: 0 auto;
        }
        .dashboard-header {
            background-color: #f8f9fa;
            padding: 20px 0;
            margin-bottom: 30px;
            border-bottom: 1px solid #e9ecef;
        }
        .required-field::after {
            content: "*";
            color: red;
            margin-left: 5px;
        }
    </style>
</head>
<body>
    <!-- Header Section -->
    <div class="dashboard-header">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <h1>Add New Healthcare Provider</h1>
                    <p class="text-muted">Create a new provider in the e-channelling system</p>
                </div>
            </div>
        </div>
    </div>

    <div class="container form-container">
        <!-- Alert for success or error messages -->
        <c:if test="${not empty message}">
            <div class="alert alert-${messageType} alert-dismissible fade show" role="alert">
                ${message}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>

        <!-- Add Healthcare Provider Form -->
        <div class="card shadow-sm mb-4">
            <div class="card-header bg-success text-white">
                <h5 class="mb-0">Healthcare Provider Information</h5>
            </div>
            <div class="card-body">
                <form action="Addhealthcare_provider" method="post" id="providerForm">
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="providerId" class="form-label required-field">Provider ID</label>
                            <input type="text" class="form-control" id="providerId" name="providerId" required 
                                   placeholder="e.g., HP004" pattern="[A-Za-z0-9]+" 
                                   title="Provider ID should contain only alphanumeric characters">
                            <div class="form-text">Enter a unique identifier for the provider</div>
                        </div>
                        <div class="col-md-6">
                            <label for="providerName" class="form-label required-field">Provider Name</label>
                            <input type="text" class="form-control" id="providerName" name="providerName" required 
                                   placeholder="e.g., City Medical Center">
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="contactNumber" class="form-label required-field">Contact Number</label>
                            <input type="tel" class="form-control" id="contactNumber" name="contactNumber" required 
                                   placeholder="e.g., +94 112 345 678" pattern="[\d\s\+\-\(\)]{10,15}" 
                                   title="Enter a valid phone number">
                        </div>
                        <div class="col-md-6">
                            <label for="email" class="form-label required-field">Email Address</label>
                            <input type="email" class="form-control" id="email" name="email" required 
                                   placeholder="e.g., contact@provider.com">
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="services" class="form-label required-field">Services</label>
                        <textarea class="form-control" id="services" name="services" rows="3" required 
                                  placeholder="e.g., Health checkups, Specialized consultations, Laboratory tests"></textarea>
                        <div class="form-text">List the healthcare services provided by this provider</div>
                    </div>

                   

                    <div class="row mt-4">
                        <div class="col-md-6 mb-2">
                            <button type="submit" class="btn btn-success w-100">
                                <i class="bi bi-save"></i> Save Provider
                            </button>
                        </div>
                        <div class="col-md-6 mb-2">
                            <a href="healthcareprovider.jsp" class="btn btn-secondary w-100">
                                <i class="bi bi-arrow-left"></i> Back to Dashboard
                            </a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-light py-3 mt-5 border-top">
        <div class="container text-center">
            <p class="mb-0">&copy; 2025 e-Channelling System - Healthcare Providers Dashboard</p>
        </div>
    </footer>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script>
        // Form validation
        document.getElementById('providerForm').addEventListener('submit', function(event) {
            const providerId = document.getElementById('providerId').value.trim();
            const providerName = document.getElementById('providerName').value.trim();
            const contactNumber = document.getElementById('contactNumber').value.trim();
            const email = document.getElementById('email').value.trim();
            const services = document.getElementById('services').value.trim();
            
            let isValid = true;
            
            // Check required fields
            if (!providerId || !providerName || !contactNumber || !email || !services) {
                alert('Please fill in all required fields marked with *');
                isValid = false;
            }
            
            // Email validation
            const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (email && !emailPattern.test(email)) {
                alert('Please enter a valid email address');
                isValid = false;
            }
            
            if (!isValid) {
                event.preventDefault();
            }
        });
    </script>
</body>
</html>