<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>${param.pageTitle} - MediCare Healthcare System</title>
            <!-- Bootstrap CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
                rel="stylesheet">
            <!-- Font Awesome -->
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
            <!-- Google Fonts - Nunito -->
            <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;500;600;700&display=swap"
                rel="stylesheet">
            <!-- Custom MediCare CSS -->
            <link rel="stylesheet" href="assets/css/medicare.css">
            <!-- Any additional page-specific CSS -->
            <c:if test="${not empty param.extraCss}">
                ${param.extraCss}
            </c:if>
            
            <style>
            	/* Ensure all content appears above the background overlay */
        		.content, .sidebar, .openbtn {
            		position: relative;
            		z-index: 1;
        		}

        

        		/* Sidebar Styles */
        		.sidebar {
            		background: linear-gradient(to bottom, var(--primary), #0d47a1);
            		color: white;
           			width: 0;
            		overflow-x: hidden;
            		position: fixed;
           			top: 0;
           			left: 0;
		            height: 100%;
		            z-index: 200;
		            transition: 0.3s;
		            padding-top: 60px;
		            box-shadow: var(--shadow);
		        }
		
		        .sidebar a {
		            padding: 15px 20px;
		            text-decoration: none;
		            font-size: 18px;
		            color: #f1f1f1;
		            display: block;
		            transition: 0.3s;
		            border-left: 4px solid transparent;
        		}

        		.sidebar a:hover {
		            background-color: rgba(255, 255, 255, 0.1);
		            border-left: 4px solid white;
		        }
		
		        .sidebar .closebtn {
		            position: absolute;
		            top: 0;
		            right: 25px;
		            font-size: 36px;
		            margin-left: 50px;
		            color: white;
		            text-decoration: none;
		            cursor: pointer;
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
            <!-- Header -->
            <header class="medicare-header">
                <div class="container">
                    <div class="d-flex justify-content-between align-items-center">
				            <a href="index.jsp" class="medicare-logo d-flex align-items-center text-decoration-none">

                            <div class="d-flex align-items-center">
                                <i class="fas fa-hospital-alt text-primary fs-2 me-2"></i>
                                <span>MediCare</span>
                                
                            </div>
                        </a>

                        <nav class="medicare-nav d-none d-md-flex">
                            <a href="contact.jsp" class="nav-link mb-2 ${param.activePage == 'patients' ? 'active' : ''}">Contact Us</a>
                        <a href="about.jsp" class="nav-link mb-2 ${param.activePage == 'about' ? 'active' : ''}">About</a>
                          <a href="faq.jsp" class="nav-link mb-2 ${param.activePage == 'faq' ? 'active' : ''}">FAQ</a>
                          <a href="terms&conditions.jsp" class="nav-link mb-2 ${param.activePage == 'terms&conditions' ? 'active' : ''}">Terms and Conditions</a>
                        </nav>

                        <div class="d-flex align-items-center">
                        	<button class="btn btn-outline-primary me-2 d-none d-md-block"><a href="PatientLogin.jsp">Sign In</a></button>
                            <button class="btn btn-outline-primary me-2 d-none d-md-block"><a href="PatientRegister.jsp">Sign Up</a></button>
                              <button class="btn btn-outline-primary me-2 d-none d-md-block"><a href="AdminLogin.jsp">Admin</a></button>
                           
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
                        
                        <a href="contact.jsp" class="nav-link mb-2 ${param.activePage == 'patients' ? 'active' : ''}">Contact Us</a>
                        <a href="about.jsp" class="nav-link mb-2 ${param.activePage == 'about' ? 'active' : ''}">About</a>
                        <div class="d-flex flex-column mt-3">
                            <button class="btn btn-outline-primary mb-2">Sign In</button>
                            <button class="btn btn-primary">Admin Dashboard</button>
                        </div>
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