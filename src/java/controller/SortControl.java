/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DAOCategory;
import dao.DAOProduct;
import entity.Category;
import entity.Product;
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
@WebServlet(name = "SortControl", urlPatterns = {"/SortControl"})
public class SortControl extends HttpServlet {

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
        DAOProduct d = new DAOProduct();
        DAOCategory daoCa = new DAOCategory();
        String cidSort = request.getParameter("cidSort");
        String value = request.getParameter("value");

        List<Category> listgetAllCategory = daoCa.getAllCategory();
        List<Product> listSortProduct;

        if (cidSort.equals("0") || cidSort.equals("")) {
            if (value.equals("1")) {
                listSortProduct = d.getAllProduct();
                request.setAttribute("listgetAllProductByCid", listSortProduct);
                request.setAttribute("cidSort", cidSort);

            } else if (value.equals("2")) {
                listSortProduct = d.SortProductAllAsc("pname");
                request.setAttribute("listgetAllProductByCid", listSortProduct);
                request.setAttribute("cidSort", cidSort);
            } else if (value.equals("3")) {
                listSortProduct = d.SortProductAllDesc("pname");
                request.setAttribute("listgetAllProductByCid", listSortProduct);
                request.setAttribute("cidSort", cidSort);
            } else if (value.equals("4")) {
                listSortProduct = d.SortProductAllAsc("price");
                request.setAttribute("listgetAllProductByCid", listSortProduct);
                request.setAttribute("cidSort", cidSort);
            } else if (value.equals("5")) {
                listSortProduct = d.SortProductAllDesc("price");
                request.setAttribute("listgetAllProductByCid", listSortProduct);
                request.setAttribute("cidSort", cidSort);
            } else if (value.equals("6")) {
                listSortProduct = d.SortProductAllDesc("sold");
                request.setAttribute("listgetAllProductByCid", listSortProduct);
                request.setAttribute("cidSort", cidSort);
            } else if (value.equals("7")) {
                listSortProduct = d.SortProductAllDesc("pid");
                request.setAttribute("listgetAllProductByCid", listSortProduct);
                request.setAttribute("cidSort", cidSort);
            } else {
                listSortProduct = d.SortProductAllDesc("sale");
                request.setAttribute("listgetAllProductByCid", listSortProduct);
                request.setAttribute("cidSort", cidSort);
            }

        } else {
            if (value.equals("1")) {
                listSortProduct = d.getAllProductByCid(cidSort);
                request.setAttribute("listgetAllProductByCid", listSortProduct);
                request.setAttribute("cidSort", cidSort);
            } else if (value.equals("2")) {
                listSortProduct = d.SortProductAllAsc(cidSort, "pname");
                request.setAttribute("listgetAllProductByCid", listSortProduct);
                request.setAttribute("cidSort", cidSort);
            } else if (value.equals("3")) {
                listSortProduct = d.SortProductAllDesc(cidSort, "pname");
                request.setAttribute("listgetAllProductByCid", listSortProduct);
                request.setAttribute("cidSort", cidSort);
            } else if (value.equals("4")) {
                listSortProduct = d.SortProductAllAsc(cidSort, "price");
                request.setAttribute("listgetAllProductByCid", listSortProduct);
                request.setAttribute("cidSort", cidSort);
            } else if (value.equals("5")) {
                listSortProduct = d.SortProductAllDesc(cidSort, "price");
                request.setAttribute("listgetAllProductByCid", listSortProduct);
                request.setAttribute("cidSort", cidSort);
            } else if (value.equals("6")) {
                listSortProduct = d.SortProductAllDesc(cidSort, "sold");
                request.setAttribute("listgetAllProductByCid", listSortProduct);
                request.setAttribute("cidSort", cidSort);
            } else if (value.equals("7")) {
                listSortProduct = d.SortProductAllDesc(cidSort, "pid");
                request.setAttribute("listgetAllProductByCid", listSortProduct);
                request.setAttribute("cidSort", cidSort);
            } else {
                listSortProduct = d.SortProductAllDesc(cidSort, "sale");
                request.setAttribute("listgetAllProductByCid", listSortProduct);
                request.setAttribute("cidSort", cidSort);
            }

        }
        request.setAttribute("value", value);
        request.setAttribute("listgetAllCategory", listgetAllCategory);
        request.getRequestDispatcher("detail.jsp").forward(request, response);
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
