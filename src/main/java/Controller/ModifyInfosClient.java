/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Modele.DataSourceFactory;
import Modele.Customer;
import Modele.DAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Utilisateur
 */
@WebServlet(name = "ModifyInfosClient", urlPatterns = {"/ModifyInfosClient"})
public class ModifyInfosClient extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        HttpSession session = request.getSession(false);

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String telephone = request.getParameter("telephone");
        String email = request.getParameter("email");
        String adresse = request.getParameter("adresse");
        String state = request.getParameter("state");
        String city = request.getParameter("city");
        String credit = request.getParameter("credit");

        System.out.println(id + " " + name + " " + telephone + " " + email + " " + adresse + " " + state + " " + city + " " + credit);

        DAO dao = new DAO(DataSourceFactory.getDataSource());
        Customer c = dao.Customer(email);
//
        dao.updateCustomerDgo(Integer.parseInt(id), name, adresse, city, state, telephone, email, Integer.parseInt(credit));
//        System.out.println("-------------------------");
//
//        System.out.println("état du customer : " + " " + c.getState());
//
//        session.setAttribute("id", id);
//        session.setAttribute("name", name);
//        session.setAttribute("telephone", telephone);
//        session.setAttribute("email", email);
//        session.setAttribute("adresse", adresse);
//        session.setAttribute("state", state);
//        session.setAttribute("city", city);
//        session.setAttribute("credit", credit);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ModifyInfosClient.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ModifyInfosClient.class.getName()).log(Level.SEVERE, null, ex);
        }
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
