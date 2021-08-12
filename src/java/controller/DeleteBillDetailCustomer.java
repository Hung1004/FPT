/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DAOBill;
import dao.DAOBillDetail;
import dao.DAOProduct;
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
@WebServlet(name = "deleteBillDetailCustomer", urlPatterns = {"/deleteBillDetailCustomer"})
public class DeleteBillDetailCustomer extends HttpServlet {

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
        String hid = request.getParameter("hid");
        String pid = request.getParameter("pid");
        String quanP = request.getParameter("quan");
        String totalB = request.getParameter("totalB");
        DAOBillDetail daoBD = new DAOBillDetail();
        DAOProduct daoP = new DAOProduct();
        DAOBill daoB = new DAOBill();
        int quan = Integer.parseInt(quanP);
        float to = Float.parseFloat(totalB);
        int num = daoBD.getNumHidByHid_Pid(hid);
        int quantityP = daoP.getQuantityByid(pid);
        int soldP = daoP.getSoldById(pid);
        int total = daoB.getTotalByHid(hid);
//         System.out.println(hid + " a " + pid + " b " + num+" c "+quan +" d "+quantityP+" e "+ soldP+" f "+total);
        if (num == 1) {
            daoBD.DeleteBillDetailByHid_Pid(hid, pid);
            daoB.DeleteBillByhid(hid);
            daoP.SubQuantity(quantityP + quan, soldP - quan, Integer.parseInt(pid));
        } else {
            daoBD.DeleteBillDetailByHid_Pid(hid, pid);
            daoB.UpdateBillByTotal(total-to+"", hid);
            daoP.SubQuantity(quantityP + quan, soldP - quan, Integer.parseInt(pid));
        }

        response.sendRedirect("billDetailCustomer");
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
