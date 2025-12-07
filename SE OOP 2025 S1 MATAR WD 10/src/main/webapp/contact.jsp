<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us - E-Channeling</title>
    <style>
        body {
            font-family: sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 600px;
            text-align: center;
        }

        h1 {
            color: #007bff;
            margin-bottom: 20px;
        }

        p {
            line-height: 1.6;
            color: #333;
            margin-bottom: 15px;
            text-align: left;
        }

        .contact-info {
            margin-top: 20px;
            text-align: left;
        }

        .contact-info h2 {
            color: #007bff;
            margin-bottom: 10px;
        }

        .contact-info p {
            margin-bottom: 8px;
        }

        .header-tabs {
            width: 100%;
            background-color: #f0f0f0;
            padding: 10px 0;
            text-align: center;
            margin-bottom: 20px;
        }

        .header-tabs a {
            padding: 10px 15px;
            text-decoration: none;
            color: #333;
            margin: 0 10px;
            border-radius: 4px;
        }

        .header-tabs a:hover {
            background-color: #e0e0e0;
        }
    </style>
</head>
<body>
    <div class="header-tabs">
        <a href="index.jsp">Home</a>
        
        <a href="pdoctorView.jsp">Doctors</a>
        
    </div>
    
    

    <div class="container">
        <h1>Contact Us</h1>
        <p>We'd love to hear from you! If you have any questions, feedback, or need assistance, please feel free to reach out using the information below.</p>

        <div class="contact-info">
            <h2>General Inquiries</h2>
            <p><strong>Email:</strong> info@echanneling.com</p>
            <p><strong>Phone:</strong> +94 11 XXXXXXX</p>
            <p><strong>Address:</strong>
                E-Channeling Support Center,<br>
                [Your University/Organization Address],<br>
                Colombo, Sri Lanka.
            </p>

            <h2>Technical Support</h2>
            <p>For technical issues or platform-related queries:</p>
            <p><strong>Email:</strong> support@echanneling.com</p>

            <h2>Feedback</h2>
            <p>We value your feedback! Please send your suggestions and comments to:</p>
            <p><strong>Email:</strong> feedback@echanneling.com</p>
        </div>

        <p>We will do our best to respond to your inquiries as soon as possible.</p>
        <p>Thank you for using E-Channeling!</p>
    </div>
</body>
</html>