<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <jsp:include page="includes/header3.jsp">
            <jsp:param name="pageTitle" value="Add New Doctor" />
            <jsp:param name="activePage" value="doctors" />
            <jsp:param name="pageDescription" value="Create a new doctor profile in the MediCare system" />
        </jsp:include>

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

        <!-- Add Doctor Form Card -->
        <div class="medicare-card">
            <div class="medicare-card-header">
                <h4 class="mb-0"><i class="fas fa-user-md me-2"></i>New Doctor Registration</h4>
            </div>
            <div class="medicare-card-body">
                <div class="row">
                    <div class="col-md-3">
                        <div class="text-center mb-4">
                            <div class="doctor-avatar mb-3">
                                <i class="fas fa-user-md fa-5x text-primary"></i>
                            </div>
                            <div class="doctor-info-sidebar">
                                <p class="text-muted mb-1">Complete all required fields</p>
                                <div class="progress mb-3" style="height: 10px;">
                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 0%;"
                                        aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" id="form-progress">0%
                                    </div>
                                </div>
                                <p class="small">
                                    <i class="fas fa-info-circle me-1"></i>
                                    Adding doctors allows you to schedule appointments and manage your medical staff
                                    effectively.
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <form action="adddoctor" method="post" class="medicare-form needs-validation" id="doctor-form"
                            novalidate>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="doctorId" class="form-label">
                                        <i class="fas fa-id-card me-1"></i> Doctor ID <span class="text-danger">*</span>
                                    </label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-hashtag"></i></span>
                                        <input type="number" class="form-control" id="doctorId" name="doctorId" required
                                            data-field="id">
                                    </div>
                                    <div class="invalid-feedback">Please provide a valid doctor ID.</div>
                                </div>

                                <div class="col-md-6 mb-3">
                                    <label for="doctorName" class="form-label">
                                        <i class="fas fa-user me-1"></i> Doctor Name <span class="text-danger">*</span>
                                    </label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-user-md"></i></span>
                                        <input type="text" class="form-control" id="doctorName" name="doctorName"
                                            placeholder="Dr. John Doe" required data-field="name">
                                    </div>
                                    <div class="invalid-feedback">Please provide the doctor's name.</div>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="specialization" class="form-label">
                                    <i class="fas fa-stethoscope me-1"></i> Specialization <span
                                        class="text-danger">*</span>
                                </label>
                                <select class="form-select" id="specialization" name="specialization" required
                                    data-field="specialization">
                                    <option value="" selected disabled>Select a specialization</option>
                                    <option value="Cardiology">Cardiology</option>
                                    <option value="Dermatology">Dermatology</option>
                                    <option value="Neurology">Neurology</option>
                                    <option value="Orthopedics">Orthopedics</option>
                                    <option value="Pediatrics">Pediatrics</option>
                                    <option value="Psychiatry">Psychiatry</option>
                                    <option value="Oncology">Oncology</option>
                                    <option value="Ophthalmology">Ophthalmology</option>
                                    <option value="Gynecology">Gynecology</option>
                                    <option value="General Medicine">General Medicine</option>
                                    <option value="Other">Other</option>
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
                                            placeholder="xxx-xxx-xxxx" required data-field="contact">
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
                                            placeholder="doctor@example.com" required data-field="email">
                                    </div>
                                    <div class="invalid-feedback">Please provide a valid email address.</div>
                                </div>
                            </div>

                            <div class="mb-4">
                                <label for="availabilitySchedule" class="form-label">
                                    <i class="fas fa-calendar-alt me-1"></i> Availability Schedule <span
                                        class="text-danger">*</span>
                                </label>
                                <textarea class="form-control" id="availabilitySchedule" name="availabilitySchedule"
                                    rows="3" required data-field="schedule"
                                    placeholder="Monday-Friday 9AM-5PM, Saturday 9AM-12PM"></textarea>
                                <div class="invalid-feedback">Please provide the doctor's availability schedule.</div>
                                <div class="form-text text-muted">
                                    <i class="fas fa-info-circle me-1"></i> Specify the days and hours when the doctor
                                    is available for appointments.
                                </div>
                            </div>

                            <hr class="my-4">

                            <div class="d-flex justify-content-between">
                                <button type="button" class="medicare-btn medicare-btn-secondary" onclick="resetForm()">
                                    <i class="fas fa-undo me-1"></i> Reset Form
                                </button>
                                <button type="submit" class="medicare-btn medicare-btn-primary">
                                    <i class="fas fa-save me-1"></i> Save Doctor
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <style>
            .doctor-avatar {
                width: 120px;
                height: 120px;
                margin: 0 auto;
                background-color: #f0f7ff;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                color: #1a73e8;
                border: 3px solid #1a73e8;
            }
        </style>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const form = document.getElementById('doctor-form');
                const progressBar = document.getElementById('form-progress');
                const formInputs = document.querySelectorAll('[data-field]');
                const totalFields = formInputs.length;

                // Update progress bar as fields are filled
                formInputs.forEach(input => {
                    input.addEventListener('input', updateProgress);
                    input.addEventListener('change', updateProgress);
                });

                function updateProgress() {
                    let filledFields = 0;
                    formInputs.forEach(input => {
                        if (input.value && input.value.trim() !== '') {
                            filledFields++;
                        }
                    });

                    const progressPercentage = Math.round((filledFields / totalFields) * 100);
                    progressBar.style.width = progressPercentage + '%';
                    progressBar.textContent = progressPercentage + '%';
                    progressBar.setAttribute('aria-valuenow', progressPercentage);
                }

                // Form validation
                form.addEventListener('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                });
            });

            function resetForm() {
                document.getElementById('doctor-form').reset();
                document.getElementById('doctor-form').classList.remove('was-validated');
                document.getElementById('form-progress').style.width = '0%';
                document.getElementById('form-progress').textContent = '0%';
                document.getElementById('form-progress').setAttribute('aria-valuenow', 0);
            }
       

        <jsp:include page="includes/footer.jsp" />
        }, false);
        });
        }, false);
        })();
        </script>
        </body>

        </html>