<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="CSS/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="CSS/admin.css">
<meta charset="UTF-8">
<title>Admin Dashboard</title>
</head>
<body>

	
   
   
    
    <!-- Toggle Button -->
    <button class="toggle-btn" id="toggleBtn">
        <i class="fas fa-bars"></i>
    </button>

    <!-- Sidebar -->
    <div class="sidebar" id="sidebar">
        <div class="sidebar-header">
            <h2 class="h4 mb-0">Medicare Admin</h2>
        </div>
        <ul class="nav ">
            <li class="nav-item">
                <a class="nav-link btn btn-outline-light" href="healthcareprovider.jsp"><i class="fas fa-hospital"></i> Healthcare Providers</a>
            </li>
            <li class="nav-item">
                <a class="nav-link btn btn-outline-light" href="manage_doctors.jsp"><i class="fas fa-user-md"></i> Doctor Management</a>
            </li>
            <li class="nav-item">
                <a class="nav-link btn btn-outline-light" href="dashboard.jsp"><i class="fas fa-stethoscope"></i> Hospital Management</a>
            </li>
            <br><br><br> <br>
            <li class="nav-item logout-btn">
                <a class="nav-link btn btn-danger" href="index.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content" id="mainContent">
        <!-- Dashboard Header -->
        <div class="dashboard-header">
            <h1 class="h3 mb-0">Welcome to Medicare Admin Dashboard</h1>
        </div>

        <!-- Stats Section -->
        <section class="stats-section text-center">
            <div class="row">
                <div class="col-lg-3 col-md-6 mb-4 position-relative">
                    <i class="fas fa-cubes fa-3x text-primary mb-4"></i>
                    <h5 class="text-primary fw-bold mb-3">850+</h5>
                    <h6 class="fw-normal mb-0">Site Views</h6>
                </div>
                <div class="col-lg-3 col-md-6 mb-4 position-relative">
                    <i class="fas fa-layer-group fa-3x text-primary mb-4"></i>
                    <h5 class="text-primary fw-bold mb-3">200+</h5>
                    <h6 class="fw-normal mb-0">Lab Tests</h6>
                </div>
                <div class="col-lg-3 col-md-6 mb-4 position-relative">
                    <i class="fas fa-image fa-3x text-primary mb-4"></i>
                    <h5 class="text-primary fw-bold mb-3">10+</h5>
                    <h6 class="fw-normal mb-0">Healthcare Partners</h6>
                </div>
                <div class="col-lg-3 col-md-6 mb-4 position-relative">
                    <i class="fas fa-plug fa-3x text-primary mb-4"></i>
                    <h5 class="text-primary fw-bold mb-3">300+</h5>
                    <h6 class="fw-normal mb-0">Registered Users</h6>
                </div>
            </div>
        </section>

        <!-- Cards Section -->
        <div class="row mt-4">
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="card">
                    <div class="card-header">
                        <h5>Manage Patients</h5>
                    </div>
                    <div class="card-body">
                        <form action="AdminPatient" method="post">
                            <div class="d-grid gap-2">
                                <button class="btn btn-primary" type="submit">VIEW</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="card">
                    <div class="card-header">
                        <h5>Manage Refunds</h5>
                    </div>
                    <div class="card-body">
                        <form action ="adminrefund.jsp" method="post">
                            <div class="d-grid gap-2">
                                <button class="btn btn-primary" type="submit">VIEW</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-12 mb-4">
                <div class="card">
                    <div class="card-header">
                        <h5>Linked Healthcare Providers</h5>
                    </div>
                    <div class="card-body">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Nawaloka Hospital</td>
                                </tr>
                                <tr>
                                    <td>Durdains Laboratory</td>
                                </tr>
                                <tr>
                                    <td>Asiri Hospital</td>
                                </tr>
                                <tr>
                                    <td>Lanka Hospital</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

  

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const toggleBtn = document.getElementById('toggleBtn');
            const sidebar = document.getElementById('sidebar');
            const mainContent = document.getElementById('mainContent');

            toggleBtn.addEventListener('click', () => {
                sidebar.classList.toggle('active');
                mainContent.classList.toggle('active');
                toggleBtn.classList.toggle('active');
                toggleBtn.innerHTML = sidebar.classList.contains('active') 
                    ? '<i class="fas fa-times"></i>' 
                    : '<i class="fas fa-bars"></i>';
            });
        });
    </script>
    
    <footer class="bg-body-tertiary text-center text-lg-start">
  
  <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.05);">
    © 2025 Copyright:
    <a class="text-body">Medicare.com</a>
  </div>
  
</footer>
    
    
</body>
</html>