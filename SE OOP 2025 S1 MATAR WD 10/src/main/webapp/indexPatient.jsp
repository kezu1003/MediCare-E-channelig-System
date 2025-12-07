<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<link href="CSS/bootstrap.min.css" rel="stylesheet" >
<head>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <jsp:include page="includes/header2.jsp"></jsp:include>
</head>
<body>     
        
    <div class="slideshow-container">
            <div class="slide fade">
                <img src="images/slide1.jpg" style="width:100%">
                <div class="slide-caption">
                    <h3>Expert Healthcare Professionals</h3>
                    <p>Access top specialists and doctors with ease</p>
                </div>
            </div>

            <div class="slide fade">
                <img src="images/slide2.jpg" style="width:100%">
                <div class="slide-caption">
                    <h3>Convenient Online Booking</h3>
                    <p>Schedule appointments anytime, anywhere</p>
                </div>
            </div>

            <div class="slide fade">
                <img src="images/slide3.jpg" style="width:100%">
                <div class="slide-caption">
                    <h3>Patient-Centered Care</h3>
                    <p>Your health is our top priority</p>
                </div>
            </div>

            <div class="slide fade">
                <img src="images/slide4.jpg" style="width:100%">
                <div class="slide-caption">
                    <h3>State-of-the-Art Facilities</h3>
                    <p>Access the best healthcare infrastructure</p>
                </div>
            </div>

            <div class="slide fade">
                <img src="images/slide5.jpg" style="width:100%">
                <div class="slide-caption">
                    <h3>Digital Health Records</h3>
                    <p>Securely manage your medical history</p>
                </div>
            </div>

            <div class="slide fade">
                <img src="images/slide6.jpg" style="width:100%">
                <div class="slide-caption">
                    <h3>Virtual Consultations</h3>
                    <p>Get medical advice from the comfort of your home</p>
                </div>
            </div>

            <div class="slide fade">
                <img src="images/slide7.jpg" style="width:100%">
                <div class="slide-caption">
                    <h3>Extensive Healthcare Network</h3>
                    <p>Connected to the best hospitals nationwide</p>
                </div>
            </div>

            <div class="dots-container">
                <span class="dot" onclick="currentSlide(1)"></span>
                <span class="dot" onclick="currentSlide(2)"></span>
                <span class="dot" onclick="currentSlide(3)"></span>
                <span class="dot" onclick="currentSlide(4)"></span>
                <span class="dot" onclick="currentSlide(5)"></span>
                <span class="dot" onclick="currentSlide(6)"></span>
                <span class="dot" onclick="currentSlide(7)"></span>
            </div>
        </div>
        

        
        <div class="medicare-hero mb-5">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-7">
                        <h1 class="display-4 mb-4 text-primary fw-bold">Welcome to MediCare</h1>
                        <p class="lead mb-4">Advanced healthcare management system designed to streamline patient
                            appointments, doctor scheduling, and medical record management.</p>
                        <div class="d-flex flex-wrap gap-3">
                            <a href="add_appointment.jsp" class="medicare-btn medicare-btn-primary btn-lg">
                                <i class="fas fa-calendar-plus me-2"></i> Schedule Appointment
                            </a>
                            <a href="manageappointment" class="medicare-btn medicare-btn-outline-primary btn-lg">
                                <i class="fas fa-calendar-check me-2"></i> View Appointments
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="homepage-container">
            <h1>Your Health Journey Starts Here</h1>
            <p>Find and book medical appointments with specialists quickly and conveniently through our E-Channeling platform.</p>

            <div class="search-filter">
                <div class="form-group">
                    <label for="specialization"><i class="fas fa-stethoscope"></i> Specialization</label>
                    <select id="specialization" name="specialization">
                        <option value="">-- Select Specialization --</option>
                        <option value="Cardiology">Cardiology</option>
                        <option value="Dermatology">Dermatology</option>
                        <option value="General Physician">General Physician</option>
                        <option value="Neurology">Neurology</option>
                        <option value="Orthopedics">Orthopedics</option>
                        <option value="Pediatrics">Pediatrics</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="doctor"><i class="fas fa-user-md"></i> Doctor</label>
                    <input type="text" id="doctor" name="doctor" placeholder="Enter doctor's name">
                </div>

                <div class="form-group">
                    <label for="date"><i class="fas fa-calendar-alt"></i> Preferred Date</label>
                    <input type="date" id="date" name="date">
                </div>

                <div class="form-group">
                    <label for="hospital"><i class="fas fa-hospital"></i> Hospital/Clinic</label>
                    <select id="hospital" name="hospital">
                        <option value="">-- Select Location --</option>
                        <option value="City Hospital">City Hospital</option>
                        <option value="General Clinic">General Clinic</option>
                        <option value="Medical Center">Medical Center</option>
                        <option value="Community Hospital">Community Hospital</option>
                    </select>
                </div>
            </div>
         </div>

            <button type="button"><i class="fas fa-search"></i> Find Appointments</button>

            <div class="features">
                <div class="feature">
                    <div class="feature-icon"><i class="fas fa-calendar-check"></i></div>
                    <h3>Easy Scheduling</h3>
                    <p>Book appointments with just a few clicks, anytime and anywhere.</p>
                </div>
                
                <div class="feature">
                    <div class="feature-icon"><i class="fas fa-user-md"></i></div>
                    <h3>Expert Doctors</h3>
                    <p>Access a network of qualified specialists and healthcare professionals.</p>
                </div>
                
                <div class="feature">
                    <div class="feature-icon"><i class="fas fa-bell"></i></div>
                    <h3>Reminders</h3>
                    <p>Never miss an appointment with our automated reminder system.</p>
                </div>
                
                <div class="feature">
                    <div class="feature-icon"><i class="fas fa-mobile-alt"></i></div>
                    <h3>Mobile Friendly</h3>
                    <p>Manage your health on-the-go with our responsive platform.</p>
                </div><br>
                
                <div class="feature">
    				<div class="feature-icon"><i class="fas fa-file-medical-alt"></i></div>
    				<h3>Medical Reports</h3>
    				<p>Access and manage all your medical reports in one secure location.</p>
				</div>
				
				<div class="feature"> 
  					<div class="feature-icon"><i class="fas fa-edit"></i></div>
  					<h3>Pre Registration</h3>
 					<p>Save time by filling out your information online before your visit.</p>
				</div>
				
				<div class="feature"> 
  					<div class="feature-icon"><i class="fas fa-pills"></i></div>
  					<h3>Medicine</h3>
  					<p>Access and manage your prescriptions easily and securely online.</p>
				</div>
				
				<div class="feature"> 
  					<div class="feature-icon"><i class="fas fa-check-circle"></i></div>
  					<h3>Check</h3>
 					 <p>Quickly verify your appointment status and medical updates anytime.</p>
				</div>
					
            </div>
       
        
       
        <div class="medicare-stats-section py-5 mb-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-6 mb-4 mb-md-0">
                        <div class="medicare-stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-user-md"></i>
                            </div>
                            <div class="stat-number">50+</div>
                            <div class="stat-label">Specialist Doctors</div>
                        </div>
                    </div>
                    <div class="col-md-3 col-6 mb-4 mb-md-0">
                        <div class="medicare-stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-procedures"></i>
                            </div>
                            <div class="stat-number">10,000+</div>
                            <div class="stat-label">Patients Served</div>
                        </div>
                    </div>
                    <div class="col-md-3 col-6">
                        <div class="medicare-stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-stethoscope"></i>
                            </div>
                            <div class="stat-number">15+</div>
                            <div class="stat-label">Specializations</div>
                        </div>
                    </div>
                    <div class="col-md-3 col-6">
                        <div class="medicare-stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-calendar-check"></i>
                            </div>
                            <div class="stat-number">5,000+</div>
                            <div class="stat-label">Monthly Appointments</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

       
        <div class="container mb-5">
            <div class="row">
                <div class="col-12 text-center mb-4">
                    <h2 class="medicare-section-title">How It Works</h2>
                    <p class="lead text-muted">Easy steps to access healthcare services through MediCare</p>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3 mb-4 mb-md-0">
                    <div class="medicare-process-card">
                        <div class="process-step">1</div>
                        <div class="process-icon">
                            <i class="fas fa-user-plus"></i>
                        </div>
                        <h4>Register</h4>
                        <p>Create your account with basic personal information</p>
                    </div>
                </div>
                <div class="col-md-3 mb-4 mb-md-0">
                    <div class="medicare-process-card">
                        <div class="process-step">2</div>
                        <div class="process-icon">
                            <i class="fas fa-search"></i>
                        </div>
                        <h4>Find Doctor</h4>
                        <p>Search and select from our qualified specialist doctors</p>
                    </div>
                </div>
                <div class="col-md-3 mb-4 mb-md-0">
                    <div class="medicare-process-card">
                        <div class="process-step">3</div>
                        <div class="process-icon">
                            <i class="fas fa-calendar-alt"></i>
                        </div>
                        <h4>Book Appointment</h4>
                        <p>Select convenient date and time for consultation</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="medicare-process-card">
                        <div class="process-step">4</div>
                        <div class="process-icon">
                            <i class="fas fa-check-circle"></i>
                        </div>
                        <h4>Get Consultation</h4>
                        <p>Visit the doctor and receive quality healthcare</p>
                    </div>
                </div>
            </div>
        </div>

      
        <div class="medicare-cta-section mb-5">
            <div class="container">
                <div class="medicare-cta-card">
                    <div class="row align-items-center">
                        <div class="col-lg-8 mb-4 mb-lg-0">
                            <h3>Ready to Get Started with MediCare?</h3>
                            <p class="mb-0">Book your first appointment today and experience quality healthcare services
                            </p>
                        </div>
                        <div class="col-lg-4 text-lg-end">
                            <a href="add_appointment.jsp" class="medicare-btn medicare-btn-light btn-lg">
                                <i class="fas fa-calendar-plus me-2"></i> Book Appointment
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        
        <style>
            
            .medicare-hero {
                background-color: #f8f9fa;
                padding: 80px 0;
                border-radius: 10px;
                margin-top: -20px;
            }

            .medicare-hero-image {
                max-height: 400px;
                animation: float 6s ease-in-out infinite;
            }

            @keyframes float {
                0% {
                    transform: translateY(0px);
                }

                50% {
                    transform: translateY(-20px);
                }

                100% {
                    transform: translateY(0px);
                }
            }

           
            .medicare-stats-section {
                background-color: #f1f7fe;
            }

            .medicare-stat-card {
                text-align: center;
                padding: 20px;
                transition: transform 0.3s;
            }

            .medicare-stat-card:hover {
                transform: translateY(-5px);
            }

            .stat-icon {
                font-size: 2.5rem;
                color: var(--bs-primary);
                margin-bottom: 15px;
            }

            .stat-number {
                font-size: 2rem;
                font-weight: bold;
                color: #333;
            }

            .stat-label {
                font-size: 1rem;
                color: #666;
            }

            
            .medicare-process-card {
                background: white;
                border-radius: 10px;
                padding: 25px 15px;
                text-align: center;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
                position: relative;
                overflow: hidden;
                height: 100%;
            }

            .process-step {
                position: absolute;
                top: 10px;
                right: 10px;
                background: var(--bs-primary);
                color: white;
                width: 30px;
                height: 30px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                font-weight: bold;
            }

            .process-icon {
                font-size: 2.5rem;
                color: var(--bs-primary);
                margin: 15px 0;
            }

            .medicare-process-card h4 {
                font-weight: 600;
                margin-bottom: 10px;
            }

          
            .medicare-cta-section {
                padding: 30px 0;
            }

            .medicare-cta-card {
                background: linear-gradient(135deg, var(--bs-primary), var(--bs-info));
                border-radius: 10px;
                padding: 40px;
                color: white;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            }

            .medicare-cta-card h3 {
                font-weight: 600;
                margin-bottom: 10px;
            }
            
            :root {
            --primary: #1a73e8;
            --secondary: #34a853;
            --accent: #ea4335;
            --light: #f8f9fa;
            --dark: #202124;
            --shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            min-height: 100vh;
            background: url('images/background.png') no-repeat center center fixed;
            background-size: cover;
            background-attachment: fixed;
            background-color: #f5f7fa;
            display: flex;
            flex-direction: column;
            color: var(--dark);
            position: relative; 
        }
        
       
       
        .content, .sidebar, .openbtn {
            position: relative;
            z-index: 1;
        }

        

       
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

      
        .slideshow-container {
            max-width: 1200px;
            position: relative;
            margin: auto;
            margin-top: 80px;
            margin-bottom: 30px;
            z-index: 50;
            width: 90%;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: var(--shadow);
        }

        .slide {
            display: none;
            position: relative;
        }

        .slide img {
            width: 100%;
            height: 400px;
            object-fit: cover;
        }

        .slide-caption {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background: rgba(0, 0, 0, 0.6);
            color: white;
            padding: 20px;
            text-align: center;
        }

        .slide-caption h3 {
            margin-bottom: 10px;
            font-size: 24px;
        }

        .slide-caption p {
            font-size: 16px;
        }

       
        .fade {
            animation-name: fade;
            animation-duration: 1.5s;
        }

        @keyframes fade {
            from {opacity: .4}
            to {opacity: 1}
        }

        
        .dots-container {
            text-align: center;
            padding: 10px 0;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 30px;
            display: inline-block;
            position: relative;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            padding: 5px 15px;
        }

        .dot {
            height: 12px;
            width: 12px;
            margin: 0 5px;
            background-color: #bbb;
            border-radius: 50%;
            display: inline-block;
            transition: background-color 0.6s ease;
            cursor: pointer;
        }

        .active, .dot:hover {
            background-color: var(--primary);
        }

        
        .homepage-container {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 90%;
            max-width: 1200px;
            margin-bottom: 40px;
            position: relative;
            overflow: hidden;
            margin-left:150px;
        }

        .homepage-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 8px;
            background: linear-gradient(90deg, var(--primary), var(--secondary), var(--accent));
        }

        .homepage-container h1 {
            color: var(--primary);
            margin-bottom: 20px;
            font-size: 36px;
            font-weight: 700;
            position: relative;
            display: inline-block;
        }

        .homepage-container h1::after {
            content: '';
            position: absolute;
            width: 50%;
            height: 3px;
            background-color: var(--secondary);
            bottom: -10px;
            left: 25%;
        }

        .homepage-container p {
            color: #555;
            margin-bottom: 30px;
            font-size: 18px;
            line-height: 1.6;
        }

        
        .search-filter {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
            width: 100%;
            padding: 30px;
            background-color: #f5f7fa;
            border-radius: 10px;
            box-shadow: inset 0 2px 10px rgba(0, 0, 0, 0.05);
        }

        .form-group {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        .form-group label {
            margin-bottom: 8px;
            color: #555;
            font-weight: 600;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .form-group select,
        .form-group input[type="text"],
        .form-group input[type="date"] {
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            width: 100%;
            box-sizing: border-box;
            font-size: 16px;
            transition: all 0.3s ease;
            background-color: white;
        }

        .form-group select:focus,
        .form-group input[type="text"]:focus,
        .form-group input[type="date"]:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 2px rgba(26, 115, 232, 0.2);
            outline: none;
        }

        .form-group select {
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='%231a73e8' viewBox='0 0 16 16'%3E%3Cpath d='M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: calc(100% - 15px) center;
            padding-right: 35px;
        }

        .homepage-container button {
            padding: 14px 30px;
            background: linear-gradient(45deg, var(--secondary), #2e7d32);
            color: white;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            font-weight: bold;
            font-size: 18px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(46, 125, 50, 0.3);
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto;
            min-width: 200px;
        }

        .homepage-container button i {
            margin-right: 10px;
        }

        .homepage-container button:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(46, 125, 50, 0.4);
        }

        .homepage-container button:active {
            transform: translateY(1px);
        }

        /* Features Section */
        .features {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
            margin-top: 40px;
            width: 100%;
            margin-left:150px;
        }

        .feature {
            background-color: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            text-align: left;
            
        }

        .feature:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
        }

        .feature-icon {
            font-size: 36px;
            color: var(--primary);
            margin-bottom: 20px;
        }

        .feature h3 {
            margin-bottom: 15px;
            color: var(--dark);
        }

        .feature p {
            color: #666;
            font-size: 16px;
        }

  
            .slideshow-container {
                margin-top: 70px;
            }
            
            .slide img {
                height: 250px;
            }
            
            .homepage-container {
                padding: 25px;
            }
            
            .search-filter {
                padding: 20px;
            }
        }
        </style>

        <jsp:include page="includes/footer.jsp" />
        }
        
        <script>
        	function openNav() {
            	document.getElementById("mySidebar").style.width = "250px";
            	document.getElementById("main").style.marginLeft = "250px";
        	}

        	function closeNav() {
            	document.getElementById("mySidebar").style.width = "0";
            	document.getElementById("main").style.marginLeft= "0";
        	}

        	let slideIndex = 0;
        	showSlides();

        	function showSlides() {
            	let i;
            	let slides = document.getElementsByClassName("slide");
            	let dots = document.getElementsByClassName("dot");
            	for (i = 0; i < slides.length; i++) {
                	slides[i].style.display = "none";
            	}
            	slideIndex++;
            		if (slideIndex > slides.length) {slideIndex = 1}
            		for (i = 0; i < dots.length; i++) {
                	dots[i].className = dots[i].className.replace(" active", "");
            	}
            	slides[slideIndex-1].style.display = "block";
            	dots[slideIndex-1].className += " active";
            	setTimeout(showSlides, 4000); // Change image every 4 seconds
        	}

        	function currentSlide(n) {
            	slideIndex = n-1;
            	showSlides();
        	}
    </script>

        
	</body>
</html>