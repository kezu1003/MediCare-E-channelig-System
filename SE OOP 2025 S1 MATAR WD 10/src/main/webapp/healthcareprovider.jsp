<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Healthcare Providers Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <style>
        .hidden {
            display: none;
        }
        .provider-card {
            margin-bottom: 15px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .dashboard-header {
            background-color: #f8f9fa;
            padding: 20px 0;
            margin-bottom: 30px;
            border-bottom: 1px solid #e9ecef;
        }
        
         .header {
             background: linear-gradient(to right, #1e90ff, #4169e1);
            color: white;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .header img {
            height: 40px;
        }
        .nav-buttons a {
            color: white;
            text-decoration: none;
            margin-left: 10px;
            border: 1px solid white;
            padding: 5px 10px;
            border-radius: 5px;
        }
        .nav-buttons a:hover {
            background-color: #0041c2;
        
        
        
    </style>
</head>
<body>
    <!-- Header Section -->
     <div class="header">
        
        <div class="nav-buttons">
            <a href="AdminDashboard.jsp">Back</a>
            
        </div>
    </div>
    
    
    <div class="dashboard-header">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <h1>Healthcare Providers</h1>
                    <p class="text-muted">Manage all healthcare providers in the e-channelling system</p>
                </div>
               
            </div>
        </div>
    </div>

    <div class="container">
        <!-- CRUD Operation Buttons -->
        <div class="row mb-4">
            <div class="col-md-4">
                <a href="addhealthcareprovider.jsp" class="btn btn-success w-100">
                    <i class="bi bi-plus-circle"></i> Create Healthcare Provider
                </a>
            </div>
            <div class="col-md-4">
                <button id="updateToggle" class="btn btn-success w-100">
                    <i class="bi bi-pencil"></i> Update Healthcare Provider
                </button>
            </div>
            <div class="col-md-4">
                <button id="deleteToggle" class="btn btn-success w-100">
                    <i class="bi bi-trash"></i> Delete Healthcare Provider
                </button>
            </div>
        </div>

        <!-- Update Form (Initially Hidden) -->
        <div id="updateForm" class="row mb-4 hidden">
            <div class="col-12">
                <div class="card">
                    <div class="card-header bg-warning text-white">
                        <h5 class="mb-0">Update Healthcare Provider</h5>
                    </div>
                    <div class="card-body">
                        <form action="Edithealthcare_provider" method="post">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="providerId" class="form-label">Provider ID</label>
                                    <input type="text" class="form-control" id="providerId" name="providerId" required>
                                    <div class="form-text">Enter the ID of the provider you want to update</div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="providerName" class="form-label">Provider Name</label>
                                    <input type="text" class="form-control" id="providerName" name="providerName">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="contactNumber" class="form-label">Contact Number</label>
                                    <input type="tel" class="form-control" id="contactNumber" name="contactNumber">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="email" class="form-label">Email Address</label>
                                    <input type="email" class="form-control" id="email" name="email">
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="Service" class="form-label">Service</label>
                                <textarea class="form-control" id="address" name="Service" rows="2"></textarea>
                            </div>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-warning">Update Provider</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Delete Form (Initially Hidden) -->
        <div id="deleteForm" class="row mb-4 hidden">
            <div class="col-12">
                <div class="card">
                    <div class="card-header bg-danger text-white">
                        <h5 class="mb-0">Delete Healthcare Provider</h5>
                    </div>
                    <div class="card-body">
                        <form action="Deletehealthcare_provider" method="post" onsubmit="return confirm('Are you sure you want to delete this provider? This action cannot be undone.');">
                            <div class="mb-3">
                                <label for="deleteProviderId" class="form-label">Provider ID</label>
                                <input type="text" class="form-control" id="deleteProviderId" name="providerId" required>
                                <div class="form-text">Enter the ID of the provider you want to delete</div>
                            </div>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-danger">Delete Provider</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Read Operation: Display All Healthcare Providers -->
        <div class="row mb-4">
            <div class="col-12">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h5 class="mb-0">All Healthcare Providers</h5>
                    </div>
                    <div class="card-body">
                        <!-- Search and Filter Options -->
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Search providers...">
                                    <button class="btn btn-outline-secondary" type="button">Search</button>
                                </div>
                            </div>
                            
                        </div>

                        <!-- Providers Table -->
                        <div class="table-responsive">
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Provider Name</th>
                                        <th>Contact</th>
                                        <th>Email</th>
                                        <th>Services</th>
                                       
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${healthcareProviders}" var="provider">
                                        <tr>
                                            <td>${provider.providerId}</td>
                                            <td>${provider.providerName}</td>
                                            <td>${provider.contactNumber}</td>
                                            <td>${provider.email}</td>
                                            <td>
                                                <span class="badge ${provider.active ? 'bg-success' : 'bg-secondary'}">
                                                    ${provider.active ? 'Active' : 'Inactive'}
                                                </span>
                                            </td>
                                            <td>
                                                <a href="viewServices.jsp?providerId=${provider.id}" class="btn btn-sm btn-info">Services</a>
                                                <a href="editProvider.jsp?id=${provider.id}" class="btn btn-sm btn-warning">Edit</a>
                                                <a href="deleteProvider?id=${provider.id}" class="btn btn-sm btn-danger" 
                                                   onclick="return confirm('Are you sure you want to delete this provider?')">Delete</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    
                                    <!-- Static example data - remove in production -->
                                    <tr>
                                        <td>HP001</td>
                                        <td>ABC Healthcare</td>
                                        <td>+94 112 345 678</td>
                                        <td>contact@abchealthcare.com</td>
                                        <td>Health checkups</td>
                                    </tr>
                                    <tr>
                                        <td>HP002</td>
                                        <td>MediCare Insurance</td>
                                        <td>+94 112 987 654</td>
                                        <td>info@medicare.lk</td>
                                        <td>Treatment of common illnesses</td>
                                       
                                    </tr>
                                    <tr>
                                        <td>HP003</td>
                                        <td>HealthGuard</td>
                                        <td>+94 114 567 890</td>
                                        <td>support@healthguard.com</td>
                                        <td>Provided by Hospital Emergency Department</td>
                                        
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        
                        <!-- Pagination -->
                        <nav aria-label="Page navigation">
                            <ul class="pagination justify-content-center">
                                <li class="page-item disabled">
                                    <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                                </li>
                                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item">
                                    <a class="page-link" href="#">Next</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
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
        // Toggle visibility of update form
        document.getElementById('updateToggle').addEventListener('click', function() {
            const updateForm = document.getElementById('updateForm');
            const deleteForm = document.getElementById('deleteForm');
            
            updateForm.classList.toggle('hidden');
            
            // Hide delete form if it's visible
            if (!deleteForm.classList.contains('hidden')) {
                deleteForm.classList.add('hidden');
            }
        });
        
        // Toggle visibility of delete form
        document.getElementById('deleteToggle').addEventListener('click', function() {
            const deleteForm = document.getElementById('deleteForm');
            const updateForm = document.getElementById('updateForm');
            
            deleteForm.classList.toggle('hidden');
            
            // Hide update form if it's visible
            if (!updateForm.classList.contains('hidden')) {
                updateForm.classList.add('hidden');
            }
        });
    </script>
</body>
</html>