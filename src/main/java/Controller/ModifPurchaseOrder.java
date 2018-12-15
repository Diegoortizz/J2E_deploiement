package Controller;

import Modele.DataSourceFactory;
import Modele.DAO;
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


@WebServlet(name = "ModifPurchaseOrder", urlPatterns = {"/modifPO"})
public class ModifPurchaseOrder extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        DAO dao = new DAO(DataSourceFactory.getDataSource());
        Properties resultat = new Properties();
        
        int order_num = Integer.parseInt(request.getParameter("order_num"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        
        System.out.println(order_num + " " + quantity);
        
        try {
            dao.updateOrder(order_num,quantity);
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
