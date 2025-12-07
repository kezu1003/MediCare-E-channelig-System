

<!-- Footer -->
<footer class="medicare-footer mt-5">
    <div class="container">
        <div class="row">
            <div class="col-md-4 mb-4 mb-md-0">
                <h4 class="mb-4">MediCare</h4>
                <p>Providing quality healthcare services and management solutions since 2022.</p>
                <div class="d-flex mt-3">
                    <a href="#" class="btn btn-outline-primary btn-sm rounded-circle me-2"><i
                            class="fab fa-facebook-f"></i></a>
                    <a href="#" class="btn btn-outline-primary btn-sm rounded-circle me-2"><i
                            class="fab fa-twitter"></i></a>
                    <a href="#" class="btn btn-outline-primary btn-sm rounded-circle me-2"><i
                            class="fab fa-linkedin-in"></i></a>
                    <a href="#" class="btn btn-outline-primary btn-sm rounded-circle"><i
                            class="fab fa-instagram"></i></a>
                </div>
            </div>
            <div class="col-md-4 mb-4 mb-md-0">
                <h5 class="mb-4">Quick Links</h5>
                <ul class="list-unstyled">
                    <li class="mb-2"><a href="index.jsp" class="text-decoration-none">Home</a></li>
                    <li class="mb-2"><a href="managedoctor" class="text-decoration-none">Doctors</a></li>
                    <li class="mb-2"><a href="manageappointment" class="text-decoration-none">Appointments</a></li>
                    <li class="mb-2"><a href="#" class="text-decoration-none">Services</a></li>
                    <li><a href="#" class="text-decoration-none">Contact Us</a></li>
                </ul>
            </div>
            <div class="col-md-4">
                <h5 class="mb-4">Contact Info</h5>
                <ul class="list-unstyled">
                    <li class="mb-2"><i class="fas fa-map-marker-alt me-2"></i> 123 Healthcare St., Medical City</li>
                    <li class="mb-2"><i class="fas fa-phone me-2"></i> +1 (555) 123-4567</li>
                    <li class="mb-2"><i class="fas fa-envelope me-2"></i> info@medicare.com</li>
                    <li><i class="fas fa-clock me-2"></i> Mon-Fri: 9AM - 5PM</li>
                </ul>
            </div>
        </div>
        <hr class="mt-4">
        <div class="text-center py-3">
            <p class="mb-0">&copy; ${java.time.Year.now().getValue()} MediCare Healthcare System. All rights reserved.
            </p>
        </div>
    </div>
</footer>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<!-- Any additional page-specific JavaScript -->
<c:if test="${not empty param.extraJs}">
    ${param.extraJs}
</c:if>

<!-- Common MediCare JS -->
<script>
    // Close alert messages automatically after 5 seconds
    document.addEventListener('DOMContentLoaded', function () {
        setTimeout(function () {
            const alerts = document.querySelectorAll('.medicare-alert, .alert');
            alerts.forEach(function (alert) {
                const bsAlert = new bootstrap.Alert(alert);
                bsAlert.close();
            });
        }, 5000);
    });
</script>
</body>

</html>