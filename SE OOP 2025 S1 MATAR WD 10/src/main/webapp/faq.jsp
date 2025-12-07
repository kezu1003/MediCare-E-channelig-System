<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href = "CSS/bootstrap.min.css">
<link rel="stylesheet" href = "CSS/FAQ.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FAQ - Online Doctor Channeling</title>
<meta charset="UTF-8">

</head>
<body>


    <div class="container mt-5">
        <h1 class="text-center mb-4">Frequently Asked Questions</h1>
        <p class="text-center mb-5">Find answers to common questions about our online doctor channeling services.</p>

        <div class="accordion" id="faqAccordion">
            <!-- FAQ 1 -->
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingOne">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                        How do I book an appointment with a doctor?
                    </button>
                </h2>
                <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#faqAccordion">
                    <div class="accordion-body">
                        To book an appointment, register or log in to your account, select a doctor from the available list, choose a suitable time slot, and confirm your booking. You will receive a confirmation email with the appointment details.
                    </div>
                </div>
            </div>
            <!-- FAQ 2 -->
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingTwo">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                        What types of doctors are available?
                    </button>
                </h2>
                <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#faqAccordion">
                    <div class="accordion-body">
                        We offer consultations with various specialists, including general physicians, cardiologists, dermatologists, pediatricians, and more. Check the "Doctors" section for the full list.
                    </div>
                </div>
            </div>
            <!-- FAQ 3 -->
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingThree">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                        Is my personal information secure?
                    </button>
                </h2>
                <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#faqAccordion">
                    <div class="accordion-body">
                        Yes, we use advanced encryption and comply with data protection regulations to ensure your personal and medical information is secure.
                    </div>
                </div>
            </div>
            <!-- FAQ 4 -->
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingFour">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                        Can I cancel or reschedule my appointment?
                    </button>
                </h2>
                <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#faqAccordion">
                    <div class="accordion-body">
                        Yes, you can cancel or reschedule your appointment through your account dashboard up to 24 hours before the scheduled time. Please check our cancellation policy for details.
                    </div>
                </div>
            </div>
            <!-- FAQ 5 -->
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingFive">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                        How do online consultations work?
                    </button>
                </h2>
                <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#faqAccordion">
                    <div class="accordion-body">
                        Online consultations are conducted via secure video calls. At the scheduled time, log in to your account, join the call, and consult with your doctor. Ensure you have a stable internet connection and a working camera/microphone.
                    </div>
                </div>
            </div>
        </div>

        <div class="text-center mt-4">
            
            <a href="index.jsp" class="btn btn-primary">Back to Home</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    
    <footer class="bg-body-tertiary text-center text-lg-start">

  <div class="container p-4">
    
    <div class="row">
    
      <div class="col-lg-6 col-md-12 mb-4 mb-md-0">
        <h2 class="bg-body-tertiary text-center text-lg-start"> Contact  Support</h2>


      </div>
 
      <div class="col-lg-6 col-md-12 mb-4 mb-md-0">

        <p>
            Have questions or need assistance? The Medi Care team is here to help! Reach out to us at support@medicare.com or call +94 1234567. Follow us on social media for updates and health tips. Your well-being is our priority, and we’re committed to supporting you every step of the way.
        </p>
      </div>
 
    </div>
  
  </div>
 

  
  <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.05);">
    © 2025 Copyright:
    <a class="text-body" >MediCare.com</a>
  </div>
  <!-- Copyright -->
</footer>
    
    

</body>
</html>