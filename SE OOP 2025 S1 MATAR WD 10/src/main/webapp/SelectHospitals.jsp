<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel= "stylesheet" href= "CSS/bootstrap.min.css">
<meta charset="UTF-8">
<title>Request LabTest-MediCare</title>
</head>
<body>
<div class="p-3 mb-2 bg-primary-subtle text-primary-emphasis">
	<a href = "LabHome.jsp">
	<div class="d-grid gap-2 d-md-block">
  		<button class="btn btn-outline-primary mb-3 ms-3 mt-3 mb-3" type="button">Back</button>
	</div>
	</a>
	
	<h4><b><p align="center">LabTests and Reports</p></b></h4>
	
	
	<b><h6><p align="left" class="ms-3 mt-3">Select a Hospital</p></h6></b>
	<div class="form-check">
  		<input class="form-check-input  ms-3" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
  		<label class="form-check-label  ms-1 mb-4" for="exampleRadios1">
    		mobile labs only
  		</label>
	</div>
	
	<div class="card mb-2 shadow-sm" style="border-radius: 10px;">
    <div class="d-flex align-items-center p-2">
        <i class="bi bi-hospital me-3" style="font-size: 1.5rem;"></i>
        <div>
            <p class="text-primary mb-0">Nawaloka Hospital Specialist Centre</p>
            <small class="text-muted">78 Colombo - Batticaloa Hwy, Colombo</small>
        </div>
        <a href="TestSpecifies.jsp" class="btn btn-primary rounded-pill ms-auto">SELECT</a>

    </div>
	</div>
	
	<div class="card mb-2 shadow-sm" style="border-radius: 10px;">
    <div class="d-flex align-items-center p-2">
        <i class="bi bi-hospital me-3" style="font-size: 1.5rem;"></i>
        <div>
            <p class="text-primary mb-0">Durdans Hospital</p>
            <small class="text-muted">3 Alfred Pl, Colombo</small>
        </div>
        <a href="TestSpecifies.jsp" class="btn btn-primary rounded-pill ms-auto">SELECT</a>
    </div>
	</div>
	
	<div class="card mb-2 shadow-sm" style="border-radius: 10px;">
    <div class="d-flex align-items-center p-2">
        <i class="bi bi-hospital me-3" style="font-size: 1.5rem;"></i>
        <div>
            <p class="text-primary mb-0">Lanka Hospitals</p>
            <small class="text-muted">578 Elvitigala Mawatha, Colombo</small>
        </div>
        <a href="TestSpecifies.jsp" class="btn btn-primary rounded-pill ms-auto">SELECT</a>
    </div>
	</div>
	
	<div class="card mb-2 shadow-sm" style="border-radius: 10px;">
    <div class="d-flex align-items-center p-2">
        <i class="bi bi-hospital me-3" style="font-size: 1.5rem;"></i>
        <div>
            <p class="text-primary mb-0">Epilepsy Unit, The National Hospital of Sri Lanka</p>
            <small class="text-muted">EW, Colombo</small>
        </div>
        <a href="TestSpecifies.jsp" class="btn btn-primary rounded-pill ms-auto">SELECT</a>
    </div>
	</div>
	
	<div class="card mb-2 shadow-sm" style="border-radius: 10px;">
    <div class="d-flex align-items-center p-2">
        <i class="bi bi-hospital me-3" style="font-size: 1.5rem;"></i>
        <div>
            <p class="text-primary mb-0">Asiri Central Hospital – Central Hospital Limited</p>
            <small class="text-muted">114 Norris Canal Rd, Colombo</small>
        </div>
        <a href="TestSpecifies.jsp" class="btn btn-primary rounded-pill ms-auto">SELECT</a>
    </div>
	</div>
		
</div>
</body>

</html>