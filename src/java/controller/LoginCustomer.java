/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DAOAdmin;
import entity.Customer;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.DAOCustomer;
import entity.Admin;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Hùng
 */
@WebServlet(name = "loginCustomer", urlPatterns = {"/loginCustomer"})
public class LoginCustomer extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        DAOCustomer daoC = new DAOCustomer();
        DAOAdmin daoA = new DAOAdmin();
        String name = request.getParameter("name");
        String pass = request.getParameter("pass");
        String pass2 = request.getParameter("pass_2");
        Customer listC = daoC.getCustomer(name, pass);
        Admin listA = daoA.getAdmin(name, pass, pass2);

        if (pass2.isEmpty()) {
            if (listC == null) {
                request.setAttribute("username", "Please enter corect!");
                request.getRequestDispatcher("customerLogin.jsp").forward(request, response);
                return;
            }
            int cidCus = listC.getCid();
            session.setAttribute("listC", listC);
            session.setAttribute("cidCus", cidCus);
            session.setMaxInactiveInterval(1000);
            response.sendRedirect("homeControl");
        } else {
            if (listA == null) {
                request.setAttribute("username", "Please enter corect!");
                request.getRequestDispatcher("customerLogin.jsp").forward(request, response);
                return;
            }
            session.setAttribute("listAd", listA);
            session.setMaxInactiveInterval(1000);
            response.sendRedirect("adminController");
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
