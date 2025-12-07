package servlet;

import model.Hospital;
import services.HospitalService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

@SuppressWarnings("serial")
@WebServlet("/hospitals")
public class HospitalServlet extends HttpServlet {
    private HospitalService hospitalService;
    private static final Pattern NAME_PATTERN = Pattern.compile("^[a-zA-Z0-9 \\-' ]{1,100}$");
    private static final Pattern ADDRESS_PATTERN = Pattern.compile("^[a-zA-Z0-9 \\-,.]{1,255}$");
    private static final Pattern PHONE_PATTERN = Pattern.compile("^[0-9\\- ]{10,15}$");

    @Override
    public void init() {
        hospitalService = new HospitalService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("edit".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            Hospital hospital = null;
			try {
				hospital = hospitalService.getHospitalById(id);
			} catch (ClassNotFoundException e) {
				
				e.printStackTrace();
			}
            req.setAttribute("hospital", hospital);
            req.getRequestDispatcher("/edit-hospital.jsp").forward(req, resp);
        } else {
            List<Hospital> hospitals = null;
			try {
				hospitals = hospitalService.getAllHospitals();
			} catch (ClassNotFoundException e) {
			
				e.printStackTrace();
			}
            req.setAttribute("hospitals", hospitals);
            req.getRequestDispatcher("/dashboard.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        List<String> errors = new ArrayList<>();

        if ("add".equals(action) || "update".equals(action)) {
            String name = req.getParameter("name");
            String address = req.getParameter("address");
            String phone = req.getParameter("phone");

            // Server-side validation
            if (name == null || name.trim().isEmpty()) {
                errors.add("Hospital name is required.");
            } else if (!NAME_PATTERN.matcher(name).matches()) {
                errors.add("Name must be 1-100 characters and contain only letters, numbers, spaces, hyphens, or apostrophes.");
            }

            if (address == null || address.trim().isEmpty()) {
                errors.add("Address is required.");
            } else if (!ADDRESS_PATTERN.matcher(address).matches()) {
                errors.add("Address must be 1-255 characters and contain only letters, numbers, spaces, commas, periods, or hyphens.");
            }

            if (phone == null || phone.trim().isEmpty()) {
                errors.add("Phone number is required.");
            } else if (!PHONE_PATTERN.matcher(phone).matches()) {
                errors.add("Phone number must be 10-15 digits, optionally with hyphens or spaces (e.g., 123-456-7890).");
            }

            if (errors.isEmpty()) {
                Hospital hospital = new Hospital();
                hospital.setName(name.trim());
                hospital.setAddress(address.trim());
                hospital.setPhone(phone.trim());

                if ("add".equals(action)) {
                    try {
						hospitalService.addHospital(hospital);
					} catch (ClassNotFoundException e) {
						
						e.printStackTrace();
					}
                } else {
                    hospital.setId(Integer.parseInt(req.getParameter("id")));
                    try {
						hospitalService.updateHospital(hospital);
					} catch (ClassNotFoundException e) {
					
						e.printStackTrace();
					}
                }
                resp.sendRedirect("hospitals");
                return;
            } else {
                req.setAttribute("errors", errors);
                if ("add".equals(action)) {
                    List<Hospital> hospitals = null;
					try {
						hospitals = hospitalService.getAllHospitals();
					} catch (ClassNotFoundException e) {
					
						e.printStackTrace();
					}
                    req.setAttribute("hospitals", hospitals);
                    req.getRequestDispatcher("/dashboard.jsp").forward(req, resp);
                } else {
                    Hospital hospital = new Hospital();
                    hospital.setId(Integer.parseInt(req.getParameter("id")));
                    hospital.setName(name);
                    hospital.setAddress(address);
                    hospital.setPhone(phone);
                    req.setAttribute("hospital", hospital);
                    req.getRequestDispatcher("/edit-hospital.jsp").forward(req, resp);
                }
                return;
            }
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            try {
				hospitalService.deleteHospital(id);
			} catch (ClassNotFoundException e) {
				
				e.printStackTrace();
			}
            resp.sendRedirect("hospitals");
        }
    }
}