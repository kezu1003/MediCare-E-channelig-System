<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="CSS/bootstrap.min.css">
    <meta charset="UTF-8">
    <title>Request LabTest-MediCare</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="p-4">
    <div class="p-3 mb-2 bg-primary-subtle text-primary-emphasis">
        <a href="SelectHospitals.jsp">
            <div class="d-grid gap-2 d-md-block">
                <button class="btn btn-outline-primary mb-3 ms-3 mt-3 mb-3" type="button">Back</button>
            </div>
        </a>
        
        <button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">See Hospital List</button>

        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasRightLabel">Hospital List</h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <div class="alert alert-info" role="alert">
                    <b>See which Hospital you choose<br></b><br>1. Take a look at your chosen hospital<br>2. Put a tick on that (optional)<br>3. <b>"Enter the exact name"</b> in the input field
                </div>
                <ul class="list-group">
                    <li class="list-group-item">
                        <input class="form-check-input me-1" type="checkbox" value="" id="firstCheckboxStretched">
                        <label class="form-check-label stretched-link" for="firstCheckboxStretched">01. Nawaloka Hospital Specialist Centre</label>
                    </li>
                    <li class="list-group-item">
                        <input class="form-check-input me-1" type="checkbox" value="" id="secondCheckboxStretched">
                        <label class="form-check-label stretched-link" for="secondCheckboxStretched">02. Durdans Hospital</label>
                    </li>
                    <li class="list-group-item">
                        <input class="form-check-input me-1" type="checkbox" value="" id="thirdCheckboxStretched">
                        <label class="form-check-label stretched-link" for="thirdCheckboxStretched">03. Lanka Hospitals</label>
                    </li>
                    <li class="list-group-item">
                        <input class="form-check-input me-1" type="checkbox" value="" id="fourthCheckboxStretched">
                        <label class="form-check-label stretched-link" for="fourthCheckboxStretched">04. Epilepsy Unit<br>The National Hospital of Sri Lanka</label>
                    </li>
                    <li class="list-group-item">
                        <input class="form-check-input me-1" type="checkbox" value="" id="fifthCheckboxStretched">
                        <label class="form-check-label stretched-link" for="fifthCheckboxStretched">05. Asiri Central Hospital<br>Central Hospital Limited</label>
                    </li>
                </ul>
            </div>
        </div>

        <h4 class="mb-4"><b><p align="center">LabTests and Reports</p></b></h4>
        
        
        <form method="post" action="LabTest_Servlet" class="needs-validation" novalidate>
            <div class="mb-3">
                <label for="exampleFormControlInput1" class="form-label">Enter Hospital Name :</label>
                <input type="text" class="form-control" id="exampleFormControlInput1" name="hospitalName" placeholder="Hospital Name" required>
                <div class="invalid-feedback">Please enter the hospital name!</div>
            </div>
            <div class="mb-3 mt-3">
                <label for="exampleFormControlInput2" class="form-label">Enter Valid Email :</label>
                <input type="email" class="form-control" id="exampleFormControlInput2" name="email" placeholder="example@email.com" required>
                <div class="invalid-feedback">Please enter a valid email!</div>
            </div>
            <div class="mb-3 mt-3">
                <label for="exampleFormControlInput3" class="form-label">Enter Contact Number :</label>
                <input type="text" class="form-control" id="exampleFormControlInput3" name="contactNo" placeholder="Telephone number with 10 digits" required>
                <div class="invalid-feedback">Please enter a valid number!</div>
            </div>
            <div class="mb-3 mt-3">
                <label for="exampleFormControlInput4" class="form-label">Enter Result Collecting Address :</label>
                <input type="text" class="form-control" id="exampleFormControlInput4" name="address" placeholder="No, Street Name, City" required>
                <div class="invalid-feedback">Please enter an address!</div>
            </div>
            
            
            
            
        </form>
            
            
            
            
            
            
            
            
            
            <div class="mb-3 mt-3">
                <label for="labTest" class="form-label">Select Lab Test:</label>
                <select class="form-select" id="labTest" name="testName" onchange="updatePrice()" required>
                    <option value="" disabled selected>Select a test</option>
                    <option value="Blood Test">Blood Test</option>
                    <option value="Urine Test">Urine Test</option>
                    <option value="X-Ray">X-Ray</option>
                    <option value="MRI Scan">MRI Scan</option>
                </select>
                <div class="invalid-feedback">Please select a Lab Test!</div>
            </div>
            
            <div class="mb-3">
                <label for="testPrice" class="form-label">Price (Rs):</label>
                <input type="text" class="form-control" id="testPrice" name="testPrice" readonly>
            </div>
            <button type="submit" class="btn btn-primary">Submit Details</button>
            
        
        <script>
            const prices = {
                "Blood Test": 1500.00,
                "Urine Test": 800.00,
                "X-Ray": 3000.00,
                "MRI Scan": 12000.00
            };

            function updatePrice() {
                const select = document.getElementById('labTest');
                const test = select.value;
                const price = prices[test] || 0;
                document.getElementById('testPrice').value = price.toFixed(2);
            }

            (function() {
                'use strict';
                var forms = document.querySelectorAll('.needs-validation');
                Array.prototype.slice.call(forms).forEach(function(form) {
                    form.addEventListener('submit', function(event) {
                        if (!form.checkValidity()) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            })();
        </script>
    </div>
</body>
</html>