/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Cart;
import model.Item;
import model.Product;

/**
 *
 * @author ACER
 */
@WebServlet(name = "ProcessServlet", urlPatterns = {"/process"})
public class ProcessServlet extends HttpServlet {
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
            out.println("<title>Servlet ProcessServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProcessServlet at " + request.getContextPath() + "</h1>");
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
        ProductDao d = new ProductDao();
        List<Product> list = d.getAll();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }

        Cart cart = new Cart(txt, list);
        String num_raw = request.getParameter("num");
        String id_raw = request.getParameter("id");
        int id, num = 0;
        
        try {
            id = Integer.parseInt(id_raw);
            Product p = d.getProductById(id);
            int numStore = p.getQuantity();
            num = Integer.parseInt(num_raw);

            if ((num == -1) && (cart.getQuantityById(id) <= 1)) {
                cart.removeItem(id);
            } else {
                if ((num == 1) && cart.getQuantityById(id) >= numStore) {
                    num = 0;
                }
                float price = p.getPrices();
                Item t = new Item(p, num, price);
                cart.addItem(t);
            }
        } catch (NumberFormatException e) {
            LOGGER.log(Level.SEVERE, "Error parsing ID: ", e);
        }

        List<Item> items = cart.getItems();
        txt = "";
        if (items.size() > 0) {
            txt = items.get(0).getProduct().getId() + ":"
                    + items.get(0).getQuantity();
            for (int i = 1; i < items.size(); i++) {
                txt += "/" + items.get(i).getProduct().getId() + ":"
                        + items.get(i).getQuantity();
            }
        }
        Cookie c = new Cookie("cart", txt);
        c.setMaxAge(60 * 60 * 24 * 2);
        response.addCookie(c);
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("Cart.jsp").forward(request, response);
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
        ProductDao d = new ProductDao();
        List<Product> list = d.getAll();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }

        String id = request.getParameter("id");

        String[] ids = txt.split("/");
        String out = "";
        for (int i = 0; i < ids.length; i++) {
            String[] s = ids[i].split(":");
            if (!s[0].equals(id)) {
                if (out.isEmpty()) {
                    out = ids[i];
                } else {
                    out += "/" + ids[i];
                }
            }
        }

        if (!out.isEmpty()) {
            Cookie c = new Cookie("cart", out);
            c.setMaxAge(60 * 60 * 2 * 24);
            response.addCookie(c);
        }

        Cart cart = new Cart(out, list);
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("Cart.jsp").forward(request, response);

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
