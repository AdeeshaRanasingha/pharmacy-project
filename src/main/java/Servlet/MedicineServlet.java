package Servlet;

import Services.MedicineService;
import Model.InventoryModel;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/MedicineServlet")
public class MedicineServlet extends HttpServlet {
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        ArrayList<InventoryModel> list = MedicineService.getAllMedicines();
        request.setAttribute("medicineList", list);
        
        System.out.println("Medicine List Size: " + list.size());
        for (InventoryModel m : list) {
            System.out.println(" - " + m.getMedicineName());
        }
        RequestDispatcher rd = request.getRequestDispatcher("medicine.jsp");
        rd.forward(request, response);
    }
}
