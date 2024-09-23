/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.CategoryDao;
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
import model.Cart;
import model.Item;
import model.Product_Category;

/**
 *
 * @author ngoda
 */
@WebServlet(name="HomeController", urlPatterns={"/homesv"} )
public class HomeController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        CategoryDao d = new CategoryDao();
        ProductDao p = new  ProductDao();
        //lay ra all product
        List<model.Product> list = p.getAll();

        //lay ra all category
        List<Product_Category> listc = d.getCate();
        

        //lay ra san pham moi nhat
        model.Product last = p.getNewProduct();
        model.Product old = p.getOldProduct();
        model.Product sp = p.getProductById(57);
        //cookies
        Cookie[] arr = request.getCookies();
        String txt = "";
        if(arr != null){
            for (Cookie o : arr) {
                if(o.getName().equals("cart")){
                    txt += o.getValue();
                }
            }
        }
        Cart cart = new Cart(txt, list);
        List<Item> listItem = cart.getItems();
        int n;
        if (listItem != null) {
            n = listItem.size();
        } else {
            n = 0;
        }
        request.setAttribute("size", n);
        //cookies

        //phan trang
        int page, numperpage = 9;
        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int nn = list.size();
        int start, end;
        start = (page - 1) * numperpage;
        end = Math.min(page * numperpage, nn);
        int numpage = ((nn % numperpage == 0) ? (nn / numperpage) : (nn / numperpage + 1));

        List<model.Product> list2 = p.getListByPage(list, start, end);

        request.setAttribute("page", page);
        request.setAttribute("numpage", numpage);
        request.setAttribute("nn", nn);
        //phan trang
        
        request.setAttribute("list", list);
        request.setAttribute("listc", listc);
        request.setAttribute("list", list2);
        request.setAttribute("last", last);
        request.setAttribute("old", old);
        request.setAttribute("sp", sp);
        request.getRequestDispatcher("homee.jsp").forward(request, response);
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
