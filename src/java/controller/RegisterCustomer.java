/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Customer;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.DAOCustomer;

/**
 *
 * @author Hùng
 */
@WebServlet(name = "registerCustomer", urlPatterns = {"/registerCustomer"})
public class RegisterCustomer extends HttpServlet {

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
        DAOCustomer d = new DAOCustomer();
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");
        String pass = request.getParameter("pass");
        String repass = request.getParameter("repass");
        
        if (name.isEmpty() && address.isEmpty() && phone.isEmpty() && username.isEmpty() && pass.isEmpty()) {
           
            request.setAttribute("name", "Please enter Name!");
            request.setAttribute("address", "Please enter address!");
            request.setAttribute("phone", "Please enter phone!");
            request.setAttribute("username", "Please enter corect UserName!");
            request.setAttribute("pass", "");
            request.setAttribute("repass", "");
            request.getRequestDispatcher("customerRegister.jsp").forward(request, response);
            return;
        }

        if (!pass.equals(repass)) {
            request.setAttribute("repass", "");
            request.getRequestDispatcher("customerRegister.jsp").forward(request, response);
            return;
        }
        boolean check = d.checkDouble(username);
        if (check == false) {
            request.setAttribute("username", "Please enter corect UserName!");
            request.getRequestDispatcher("customerRegister.jsp").forward(request, response);
            return;
        }

        Customer a = new Customer(name, address, phone, username, pass);
        d.register(a);
        request.setAttribute("name", username);
        request.setAttribute("pass", pass);
        request.getRequestDispatcher("customerLogin.jsp").forward(request, response);
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
