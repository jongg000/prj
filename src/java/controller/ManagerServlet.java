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
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import model.Product;
import model.Product_Category;
import model.Users;

/**
 *
 * @author ACER
 */
@WebServlet(name = "ManagerServlet", urlPatterns = {"/manager"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)
public class ManagerServlet extends HttpServlet {

    public static final String SAVE_DIRECTORY = "image";

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
        Users a = (Users) session.getAttribute("acc");
        int id = a.getId();
        CategoryDao d = new CategoryDao();
        ProductDao p = new ProductDao();

        List<Product> list = p.getBySeller(id);
        List<Product_Category> listc = d.getCate();

        request.setAttribute("listc", listc);
        request.setAttribute("listP", list);
        request.getRequestDispatcher("ManagerProduct.jsp").forward(request, response);
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
        String action = request.getParameter("action");
        ProductDao p = new ProductDao();
        List<model.Product> list = p.getAll();
        HttpSession session = request.getSession(false);
        Users a = (Users) session.getAttribute("acc");
        int id = a.getId();
        if ("add".equals(action)) {
            String name = request.getParameter("name");
            String price1 = request.getParameter("price");
            String quantity1 = request.getParameter("quantity");
            String category1 = request.getParameter("productid");
            Double price = Double.parseDouble(price1);
            int quantity = Integer.parseInt(quantity1);
            String description = request.getParameter("description");
            int idCategory = Integer.parseInt(category1);
            String uploadDirectory = request.getServletContext().getRealPath("") + File.separator + SAVE_DIRECTORY; //lấy ra đường dẫn của project sau đó vào thư mục Avatar_user_upload
            Part filePart = request.getPart("img"); //lấy ra file theo tên field(trong form html) là file
            // Tạo thư mục nếu nó không tồn tại
            Path uploadPath = Paths.get(uploadDirectory);
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }
            if (filePart != null) {
                String fileName = filePart.getSubmittedFileName(); //tạo tên file VD: HE186719_avatar_IMG7073.jpg
                String filePath = uploadDirectory + File.separator + fileName; //File.separator là tạo ra dấu \ (tạo đường dẫn cho file này)
                String uploadDirectoryForSQL = SAVE_DIRECTORY + File.separator + fileName; //tạo đường dẫn khi lưu vào database(chỉ cần tên folder và tên file)
                filePart.write(filePath); //lưu file vào thư mục theo đường dẫn là filePath
                p.insertProduct(name, description, price, uploadDirectoryForSQL, quantity, idCategory, id);
            }
        } else if ("edit".equals(action)) {
            String pid1 = request.getParameter("id");
            String name = request.getParameter("name");
            String price1 = request.getParameter("price");
            String quantity1 = request.getParameter("quantity");
            String description = request.getParameter("description");
            String idCategory1 = request.getParameter("select");
            Float price = Float.parseFloat(price1);
            int quantity = Integer.parseInt(quantity1);
            int idCategory = Integer.parseInt(idCategory1);
            int pid = Integer.parseInt(pid1);
            String uploadDirectory = request.getServletContext().getRealPath("") + File.separator + SAVE_DIRECTORY; //lấy ra đường dẫn của project sau đó vào thư mục Avatar_user_upload
            Part filePart = request.getPart("img"); //lấy ra file theo tên field(trong form html) là file
            // Tạo thư mục nếu nó không tồn tại
            Path uploadPath = Paths.get(uploadDirectory);
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }
            if (filePart != null) {
                String fileName = filePart.getSubmittedFileName(); //tạo tên file VD: HE186719_avatar_IMG7073.jpg
                String filePath = uploadDirectory + File.separator + fileName; //File.separator là tạo ra dấu \ (tạo đường dẫn cho file này)
                String uploadDirectoryForSQL = SAVE_DIRECTORY + File.separator + fileName; //tạo đường dẫn khi lưu vào database(chỉ cần tên folder và tên file)
                filePart.write(filePath); //lưu file vào thư mục theo đường dẫn là filePath
                p.editProduct(name, uploadDirectoryForSQL, description, price, quantity, idCategory, pid);
            }
        } else if ("delete".equals(action)) {
            int pid = Integer.parseInt(request.getParameter("id"));
            p.deleteProduct(pid);
        }
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
