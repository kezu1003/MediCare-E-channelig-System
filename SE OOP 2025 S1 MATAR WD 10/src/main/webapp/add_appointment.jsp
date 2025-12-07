<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="services.doctorService" %>
<%@ page import="model.doctor" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


                <jsp:include page="includes/header2.jsp">
                    <jsp:param name="pageTitle" value="Schedule New Appointment" />
                    <jsp:param name="activePage" value="appointments" />
                    <jsp:param name="pageDescription" value="Create a new patient appointment in the MediCare system" />
                </jsp:include>

                <!-- Main Content -->
                <div class="row mb-4">
                    <div class="col-md-12">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <a href="manageappointment" class="btn btn-outline-secondary me-2">
                                    <i class="fas fa-arrow-left"></i> Back to Appointments
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Add Appointment Form Card -->
                <div class="medicare-card">
                    <div class="medicare-card-header">
                        <h4 class="mb-0"><i class="fas fa-calendar-plus me-2"></i>New Appointment Registration</h4>
                    </div>
                    <div class="medicare-card-body">
                        <div class="row">
                            <div class="col-md-3">
                                <div class="text-center mb-4">
                                    <div class="appointment-icon mb-3">
                                        <i class="fas fa-calendar-check fa-5x text-primary"></i>
                                    </div>
                                    <div class="appointment-info-sidebar">
                                        <p class="text-muted mb-1">Complete all required fields</p>
                                        <div class="progress mb-3" style="height: 10px;">
                                            <div class="progress-bar bg-primary" role="progressbar" style="width: 0%;"
                                                aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"
                                                id="form-progress">0%</div>
                                        </div>
                                        <p class="small">
                                            <i class="fas fa-info-circle me-1"></i>
                                            Creating appointments allows patients to schedule visits with doctors for
                                            medical consultations.
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-9">
                                <form action="addappointment" method="post" class="medicare-form needs-validation"
                                    id="appointment-form" novalidate>
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label for="appointmentId" class="form-label">
                                                <i class="fas fa-id-card me-1"></i> Appointment ID <span
                                                    class="text-danger">*</span>
                                            </label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-hashtag"></i></span>
                                                <input type="number" class="form-control" id="appointmentId"
                                                    name="appointmentId" required data-field="id">
                                            </div>
                                            <div class="invalid-feedback">Please provide a valid appointment ID.</div>
                                        </div>

                                        <div class="col-md-6 mb-3">
                                            <label for="patientName" class="form-label">
                                                <i class="fas fa-user me-1"></i> Patient Name <span
                                                    class="text-danger">*</span>
                                            </label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                                                <input type="text" class="form-control" id="patientName"
                                                    name="patientName" required data-field="patient">
                                            </div>
                                            <div class="invalid-feedback">Please provide the patient's name.</div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label for="doctorName" class="form-label">
                                                <i class="fas fa-user-md me-1"></i> Doctor Name <span
                                                    class="text-danger">*</span>
                                            </label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-user-md"></i></span>
                                                <select class="form-select" id="doctorName" name="doctorName" required
                                                    data-field="doctor">
                                                    <option value="" selected disabled>Select a doctor</option>
                                                    <% 	
                                            		    doctorService doctorService = new doctorService();
														List<doctor> doctors = doctorService.getAllDoctors();
	                                                    for (doctor doc : doctors) {
	                                                %>
	                                                    <option
															value="<%= doc.getDoctor_id() %>"
															data-specialization="<%= doc.getDoctor_special() %>">
															<%= doc.getDoctor_name() %>
																
														</option>
										<% } %>


								</select>
                                            </div>
                                            <div class="invalid-feedback">Please select a doctor.</div>
                                        </div>

                                        <div class="col-md-6 mb-3">
                                            <label for="specialization" class="form-label">
                                                <i class="fas fa-stethoscope me-1"></i> Specialization <span
                                                    class="text-danger">*</span>
                                            </label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-stethoscope"></i></span>
                                                <input type="text" class="form-control" id="specialization"
                                                    name="specialization" readonly required data-field="specialization">
                                            </div>
                                            <div class="form-text text-muted">This field will be automatically filled
                                                based on the selected doctor.</div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label for="appointmentDate" class="form-label">
                                                <i class="fas fa-calendar-alt me-1"></i> Appointment Date <span
                                                    class="text-danger">*</span>
                                            </label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-calendar"></i></span>
                                                <input type="date" class="form-control" id="appointmentDate"
                                                    name="appointmentDate" min="<%= java.time.LocalDate.now() %>"
                                                    required data-field="date">
                                            </div>
                                            <div class="invalid-feedback">Please select a valid appointment date.</div>
                                        </div>

                                        <div class="col-md-6 mb-3">
                                            <label for="appointmentTime" class="form-label">
                                                <i class="fas fa-clock me-1"></i> Appointment Time <span
                                                    class="text-danger">*</span>
                                            </label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-clock"></i></span>
                                                <input type="time" class="form-control" id="appointmentTime"
                                                    name="appointmentTime" required data-field="time">
                                            </div>
                                            <div class="invalid-feedback">Please select a valid appointment time.</div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label for="status" class="form-label">
                                                <i class="fas fa-info-circle me-1"></i> Status <span
                                                    class="text-danger">*</span>
                                            </label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-tag"></i></span>
                                                <select class="form-select" id="status" name="status" required
                                                    data-field="status">
                                                    <option value="" selected disabled>Select status</option>
                                                    <option value="Pending">Pending</option>
                                                    <option value="Confirmed">Confirmed</option>
                                                </select>
                                            </div>
                                            <div class="invalid-feedback">Please select a status.</div>
                                        </div>

                                        <div class="col-md-6 mb-3">
                                            <label for="contactNumber" class="form-label">
                                                <i class="fas fa-phone me-1"></i> Contact Number <span
                                                    class="text-danger">*</span>
                                            </label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                                <input type="tel" class="form-control" id="contactNumber"
                                                    name="contactNumber" placeholder="xxx-xxx-xxxx" required
                                                    data-field="contact">
                                            </div>
                                            <div class="invalid-feedback">Please provide a valid contact number.</div>
                                        </div>
                                    </div>

                                    <div class="mb-3">
                                        <label for="emailAddress" class="form-label">
                                            <i class="fas fa-envelope me-1"></i> Email Address <span
                                                class="text-danger">*</span>
                                        </label>
                                        <div class="input-group">
                                            <span class="input-group-text">@</span>
                                            <input type="email" class="form-control" id="emailAddress"
                                                name="emailAddress" placeholder="patient@example.com" required
                                                data-field="email">
                                        </div>
                                        <div class="invalid-feedback">Please provide a valid email address.</div>
                                    </div>

                                    <div class="mb-4">
                                        <label for="reason" class="form-label">
                                            <i class="fas fa-comment-medical me-1"></i> Reason for Visit <span
                                                class="text-danger">*</span>
                                        </label>
                                        <textarea class="form-control" id="reason" name="reason" rows="3" required
                                            data-field="reason"
                                            placeholder="Please describe the reason for this appointment..."></textarea>
                                        <div class="invalid-feedback">Please provide a reason for the appointment.</div>
                                    </div>

                                    <hr class="my-4">

                                    <div class="d-flex justify-content-between">
                                        <button type="button" class="medicare-btn medicare-btn-secondary"
                                            onclick="resetForm()">
                                            <i class="fas fa-undo me-1"></i> Reset Form
                                        </button>
                                        <button type="submit" class="medicare-btn medicare-btn-primary">
                                            <i class="fas fa-calendar-check me-1"></i> Schedule Appointment
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <style>
                    .appointment-icon {
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
                        const form = document.getElementById('appointment-form');
                        const progressBar = document.getElementById('form-progress');
                        const formInputs = document.querySelectorAll('[data-field]');
                        const totalFields = formInputs.length;
                        const doctorSelect = document.getElementById('doctorName');
                        const specializationInput = document.getElementById('specialization');

                        // Auto-fill specialization when doctor is selected
                        doctorSelect.addEventListener('change', function () {
                            const selectedOption = doctorSelect.options[doctorSelect.selectedIndex];
                            const specialization = selectedOption.getAttribute('data-specialization');
                            specializationInput.value = specialization || '';
                            updateProgress();
                        });

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

                        // Initialize progress on load
                        updateProgress();
                    });

                    function resetForm() {
                        document.getElementById('appointment-form').reset();
                        document.getElementById('appointment-form').classList.remove('was-validated');
                        document.getElementById('form-progress').style.width = '0%';
                        document.getElementById('form-progress').textContent = '0%';
                        document.getElementById('form-progress').setAttribute('aria-valuenow', 0);
                        document.getElementById('specialization').value = '';
                    }
                </script>

                <jsp:include page="includes/footer.jsp" />