<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Refund Request Form</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('images/refund.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            min-height: 100vh;
        }
        .header {
            background-color: #007bff; 
            color: white;
            padding: 20px 30px; 
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        .header img {
            height: 50px; 
        }
        .nav-buttons a {
            color: white;
            text-decoration: none;
            margin-left: 15px;
            border: 2px solid white;
            padding: 8px 15px;
            border-radius: 8px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }
        .nav-buttons a:hover {
            background-color: #0056b3; 
        }
        .container {
            max-width: 700px; 
            margin: 30px 30px 30px auto; 
            padding: 25px;
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            transition: transform 0.3s ease;
        }
        .container:hover {
            transform: translateY(-5px); 
        }
        .tabs {
            display: flex;
            border-bottom: 3px solid #b3cdf4;
            margin-bottom: 25px;
        }
        .tabs a {
            text-decoration: none;
            padding: 12px 25px;
            color: #003087;
            font-weight: bold;
            font-size: 1.1em;
            transition: color 0.3s ease;
        }
        .tabs a.active {
            border-bottom: 3px solid #007bff;
            color: #007bff;
        }
        .note {
            color: #007bff;
            font-style: italic;
            margin-bottom: 25px;
            font-size: 0.95em;
            line-height: 1.5;
            background-color: rgba(227, 242, 253, 0.7);
            padding: 10px;
            border-radius: 5px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #333;
        }
        .form-group input, .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 2px solid #b3cdf4;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 1em;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }
        .form-group input:focus, .form-group textarea:focus {
            border-color: #007bff;
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.3);
            outline: none;
        }
        button {
            background-color: #007bff;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1em;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        button:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }
        .error {
            color: #d32f2f;
            font-size: 0.9em;
            display: none;
            margin-top: 5px;
        }
        .is-invalid {
            border-color: #d32f2f !important;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="nav-buttons">
            <a href="indexPatient.jsp">Home</a>
        </div>
    </div>

    <div class="container">
        <div class="tabs">
            <a class="active">ADD REFUND</a>
        </div>

        <div class="note">
            "Your refund WILL be arranged to the same payment mode used for making the appointment*"<br>
            Example - Mobile bill/reload refund WILL BE arranged for Add to bill transactions AND bank deposits FOR card payment transactions.
        </div>

        <form action="RefundServlet" method="post" id="refundform">
            <div class="form-group">
                <label for="referenceNo">REFERENCE NO <span style="color: red;">*</span></label>
                <input type="text" id="referenceNo" name="referenceNo" placeholder="Reference No - Required" required>
            </div>

            <div class="form-group">
                <label for="mobileNo">MOBILE NO / CDMA NO</label>
                <input type="text" id="mobileNo" name="mobileNo" placeholder="Mobile No - Required">
                <div class="error" id="mobileNoError">Mobile number must be 10 digits.</div>
            </div>

            <div class="form-group">
                <label for="refundRemarks">REFUND REMARKS</label>
                <textarea id="refundRemarks" name="refundRemarks" placeholder="Refund Remarks - Required" rows="4"></textarea>
            </div>

            <button type="submit">SUBMIT</button>
        </form>
    </div>

  
    <% 
        String message = (String) request.getAttribute("message");
        if (message != null) {
    %>
        <script>alert('<%= message %>');</script>
    <% 
        }
    %>

    <script>
        document.getElementById('refundform').addEventListener('submit', function(event) {
            event.preventDefault();
            const form = this;
            let isValid = true;

            // Mobile number validation
            const mobileNo = form.querySelector('#mobileNo');
            const mobileNoError = form.querySelector('#mobileNoError');
            if (mobileNo.value && !/^\d{10}$/.test(mobileNo.value)) {
                mobileNo.classList.add('is-invalid');
                mobileNoError.style.display = 'block';
                isValid = false;
            } else {
                mobileNo.classList.remove('is-invalid');
                mobileNoError.style.display = 'none';
            }

            // If valid, submit form
            if (isValid) {
                form.submit();
            }
        });

        // Remove error styling on input
        ['mobileNo'].forEach(id => {
            document.getElementById(id).addEventListener('input', function() {
                this.classList.remove('is-invalid');
                document.getElementById(id + 'Error').style.display = 'none';
            });
        });
    </script>
</body>
</html>