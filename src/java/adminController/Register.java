/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adminController;

import dao.DAOAdmin;
import entity.Admin;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Hùng
 */
@WebServlet(name = "register", urlPatterns = {"/register"})
public class Register extends HttpServlet {

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
        DAOAdmin d = new DAOAdmin();
        String name = request.getParameter("name");
        String fullname = request.getParameter("fullname");
        String pass = request.getParameter("pass");
        String pass2 = request.getParameter("pass2");
        System.out.println(name);
        System.out.println(fullname);
        System.out.println(pass);
        System.out.println(pass2);
        if (name.isEmpty() || fullname.isEmpty() || pass2.isEmpty() || pass.isEmpty()) {
            request.setAttribute("name", "Please enter Name!");
            request.setAttribute("fullname", "Please enter FullName!");
            request.setAttribute("pass", "");
            request.setAttribute("pass2", "");
            request.getRequestDispatcher("adminRegister.jsp").forward(request, response);
            return;
        }
        boolean check = d.checkDouble(name);
        System.out.println(check);
        if (check == false) {
            request.setAttribute("name", "Please enter corect UserName!");
            request.getRequestDispatcher("adminRegister.jsp").forward(request, response);
            return;
        }

        Admin a = new Admin(name, fullname, pass, pass2);
        d.register(a);
        request.setAttribute("name", name);
        request.setAttribute("pass", pass);
        request.getRequestDispatcher("adminLogin.jsp").forward(request, response);
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
