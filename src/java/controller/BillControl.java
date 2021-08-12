/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DAOBill;
import dao.DAOProduct;
import entity.Product;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
@WebServlet(name = "billControl", urlPatterns = {"/billControl"})
public class BillControl extends HttpServlet {

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
        int total = (int) session.getAttribute("total");
        int vat = (int) session.getAttribute("VAT");
        int cidCus = (int) session.getAttribute("cidCus");
        List<Product> list = (List<Product>) session.getAttribute("listProduct");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String description = request.getParameter("description");
        int status = 0; //+
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String d = sdf.format(date);
        DAOBill daoB = new DAOBill();
        DAOProduct daoP = new DAOProduct();
        daoB.addBill(d, cidCus, name, address, phone, total, description, 0);
        int idBill = daoB.getIdBill(cidCus);
        
        for (Product object : list) {
            int pidBD = object.getId();
            String nameBD = object.getName();
            int quantityBD = object.getQuantity();
            int priceBD = (int) (object.getPrice() - object.getPrice() * object.getSale() / 100);
            int subtotalBD = (int) (object.getPrice() * object.getQuantity() - object.getPrice() * object.getQuantity() * object.getSale() / 100);
            daoB.addBillDetail(idBill, pidBD, name, quantityBD, priceBD, subtotalBD);
            int a = daoP.getQuantityByid(pidBD + "");
            int b = daoP.getSoldById(pidBD+"");
            daoP.SubQuantity(a - quantityBD, b + quantityBD, pidBD);
            session.removeAttribute(pidBD + "");
        }
        session.removeAttribute("listProduct");
        session.removeAttribute("idCard");
       session.setAttribute("numProduct", "0");
        session.removeAttribute("VAT");
        session.removeAttribute("total");
        request.getRequestDispatcher("homeControl").forward(request, response);

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
