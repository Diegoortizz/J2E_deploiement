package Controller;

import Modele.DAO;
import Modele.DataSourceFactory;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Properties;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "AddProduct", urlPatterns = {"/AddP"})
public class AddProduct extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        DAO dao = new DAO(DataSourceFactory.getDataSource());
        Properties resultat = new Properties();
        
	int PRODUCT_ID = Integer.parseInt(request.getParameter("PRODUCT_ID"));
        int MANUFACTURER_ID = Integer.parseInt(request.getParameter("MANUFACTURER_ID"));
        String PRODUCT_CODE = request.getParameter("PRODUCT_CODE");
        int PURCHASE_COST = Integer.parseInt(request.getParameter("PURCHASE_COST"));
        int QUANTITY_ON_HAND = Integer.parseInt(request.getParameter("QUANTITY_ON_HAND"));
        int MARKUP = Integer.parseInt(request.getParameter("MANUFACTURER_ID"));
        String DESCRIPTION = request.getParameter("DESCRIPTION");
        
        
        try {
            dao.insertProduct(PRODUCT_ID, MANUFACTURER_ID, PRODUCT_CODE, PURCHASE_COST, QUANTITY_ON_HAND, MARKUP, true, DESCRIPTION);
        } catch (NumberFormatException | SQLException ex) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resultat.put("message", ex.getMessage());
	}

	try (PrintWriter out = response.getWriter()) {
            response.setContentType("application/json;charset=UTF-8");
            Gson gson = new Gson();
            out.println(gson.toJson(resultat));
	}
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
