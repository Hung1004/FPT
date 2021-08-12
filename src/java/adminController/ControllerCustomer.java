/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adminController;

import dao.DAOCustomer;
import entity.Customer;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Hùng
 */
@WebServlet(name = "ControllerCustomer", urlPatterns = {"/ControllerCustomer"})
public class ControllerCustomer extends HttpServlet {

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
        String action = request.getParameter("action");
        String cid = request.getParameter("cid");
        DAOCustomer daoC = new DAOCustomer();
        if (action.equals("searchName")) {
            String search = request.getParameter("search");
            List<Customer> listgetAllCustomer = daoC.SearchCustomer(search);
            request.setAttribute("search", search);
            request.setAttribute("listgetAllCustomer", listgetAllCustomer);
            
            request.getRequestDispatcher("adminCustomerController.jsp").forward(request, response);
        }
        if (action.equals("preUpdate")) {
            request.setAttribute("cid", cid);
            request.getRequestDispatcher("adminUpdateCustomer.jsp").forward(request, response);
        }
        if (action.equals("update")) {
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String username = request.getParameter("username");
            String Password = request.getParameter("pass");
            String repass = request.getParameter("repass");
            if (repass.equals(Password)) {
                daoC.UpdateByPid(name, address, phone, username, repass, cid);
                response.sendRedirect("managerCustomer");

            } else {
                request.setAttribute("name", name);
                request.setAttribute("address", address);
                request.setAttribute("phone", phone);
                request.setAttribute("username", username);
                request.setAttribute("pass", "");
                request.setAttribute("alert", "Enter correct Password");
                response.sendRedirect("adminUpdateCustomer.jsp");
            }
        }
        if (action.equals("delete")) {
            daoC.DeleteByPid(cid);
            response.sendRedirect("managerCustomer");
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
