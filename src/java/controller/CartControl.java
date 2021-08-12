/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Product;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Hùng
 */
@WebServlet(name = "CartControl", urlPatterns = {"/CartControl"})
public class CartControl extends HttpServlet {

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
        HttpSession session = request.getSession();
        String action = (String) session.getAttribute("action");
        java.util.Enumeration em = session.getAttributeNames();
        List<Product> list = new ArrayList<>();
        int total = 0;
        int VAT = 0;
        while (em.hasMoreElements()) {
            String idCard = em.nextElement().toString();
            try {
                
                Product pro = (Product) session.getAttribute(idCard);
                if (pro.getSale() == 0) {
                    total += pro.getPrice() * pro.getQuantity();
                } else {
                    total += (pro.getPrice() * pro.getQuantity() - pro.getPrice() * pro.getQuantity() * pro.getSale() / 100);
                }
                list.add(pro);
            } catch (Exception e) {
            }
        }
        
        session.setAttribute("total", total);
        session.setAttribute("VAT", VAT);
        session.setAttribute("listProduct", list);
        if (action.equals("1")) {
            String idCard = (String) session.getAttribute("idCard");
            String id = (String) session.getAttribute("id");
            request.getRequestDispatcher("previewControl?cid="+id+"&id="+idCard+"").forward(request, response);
        } else {
            response.sendRedirect("Cart.jsp");
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
