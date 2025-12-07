<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>${param.pageTitle} - MediCare </title>
            
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
                rel="stylesheet">
           
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

            <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;500;600;700&display=swap"
                rel="stylesheet">
          
            <link rel="stylesheet" href="assets/css/medicare.css">
           
            <c:if test="${not empty param.extraCss}">
                ${param.extraCss}
            </c:if>
            
            <style>
     
        		.content, .sidebar, .openbtn {
            		position: relative;
            		z-index: 1;
        		}
        		
        		

		        .openbtn {
		            font-size: 20px;
		            cursor: pointer;
		            background-color: var(--primary);
		            color: white;
		            padding: 10px 15px;
		            border: none;
		            position: fixed;
		            top: 20px;
		            left: 20px;
		            z-index: 150;
		            border-radius: 50%;
		            width: 50px;
		            height: 50px;
		            display: flex;
		            align-items: center;
		            justify-content: center;
		            box-shadow: var(--shadow);
		            transition: all 0.3s ease;
		        }

		        .openbtn:hover {
		            background-color: #0d47a1;
		            transform: scale(1.05);
		        }
		
		        /* Main Content */
		        .content {
		            flex-grow: 1;
		            display: flex;
		            flex-direction: column;
		            align-items: center;
		            justify-content: flex-start;
		            padding-top: 20px;
		            width: 100%;
		            transition: margin-left 0.3s;
		            margin-bottom: 20px;
		        }
            	
            
            
            </style>
        </head>

        <body>
           
            <header class="medicare-header">
                <div class="container">
                    <div class="d-flex justify-content-between align-items-center">
				            <a href="AdminDashboard.jsp" class="medicare-logo d-flex align-items-center text-decoration-none">
							
                            <div class="d-flex align-items-center">
                                <i class="fas fa-hospital-alt text-primary fs-2 me-2"></i>
                                <span>Back to Dashboard </span>
                                
                            </div>
                            
                        </a>
						
                      

                        <div class="d-flex align-items-center">
                           
                          
                            <button class="navbar-toggler btn btn-sm btn-outline-secondary d-md-none" type="button"
                                data-bs-toggle="collapse" data-bs-target="#mobileMenu" aria-controls="mobileMenu"
                                aria-expanded="false" aria-label="Toggle navigation">
                                <i class="fas fa-bars"></i>
                            </button>
                        </div>
                    </div>
                    
                </div>

                <!-- Mobile Navigation -->
                <div class="collapse navbar-collapse d-md-none" id="mobileMenu">
                    <div class="container py-3">
                        <a href="index.jsp" class="nav-link mb-2 ${param.activePage == 'home' ? 'active' : ''}">Home</a>
                        <a href="manage_doctors.jsp"
                            class="nav-link mb-2 ${param.activePage == 'doctors' ? 'active' : ''}">Doctors</a>
                        <a href="add_appointment.jsp"
                            class="nav-link mb-2 ${param.activePage == 'appointments' ? 'active' : ''}">Appointments</a>
                        <a href="#" class="nav-link mb-2 ${param.activePage == 'patients' ? 'active' : ''}">Patients</a>
                        <a href="#" class="nav-link mb-2 ${param.activePage == 'about' ? 'active' : ''}">About</a>
                      
                    </div>
                </div>
            </header>

            <!-- Page Title Section -->
            <div class="medicare-page-title">
                <div class="container">
                    <h2>${param.pageTitle}</h2>
                    <c:if test="${not empty param.pageDescription}">
                        <p>${param.pageDescription}</p>
                    </c:if>
                </div>
            </div>

            <!-- Main Content Wrapper -->
            <div class="medicare-container">
                <!-- Message/Alert Section -->
                <c:if test="${not empty message}">
                    <div class="medicare-alert medicare-alert-info mb-4">
                        <i class="fas fa-info-circle me-2"></i> ${message}
                        <button type="button" class="btn-close float-end" data-bs-dismiss="alert"
                            aria-label="Close"></button>
                    </div>
                </c:if>
                </div>