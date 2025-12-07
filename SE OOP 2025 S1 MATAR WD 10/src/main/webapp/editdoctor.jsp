<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

 <html>
 <head>       
        <jsp:include page="includes/header4.jsp">
            <jsp:param name="pageTitle" value="Doctor Management" />
            <jsp:param name="activePage" value="doctors" />
            <jsp:param name="pageDescription" value="View, add, update, and remove doctors in the MediCare system" />
        </jsp:include>
        
        <style>
            .doctor-avatar {
                width: 120px;
                height: 120px;
                margin: 0 auto;
                background-color: #1a73e8;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                color: white;
                font-size: 48px;
                font-weight: bold;
            }

            .doctor-initials {
                text-transform: uppercase;
            }

            .detail-item {
                text-align: left;
            }
        </style>
</head>

<body>
        <!-- Main Content -->
        <div class="row mb-4">
            <div class="col-md-12">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <a href="managedoctor" class="btn btn-outline-secondary me-2">
                            <i class="fas fa-arrow-left"></i> Back to Doctors
                        </a>
                    </div>
                </div>
            </div>
        </div>
        
        

        <!-- Edit Doctor Form Card -->
        <div class="medicare-card">
            <div class="medicare-card-header">
                <div class="d-flex justify-content-between align-items-center">
                    <h4 class="mb-0"><i class="fas fa-user-edit me-2"></i>Update Doctor Information</h4>
                    <span class="badge bg-primary">ID: ${doctor.doctor_id}</span>
                </div>
            </div>
            <div class="medicare-card-body">
                <div class="row">
                    <div class="col-md-3">
                        <div class="text-center mb-4">
                            <div class="doctor-avatar mb-3">
                                <div class="doctor-initials">
                                    ${doctor.doctor_name.substring(0,1).toUpperCase()}
                                </div>
                            </div>
                            <h5 class="mb-1">${doctor.doctor_name}</h5>
                            <p class="badge bg-info">${doctor.doctor_special}</p>

                            <div class="doctor-details mt-4">
                                <div class="detail-item mb-3">
                                    <i class="fas fa-phone text-primary me-2"></i>
                                    <small>${doctor.d_contact_number}</small>
                                </div>
                                <div class="detail-item mb-3">
                                    <i class="fas fa-envelope text-primary me-2"></i>
                                    <small>${doctor.d_email_address}</small>
                                </div>
                                <div class="detail-item">
                                    <i class="fas fa-calendar-alt text-primary me-2"></i>
                                    <small>${doctor.action}</small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <form action="updateDoctor" method="post" class="medicare-form needs-validation" novalidate>
                            <input type="hidden" name="id" value="${doctor.doctor_id}">

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="doctorId" class="form-label">
                                        <i class="fas fa-id-card me-1"></i> Doctor ID
                                    </label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-hashtag"></i></span>
                                        <input type="number" class="form-control" id="doctorId"
                                            value="${doctor.doctor_id}" disabled>
                                    </div>
                                    <div class="form-text text-muted">Doctor ID cannot be changed.</div>
                                </div>

                                <div class="col-md-6 mb-3">
                                    <label for="doctorName" class="form-label">
                                        <i class="fas fa-user me-1"></i> Doctor Name <span class="text-danger">*</span>
                                    </label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-user-md"></i></span>
                                        <input type="text" class="form-control" id="doctorName" name="doctorName"
                                            value="${doctor.doctor_name}" required>
                                    </div>
                                    <div class="invalid-feedback">Please provide the doctor's name.</div>
                                </div>
                            </div>



                            <div class="mb-3">
                                <label for="specialization" class="form-label">
                                    <i class="fas fa-stethoscope me-1"></i> Specialization <span
                                        class="text-danger">*</span>
                                </label>
                                <select class="form-select" id="specialization" name="specialization" required>
                                    <option value="" disabled>Select a specialization</option>
                                    <option value="Cardiology" ${doctor.doctor_special=='Cardiology' ? 'selected' : ''
                                        }>Cardiology</option>
                                    <option value="Dermatology" ${doctor.doctor_special=='Dermatology' ? 'selected' : ''
                                        }>Dermatology</option>
                                    <option value="Neurology" ${doctor.doctor_special=='Neurology' ? 'selected' : '' }>
                                        Neurology</option>
                                    <option value="Orthopedics" ${doctor.doctor_special=='Orthopedics' ? 'selected' : ''
                                        }>Orthopedics</option>
                                    <option value="Pediatrics" ${doctor.doctor_special=='Pediatrics' ? 'selected' : ''
                                        }>Pediatrics</option>
                                    <option value="Psychiatry" ${doctor.doctor_special=='Psychiatry' ? 'selected' : ''
                                        }>Psychiatry</option>
                                    <option value="Oncology" ${doctor.doctor_special=='Oncology' ? 'selected' : '' }>
                                        Oncology</option>
                                    <option value="Ophthalmology" ${doctor.doctor_special=='Ophthalmology' ? 'selected'
                                        : '' }>Ophthalmology</option>
                                    <option value="Gynecology" ${doctor.doctor_special=='Gynecology' ? 'selected' : ''
                                        }>Gynecology</option>
                                    <option value="General Medicine" ${doctor.doctor_special=='General Medicine'
                                        ? 'selected' : '' }>General Medicine</option>
                                    
                                </select>
                                <div class="invalid-feedback">Please select the doctor's specialization.</div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="contactNumber" class="form-label">
                                        <i class="fas fa-phone me-1"></i> Contact Number <span
                                            class="text-danger">*</span>
                                    </label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                        <input type="tel" class="form-control" id="contactNumber" name="contactNumber"
                                            value="${doctor.d_contact_number}" required>
                                    </div>
                                    <div class="invalid-feedback">Please provide a valid contact number.</div>
                                </div>

                                <div class="col-md-6 mb-3">
                                    <label for="emailAddress" class="form-label">
                                        <i class="fas fa-envelope me-1"></i> Email Address <span
                                            class="text-danger">*</span>
                                    </label>
                                    <div class="input-group">
                                        <span class="input-group-text">@</span>
                                        <input type="email" class="form-control" id="emailAddress" name="emailAddress"
                                            value="${doctor.d_email_address}" required>
                                    </div>
                                    <div class="invalid-feedback">Please provide a valid email address.</div>
                                </div>
                            </div>

                            <div class="mb-4">
                                <label for="availabilitySchedule" class="form-label">
                                    <i class="fas fa-calendar-alt me-1"></i> Availability Schedule <span
                                        class="text-danger">*</span>
                                </label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-clock"></i></span>
                                    <textarea class="form-control" id="availabilitySchedule" name="availabilitySchedule"
                                        rows="3" required>${doctor.action}</textarea>
                                </div>
                                <div class="invalid-feedback">Please provide the doctor's availability schedule.</div>
                                <div class="form-text text-muted">
                                    <i class="fas fa-info-circle me-1"></i> Specify the days and hours when the doctor
                                    is available for appointments.
                                </div>
                            </div>

                            <hr class="my-4">

                            <div class="d-flex justify-content-between">
                                <a href="managedoctor" class="medicare-btn medicare-btn-secondary">
                                    <i class="fas fa-arrow-left me-1"></i> Cancel
                                </a>
                                <button type="submit" class="medicare-btn medicare-btn-primary">
                                    <i class="fas fa-save me-1"></i> Update Doctor
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>



        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Form validation
                const form = document.querySelector('.needs-validation');
                form.addEventListener('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                });

                // Handle "Other" specialization option
                const specializationSelect = document.getElementById('specialization');
                if (specializationSelect) {
                    const currentSpecialization = '${doctor.doctor_special}';
                    let found = false;

                    for (let i = 0; i < specializationSelect.options.length; i++) {
                        if (specializationSelect.options[i].value === currentSpecialization) {
                            specializationSelect.selectedIndex = i;
                            found = true;
                            break;
                        }
                    }

                    if (!found && currentSpecialization) {
                        specializationSelect.value = 'Other';
                    }
                }
            });
     

        </script>
        </body>

        </html>