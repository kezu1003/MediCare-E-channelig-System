<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.sql.*" %>
        <%@ page import="java.util.*" %>
            <%@ page import="java.text.SimpleDateFormat" %>
                <%@ page import="model.appointment" %>
                    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

                        <jsp:include page="includes/header2.jsp">
                            <jsp:param name="pageTitle" value="Appointment Management" />
                            <jsp:param name="activePage" value="appointments" />
                            <jsp:param name="pageDescription"
                                value="View, add, update, and cancel appointments in the MediCare system" />
                        </jsp:include>

                       
                        <div class="row mb-4">
                            <div class="col-md-12">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <a href="index.jsp" class="btn btn-outline-secondary me-2">
                                            <i class="fas fa-home"></i> Dashboard
                                        </a>
                                    </div>
                                    <div>
                                        <a href="add_appointment.jsp" class="btn btn-primary">
                                            <i class="fas fa-calendar-plus me-1"></i> Add New Appointment
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                     
                        <div class="row mb-4">
                            <div class="col-md-3 mb-3">
                                <div class="medicare-dashboard-card" style="border-left: 5px solid #1a73e8;">
                                    <div class="content">
                                        <h3 id="totalAppointments">
                                            <c:out value="${appointment.size()}" default="0" />
                                        </h3>
                                        <p>Total Appointments</p>
                                    </div>
                                    <div class="icon" style="background-color: #1a73e8;">
                                        <i class="fas fa-calendar-check"></i>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 mb-3">
                                <div class="medicare-dashboard-card" style="border-left: 5px solid #28a745;">
                                    <div class="content">
                                        <h3 id="confirmedAppointments">
                                            <c:out
                                                value="${appointment.stream().filter(a -> a.getStatus().equals('Confirmed')).count()}"
                                                default="0" />
                                        </h3>
                                        <p>Confirmed</p>
                                    </div>
                                    <div class="icon" style="background-color: #28a745;">
                                        <i class="fas fa-check-circle"></i>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 mb-3">
                                <div class="medicare-dashboard-card" style="border-left: 5px solid #ffc107;">
                                    <div class="content">
                                        <h3 id="pendingAppointments">
                                            <c:out
                                                value="${appointment.stream().filter(a -> a.getStatus().equals('Pending')).count()}"
                                                default="0" />
                                        </h3>
                                        <p>Pending</p>
                                    </div>
                                    <div class="icon" style="background-color: #ffc107;">
                                        <i class="fas fa-clock"></i>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 mb-3">
                                <div class="medicare-dashboard-card" style="border-left: 5px solid #dc3545;">
                                    <div class="content">
                                        <h3 id="cancelledAppointments">
                                            <c:out
                                                value="${appointment.stream().filter(a -> a.getStatus().equals('Cancelled')).count()}"
                                                default="0" />
                                        </h3>
                                        <p>Cancelled</p>
                                    </div>
                                    <div class="icon" style="background-color: #dc3545;">
                                        <i class="fas fa-times-circle"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="medicare-card">
                            <div class="medicare-card-header">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h4 class="mb-0"><i class="fas fa-calendar-alt me-2"></i>Appointment Records</h4>
                                    <div>
                                        <button class="btn btn-sm btn-light" onclick="window.print()">
                                            <i class="fas fa-print me-1"></i> Print
                                        </button>
                                        <button class="btn btn-sm btn-light ms-2" data-bs-toggle="modal"
                                            data-bs-target="#filterModal">
                                            <i class="fas fa-filter me-1"></i> Filter
                                        </button>
                                        <div class="dropdown d-inline-block ms-2">
                                            <button class="btn btn-sm btn-light dropdown-toggle" type="button"
                                                id="exportDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                                <i class="fas fa-download me-1"></i> Export
                                            </button>
                                            <ul class="dropdown-menu" aria-labelledby="exportDropdown">
                                                <li><a class="dropdown-item" href="#"><i
                                                            class="far fa-file-excel me-2"></i>Excel</a></li>
                                                <li><a class="dropdown-item" href="#"><i
                                                            class="far fa-file-pdf me-2"></i>PDF</a></li>
                                                <li><a class="dropdown-item" href="#"><i
                                                            class="far fa-file-csv me-2"></i>CSV</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="medicare-card-body">
                                <div class="table-responsive">
                                    <table class="medicare-table" id="appointmentTable">
                                        
                                        <thead>
                                            <tr>
                                                <th><i class="fas fa-hashtag me-1"></i> ID</th>
                                                <th><i class="fas fa-user me-1"></i> Patient</th>
                                                <th><i class="fas fa-user-md me-1"></i> Doctor</th>
                                                <th><i class="fas fa-stethoscope me-1"></i> Specialization</th>
                                                <th><i class="fas fa-calendar me-1"></i> Date</th>
                                                <th><i class="fas fa-clock me-1"></i> Time</th>
                                                <th><i class="fas fa-info-circle me-1"></i> Status</th>
                                                <th><i class="fas fa-cogs me-1"></i> Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${appointment}" var="app">
                                                <tr>
                                                    <td>${app.appointment_id}</td>
                                                    <td>
                                                        <div class="d-flex align-items-center">
                                                            <div class="avatar-circle bg-info text-white me-2">
                                                                ${app.patient_name.substring(0,1).toUpperCase()}
                                                            </div>
                                                            <div>
                                                                <strong>${app.patient_name}</strong>
                                                                <div class="small text-muted">
                                                                    <i class="fas fa-phone-alt me-1"></i>
                                                                    ${app.contact_number}
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>Dr. ${app.doctor_name}</td>
                                                    <td>${app.specialization}</td>
                                                    <td>${app.appointment_date}</td>
                                                    <td>${app.appointment_time}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${app.status eq 'Confirmed'}">
                                                                <span class="medicare-badge medicare-badge-success">
                                                                    <i class="fas fa-check-circle me-1"></i> Confirmed
                                                                </span>
                                                            </c:when>
                                                            <c:when test="${app.status eq 'Pending'}">
                                                                <span class="medicare-badge medicare-badge-warning">
                                                                    <i class="fas fa-clock me-1"></i> Pending
                                                                </span>
                                                            </c:when>
                                                            <c:when test="${app.status eq 'Cancelled'}">
                                                                <span class="medicare-badge medicare-badge-danger">
                                                                    <i class="fas fa-times-circle me-1"></i> Cancelled
                                                                </span>
                                                            </c:when>
                                                            <c:when test="${app.status eq 'Completed'}">
                                                                <span class="medicare-badge medicare-badge-info">
                                                                    <i class="fas fa-check-double me-1"></i> Completed
                                                                </span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="medicare-badge">${app.status}</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex">
                                                           

                                                            <c:if test="${app.status ne 'Cancelled'}">
                                                                <form action="cancelAppointment" method="post"
                                                                    class="me-1"
                                                                    onsubmit="return confirm('Are you sure you want to cancel this appointment?');">
                                                                    <input type="hidden" name="id"
                                                                        value="${app.appointment_id}">
                                                                    <button type="submit"
                                                                        class="medicare-action-btn medicare-btn-warning">
                                                                        <i class="fas fa-ban"></i> Cancel
                                                                    </button>
                                                                </form>
                                                            </c:if>
                                                            <form action="deleteAppointment" method="post"
                                                                onsubmit="return confirm('Are you sure you want to delete this appointment? This action cannot be undone.');">
                                                                <input type="hidden" name="id"
                                                                    value="${app.appointment_id}">
                                                                <button type="submit"
                                                                    class="medicare-action-btn medicare-btn-danger">
                                                                    <i class="fas fa-trash-alt"></i> Delete
                                                                </button>
                                                            </form>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="medicare-card-footer text-center">
                                <div class="d-flex justify-content-between align-items-center">
                                    <span>Total appointments: <strong>${appointment.size()}</strong></span>
                                    <div>
                                        <button class="btn btn-sm btn-outline-secondary disabled">Previous</button>
                                        <button class="btn btn-sm btn-outline-primary">1</button>
                                        <button class="btn btn-sm btn-outline-secondary disabled">Next</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- No appointments message -->
                        <c:if test="${empty appointment}">
                            <div class="medicare-alert medicare-alert-info">
                                <i class="fas fa-info-circle me-2"></i> No appointments found in the system.
                                <p class="mt-2">
                                    <a href="add_appointment.jsp" class="btn btn-sm btn-primary">
                                        <i class="fas fa-plus-circle me-1"></i> Create your first appointment
                                    </a>
                                </p>
                            </div>
                        </c:if><!-- Filter Modal -->
                        <div class="modal fade" id="filterModal" tabindex="-1" aria-labelledby="filterModalLabel"
                            aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="filterModalLabel">Filter Appointments</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="filterForm" class="row g-3">
                                            <div class="col-md-6">
                                                <label for="filterPatientName" class="form-label">Patient Name</label>
                                                <input type="text" class="form-control" id="filterPatientName"
                                                    name="patientName" placeholder="Enter patient name">
                                            </div>

                                            <div class="col-md-6">
                                                <label for="filterDoctorName" class="form-label">Doctor Name</label>
                                                <input type="text" class="form-control" id="filterDoctorName"
                                                    name="doctorName" placeholder="Enter doctor name">
                                            </div>

                                            <div class="col-md-6">
                                                <label for="filterSpecialization"
                                                    class="form-label">Specialization</label>
                                                <select class="form-select" id="filterSpecialization"
                                                    name="specialization">
                                                    <option value="">All Specializations</option>
                                                    <option value="Cardiology">Cardiology</option>
                                                    <option value="Dermatology">Dermatology</option>
                                                    <option value="Neurology">Neurology</option>
                                                    <option value="Orthopedics">Orthopedics</option>
                                                    <option value="Pediatrics">Pediatrics</option>
                                                    <option value="Psychiatry">Psychiatry</option>
                                                    <option value="Oncology">Oncology</option>
                                                    <option value="Ophthalmology">Ophthalmology</option>
                                                </select>
                                            </div>

                                            <div class="col-md-6">
                                                <label for="filterStatus" class="form-label">Status</label>
                                                <select class="form-select" id="filterStatus" name="status">
                                                    <option value="">All Statuses</option>
                                                    <option value="Confirmed">Confirmed</option>
                                                    <option value="Pending">Pending</option>
                                                    <option value="Cancelled">Cancelled</option>
                                                    <option value="Completed">Completed</option>
                                                </select>
                                            </div>

                                            <div class="col-md-6">
                                                <label for="filterDateFrom" class="form-label">Date From</label>
                                                <input type="date" class="form-control" id="filterDateFrom"
                                                    name="dateFrom">
                                            </div>

                                            <div class="col-md-6">
                                                <label for="filterDateTo" class="form-label">Date To</label>
                                                <input type="date" class="form-control" id="filterDateTo" name="dateTo">
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary" onclick="applyFilters()">Apply
                                            Filters</button>
                                        <button type="button" class="btn btn-outline-secondary"
                                            onclick="resetFilters()">Reset</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <style>
                            .avatar-circle {
                                width: 32px;
                                height: 32px;
                                border-radius: 50%;
                                display: flex;
                                align-items: center;
                                justify-content: center;
                                font-weight: bold;
                            }

                            @media print {

                                .medicare-header,
                                .medicare-page-title,
                                .medicare-footer,
                                .btn,
                                .medicare-action-btn,
                                .no-print {
                                    display: none !important;
                                }

                                body {
                                    padding: 0;
                                    margin: 0;
                                }

                                .medicare-card {
                                    box-shadow: none;
                                    border: none;
                                }

                                .medicare-card-header {
                                    background: #f1f1f1 !important;
                                    color: #000 !important;
                                    -webkit-print-color-adjust: exact;
                                    print-color-adjust: exact;
                                }

                                .medicare-table th {
                                    background-color: #f1f1f1 !important;
                                    color: #000 !important;
                                    -webkit-print-color-adjust: exact;
                                    print-color-adjust: exact;
                                }
                            }
                        </style>

                        <script>
                            // Function to apply filters to the appointment table
                            function applyFilters() {
                                const patientName = document.getElementById('filterPatientName').value.toLowerCase();
                                const doctorName = document.getElementById('filterDoctorName').value.toLowerCase();
                                const specialization = document.getElementById('filterSpecialization').value.toLowerCase();
                                const status = document.getElementById('filterStatus').value;
                                const dateFrom = document.getElementById('filterDateFrom').value;
                                const dateTo = document.getElementById('filterDateTo').value;

                                const rows = document.querySelectorAll('#appointmentTable tbody tr');

                                rows.forEach(row => {
                                    const patient = row.cells[1].textContent.toLowerCase();
                                    const doctor = row.cells[2].textContent.toLowerCase();
                                    const special = row.cells[3].textContent.toLowerCase();
                                    const rowStatus = row.cells[6].textContent.toLowerCase();
                                    const dateStr = row.cells[4].textContent;

                                    // Convert date string to comparable format
                                    const rowDate = new Date(dateStr);
                                    const fromDate = dateFrom ? new Date(dateFrom) : null;
                                    const toDate = dateTo ? new Date(dateTo) : null;

                                    // Check if row matches all filter criteria
                                    const matchesPatient = !patientName || patient.includes(patientName);
                                    const matchesDoctor = !doctorName || doctor.includes(doctorName);
                                    const matchesSpecial = !specialization || special.includes(specialization);
                                    const matchesStatus = !status || rowStatus.includes(status.toLowerCase());

                                    let matchesDate = true;
                                    if (fromDate && toDate) {
                                        matchesDate = rowDate >= fromDate && rowDate <= toDate;
                                    } else if (fromDate) {
                                        matchesDate = rowDate >= fromDate;
                                    } else if (toDate) {
                                        matchesDate = rowDate <= toDate;
                                    }

                                    // Show/hide row based on filter match
                                    if (matchesPatient && matchesDoctor && matchesSpecial && matchesStatus && matchesDate) {
                                        row.style.display = '';
                                    } else {
                                        row.style.display = 'none';
                                    }
                                });

                                // Close the modal after applying filters
                                const modal = bootstrap.Modal.getInstance(document.getElementById('filterModal'));
                                modal.hide();

                                // Update visible count
                                updateVisibleCount();
                            }

                            // Function to reset filters
                            function resetFilters() {
                                document.getElementById('filterForm').reset();

                                const rows = document.querySelectorAll('#appointmentTable tbody tr');
                                rows.forEach(row => {
                                    row.style.display = '';
                                });

                                // Update visible count
                                updateVisibleCount();
                            }

                            // Function to update the visible appointments count
                            function updateVisibleCount() {
                                const visibleRows = document.querySelectorAll('#appointmentTable tbody tr:not([style*="display: none"])').length;
                                document.getElementById('totalAppointments').textContent = visibleRows;
                            }

                            // Initialize counts on page load
                            document.addEventListener('DOMContentLoaded', function () {
                                updateVisibleCount();
                            });
                        </script>

                        <jsp:include page="includes/footer.jsp" />
                        
                        
                        
                        <script>
                            function confirmCancel() {
                                return confirm("Are you sure you want to cancel this appointment?");
                            }
                            function confirmDelete() {
                                return confirm("Are you sure you want to delete this appointment? This action cannot be undone.");
                            }
                        </script>
                        </head>

                       
                        </html>