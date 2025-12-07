<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <jsp:include page="includes/header.jsp">
            <jsp:param name="pageTitle" value="View Our Professioal Doctors Here..." />
            <jsp:param name="activePage" value="doctors" />
        </jsp:include>

        <!-- Main Content -->
        <div class="row mb-4">
            <div class="col-md-12">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <a href="index.jsp" class="btn btn-outline-secondary me-2">
                            <i class="fas fa-home"></i> Dashboard
                        </a>
                    </div>
                </div>
            </div>
        </div><!-- Doctors Table Card -->
        <div class="medicare-card">
            <div class="medicare-card-header">
                <div class="d-flex justify-content-between align-items-center">
                    <h4 class="mb-0"><i class="fas fa-user-md me-2"></i>Medical Staff Directory</h4>
                    <div>
                        <button class="btn btn-sm btn-light" onclick="window.print()">
                            <i class="fas fa-print me-1"></i> Print
                        </button>
                        <button class="btn btn-sm btn-light ms-2" data-bs-toggle="modal" data-bs-target="#filterModal">
                            <i class="fas fa-filter me-1"></i> Filter
                        </button>
                    </div>
                </div>
            </div>
            <div class="medicare-card-body">
                <div class="table-responsive">
                    <table class="medicare-table">
                        <thead>
                            <tr>
                                <th><i class="fas fa-id-card me-1"></i> ID</th>
                                <th><i class="fas fa-user me-1"></i> Name</th>
                                <th><i class="fas fa-stethoscope me-1"></i> Specialization</th>
                                <th><i class="fas fa-phone me-1"></i> Contact</th>
                                <th><i class="fas fa-envelope me-1"></i> Email</th>
                                <th><i class="fas fa-calendar-alt me-1"></i> Availability</th>
                                <th><i class="fas fa-cogs me-1"></i> Actions</th>
                            </tr>
                            
                            <!-- Static example data - remove in production -->
                                    <tr>
                                        <td>001</td>
                                        <td>Dr.Kamal Halwitage</td>
                                        <td>Cardiology</td>
                                        <td>0774574433</td>
                                        <td>kamalMEDICARE123@gmail.com</td>
                                        <td>Available</td>
                                        <td>Check Heart Patients</td>
                                    </tr>
                                    <tr>
                                        <td>002</td>
                                        <td>Dr.Dammika Perera</td>
                                        <td>Skin Care</td>
                                        <td>0776674433</td>
                                        <td>dammikaMEDICARE123@gmail.com</td>
                                        <td>Available</td>
                                        <td>Check Skin Problems</td>
                                    </tr>
                                    <tr>
                                        <td>003</td>
                                        <td>Dr.Vithana</td>
                                        <td>Neurology</td>
                                        <td>0774599433</td>
                                        <td>vithanaMEDICARE123@gmail.com</td>
                                        <td>Available</td>
                                        <td>Check Reports</td>
                                    </tr>
                                    <tr>
                                        <td>004</td>
                                        <td>Dr.Palitha Senanayake</td>
                                        <td>Cardiology</td>
                                        <td>0774588433</td>
                                        <td>palithaMEDICARE123@gmail.com</td>
                                        <td>Available</td>
                                        <td>Check ECG</td>
                                    </tr>
                                    <tr>
                                        <td>005</td>
                                        <td>Dr.Nishantha Dissanayake</td>
                                        <td>Skin Care</td>
                                        <td>0774522433</td>
                                        <td>nishanthaMEDICARE123@gmail.com</td>
                                        <td>Available</td>
                                        <td>Check Skin Problems</td>
                                    </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="doctor" items="${doctors}">
                                <tr>
                                    <td>${doctor.doctor_id}</td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <div class="avatar-circle bg-primary text-white me-2">
                                                ${doctor.doctor_name.substring(0,1).toUpperCase()}
                                            </div>
                                            <div>
                                                <strong>${doctor.doctor_name}</strong>
                                            </div>
                                        </div>
                                    </td>
                                    <td><span class="medicare-badge medicare-badge-info">${doctor.doctor_special}</span>
                                    </td>
                                    <td>${doctor.d_contact_number}</td>
                                    <td>
                                        <a href="mailto:${doctor.d_email_address}" class="text-decoration-none">
                                            ${doctor.d_email_address}
                                        </a>
                                    </td>
                                    <td>${doctor.action}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="medicare-card-footer text-center">
                <div class="d-flex justify-content-between align-items-center">
                    <span>Total doctors: <strong>${doctors.size()}</strong></span>
                    <div>
                        <button class="btn btn-sm btn-outline-secondary disabled">Previous</button>
                        <button class="btn btn-sm btn-outline-primary">1</button>
                        <button class="btn btn-sm btn-outline-secondary disabled">Next</button>
                    </div>
                </div>
            </div>
        </div>

        

        <!-- Filter Modal -->
        <div class="modal fade" id="filterModal" tabindex="-1" aria-labelledby="filterModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="filterModalLabel">Filter Doctors</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="filterForm">
                            <div class="mb-3">
                                <label for="specialization" class="form-label">Specialization</label>
                                <select class="form-select" id="specialization" name="specialization">
                                    <option value="">All Specializations</option>
                                    <option value="Cardiology">Cardiology</option>
                                    <option value="Dermatology">Dermatology</option>
                                    <option value="Neurology">Neurology</option>
                                    <option value="Orthopedics">Orthopedics</option>
                                    <option value="Pediatrics">Pediatrics</option>
                                </select>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Apply Filters</button>
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
        </style>

        <jsp:include page="includes/footer.jsp" />