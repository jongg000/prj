/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDao;
import dal.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Users;

/**
 *
 * @author ACER
 */
@WebServlet(name = "AcountServlet", urlPatterns = {"/acount"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)
public class AcountServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            UserDao d = new UserDao();
            List<Users> list = d.getAllAcc();
            request.setAttribute("userall", list);
            request.getRequestDispatcher("ManagerAcc.jsp").forward(request, response);
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
        String action = request.getParameter("action");
        UserDao o = new UserDao();
        List<Users> list = o.getAllAcc();
        if ("add".equals(action)) {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String first_name = request.getParameter("first_name");
            String last_name = request.getParameter("last_name");
            String role = request.getParameter("role");
            String address = request.getParameter("address");
            
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
                o.insertUsers(first_name, last_name, email, password, role, uploadDirectoryForSQL, address);
            }
        } else if ("edit".equals(action)) {
            String id = request.getParameter("id");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String first_name = request.getParameter("first_name");
            String last_name = request.getParameter("last_name");
            String role = request.getParameter("role");
            String address = request.getParameter("address");
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
                o.updateUsers(id, first_name, last_name, email, password, role, uploadDirectoryForSQL, address);
            }
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            o.deleteAcc(id);
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
