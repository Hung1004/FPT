/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DAOProduct;
import entity.Product;
import java.io.IOException;
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
@WebServlet(name = "OnchangeCartProduct", urlPatterns = {"/OnchangeCartProduct"})
public class OnchangeCartProduct extends HttpServlet {

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
        String numProductSes = (String) session.getAttribute("numProduct");
        String idCard = request.getParameter("idCard");
        Product pro = (Product) session.getAttribute(idCard);
        int numProduct = Integer.parseInt(numProductSes);
        String quantityIn = request.getParameter("quantityIn");// Num nhap
        if ("".equals(quantityIn)) {
            session.setAttribute("numProduct", numProduct - pro.getQuantity() + "");
            session.removeAttribute(idCard);
            session.setAttribute("action", "0");
            response.sendRedirect("CartControl");
            return;
        }
        int numquan = Integer.parseInt(quantityIn);
        DAOProduct d = new DAOProduct();
        int num = d.getQuantityByid(idCard);

        if (pro.getQuantity() <= numquan) {
            if (numquan >= num) {
                session.setAttribute("numProduct", numProduct - pro.getQuantity() + num + "");
                pro.setQuantity(num);
                session.setAttribute(idCard, pro);
            } else {
                session.setAttribute("numProduct", numProduct - pro.getQuantity() + numquan + "");
                pro.setQuantity(numquan);
                session.setAttribute(idCard, pro);
            }
        } else {
            if (numquan == 0) {
                session.setAttribute("numProduct", numProduct - pro.getQuantity() + "");
                session.removeAttribute(idCard);

            } else {
                session.setAttribute("numProduct", numProduct + numquan - pro.getQuantity() + "");
                pro.setQuantity(numquan);
                session.setAttribute(idCard, pro);
            }
        }
        session.setAttribute("action", "0");
        response.sendRedirect("CartControl");
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
