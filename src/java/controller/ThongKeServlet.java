/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CartDao;
import dal.ProductDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;
import model.Shopping_Cart_Item;
import model.Shopping_cart;
import model.TopUser;

/**
 *
 * @author ACER
 */
@WebServlet(name = "ThongKeServlet", urlPatterns = {"/thongke"})

public class ThongKeServlet extends HttpServlet {
private static final Logger LOGGER = Logger.getLogger(CategoryServlet.class.getName());
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ThongKeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ThongKeServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String nam = request.getParameter("nam");

        ProductDao a = new ProductDao();
        CartDao d = new CartDao();
        //lay ra tong so san pham
        List<Product> listp = a.getAll();
        request.setAttribute("listp", listp);

        List<Shopping_cart> listsc = d.getAllShopping_cart();
        request.setAttribute("listsc", listsc);

        List<TopUser> listsctop = d.getAllShopping_cartTop5();
        request.setAttribute("listsctop", listsctop);

        List<Product> listpp = a.selectTop5Product();
        request.setAttribute("listpp", listpp);

        List<Shopping_Cart_Item> listsci = d.getAllShopping_Cart_Item();
        request.setAttribute("listsci", listsci);

        request.setAttribute("tt1", d.getTotalbyProduct(1));
        request.setAttribute("tt2", d.getTotalbyProduct(2));
        request.setAttribute("tt3", d.getTotalbyProduct(3));
        request.setAttribute("tt4", d.getTotalbyProduct(4));
        request.setAttribute("tt5", d.getTotalbyProduct(5));
        request.setAttribute("tt6", d.getTotalbyProduct(6));
        request.setAttribute("tt7", d.getTotalbyProduct(7));
        request.setAttribute("tt8", d.getTotalbyProduct(8));
        request.setAttribute("tt9", d.getTotalbyProduct(9));
        request.setAttribute("tt10", d.getTotalbyProduct(10));
        request.setAttribute("tt11", d.getTotalbyProduct(11));
        request.setAttribute("tt12", d.getTotalbyProduct(12));

        try {
            int namm = Integer.parseInt(nam);
            if (namm != 0) {
                request.setAttribute("t1", d.getTotalPricebyMonthAndYear(1, namm));
                request.setAttribute("t2", d.getTotalPricebyMonthAndYear(2, namm));
                request.setAttribute("t3", d.getTotalPricebyMonthAndYear(3, namm));
                request.setAttribute("t4", d.getTotalPricebyMonthAndYear(4, namm));
                request.setAttribute("t5", d.getTotalPricebyMonthAndYear(5, namm));
                request.setAttribute("t6", d.getTotalPricebyMonthAndYear(6, namm));
                request.setAttribute("t7", d.getTotalPricebyMonthAndYear(7, namm));
                request.setAttribute("t8", d.getTotalPricebyMonthAndYear(8, namm));
                request.setAttribute("t9", d.getTotalPricebyMonthAndYear(9, namm));
                request.setAttribute("t10", d.getTotalPricebyMonthAndYear(10, namm));
                request.setAttribute("t11", d.getTotalPricebyMonthAndYear(11, namm));
                request.setAttribute("t12", d.getTotalPricebyMonthAndYear(12, namm));
            } else {
                request.setAttribute("t1", d.getTotalPricebyMonth(1));
                request.setAttribute("t2", d.getTotalPricebyMonth(2));
                request.setAttribute("t3", d.getTotalPricebyMonth(3));
                request.setAttribute("t4", d.getTotalPricebyMonth(4));
                request.setAttribute("t5", d.getTotalPricebyMonth(5));
                request.setAttribute("t6", d.getTotalPricebyMonth(6));
                request.setAttribute("t7", d.getTotalPricebyMonth(7));
                request.setAttribute("t8", d.getTotalPricebyMonth(8));
                request.setAttribute("t9", d.getTotalPricebyMonth(9));
                request.setAttribute("t10", d.getTotalPricebyMonth(10));
                request.setAttribute("t11", d.getTotalPricebyMonth(11));
                request.setAttribute("t12", d.getTotalPricebyMonth(12));
            }

            request.setAttribute("nam", nam);
        } catch (NumberFormatException e) {
            LOGGER.log(Level.SEVERE, "Error parsing ID: ", e);
        }

        request.getRequestDispatcher("Admin.jsp").forward(request, response);
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
