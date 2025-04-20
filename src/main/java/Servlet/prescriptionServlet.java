package Servlet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.nio.file.Paths;
import javax.servlet.http.Part;



import Model.OderModel;
import Services.prescriptionServices;

@WebServlet("/prescriptionServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
                 maxFileSize = 1024 * 1024 * 10,       // 10MB
                 maxRequestSize = 1024 * 1024 * 50)    // 50MB
public class prescriptionServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form data
        String fullName = request.getParameter("fullName");
        String address = request.getParameter("address");
        String phoneStr = request.getParameter("phone");
        String quantityStr = request.getParameter("quantity");
        String payment = request.getParameter("payment");

        int phone = Integer.parseInt(phoneStr);
        int quantity = Integer.parseInt(quantityStr);

        // Handle file upload
        Part filePart = request.getPart("prescription");
        String contentDisp = filePart.getHeader("content-disposition");
        String fileName = contentDisp.substring(contentDisp.indexOf("filename=") + 10, contentDisp.length() - 1);



        String uploadPath = getServletContext().getRealPath("/uploads");


        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        // Save file if exists
        if (fileName != null && !fileName.trim().isEmpty()) {
            String filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);
        }

        // Create order model and save
        OderModel order = new OderModel();
        order.setName(fullName);
        order.setAddress(address);
        order.setTelephone(phone);
        order.setPayment(payment);
        order.setPrescription(fileName);  // Save just the file name
        order.setTotalPrice(quantity); // Assume Rs.100 per day
        order.setStatus("Pending");

        // Save to DB
        prescriptionServices service = new prescriptionServices();
        service.insertData(order);

        // Redirect to order list
        response.sendRedirect("orderListServlet");
    }
}
