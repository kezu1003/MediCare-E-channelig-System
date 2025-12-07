<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About Our E-Channeling Platform</title>
    <style>
        body {
            font-family: sans-serif;
            margin: 0;
            background-color: #f4f4f4;
        }

        .container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 800px;
            margin: 40px auto;
        }

        h1, h2 {
            color: #007bff;
            text-align: center;
        }

        p {
            line-height: 1.6;
            color: #333;
            margin-bottom: 15px;
            text-align: justify;
        }

        ul {
            text-align: left;
            color: #333;
        }

        ul li {
            margin-bottom: 10px;
        }

        a {
            color: #007bff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    
    <jsp:include page="includes/header3.jsp">
        <jsp:param name="pageTitle" value="About Our E-Channeling Platform" />
        <jsp:param name="activePage" value="about" />
    </jsp:include>

    <div class="container">
        
        <p>Welcome to E-Channeling, your trusted online platform designed to simplify the process of booking healthcare appointments. We understand that accessing healthcare should be convenient and efficient, and that's why we've created this system to connect patients with doctors and medical services seamlessly.</p>

        <h2>Our Mission</h2>
        <p>Our mission is to revolutionize the way individuals access healthcare by providing a user-friendly, reliable, and secure online channeling platform. We aim to empower patients to take control of their healthcare journey by making it easy to find the right doctor, at the right time, and at the right place.</p>

        <h2>What We Offer</h2>
        <ul>
            <li><strong>Easy Appointment Booking:</strong> Browse available doctors, view their schedules, and book appointments online in just a few clicks.</li>
            <li><strong>Wide Network of Professionals:</strong> Access a diverse range of doctors and specialists across various medical fields and hospitals/clinics.</li>
            <li><strong>Convenience and Flexibility:</strong> Book appointments from the comfort of your home, at any time that suits you.</li>
            <li><strong>Secure Platform:</strong> We are committed to protecting your personal and health information with robust security measures.</li>
        </ul>

        <h2>Our Team</h2>
        <p>E-Channeling is developed and maintained by a dedicated team of professionals passionate about leveraging technology to improve healthcare accessibility. We are constantly working to enhance our platform with new features and improvements to better serve our users.</p>

        <h2>Contact Us</h2>
        <p>If you have any questions, feedback, or suggestions, please don't hesitate to <a href="contact.jsp">contact us</a>. We value your input and are always looking for ways to improve our services.</p>

        <p style="text-align: center;">Thank you for choosing E-Channeling!</p>
    </div>
    
    <jsp:include page="includes/footer.jsp" />

</body>
</html>