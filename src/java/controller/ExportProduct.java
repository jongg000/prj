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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ngoda
 */
@WebServlet(name = "ExportProduct", urlPatterns = {"/export"})
public class ExportProduct extends HttpServlet {
    
    private static final long serialVersionUID = 1L; // cơ chế tuần tự hóa của java

    private String escapeCsv(String data) {
        // Kiểm tra nếu dữ liệu chứa dấu phẩy, dấu ngoặc kép, hoặc ký tự xuống dòng
        if (data.contains(",") || data.contains("\"") || data.contains("\n") || data.contains("\r")) {
            // Thay thế tất cả dấu ngoặc kép bằng hai dấu ngoặc kép
            data = data.replace("\"", "\"\"");
            // Bao bọc dữ liệu bằng dấu ngoặc kép
            data = "\"" + data + "\"";
        }
        return data;
    }

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
        // thiết lập nội dung phản hồi là csv
        response.setContentType("text/csv; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Content-Disposition", "attachment; filename=List_Product.csv");
        try (PrintWriter out = new PrintWriter(new OutputStreamWriter(response.getOutputStream(), "UTF-8"), true)) {
            HttpSession session = request.getSession(false);
          //  if (session != null && (boolean) session.getAttribute("acc") == true && ((String) session.getAttribute("role")).equals("2") || ((String) session.getAttribute("role")).equals("1")) {
      //          if (request.getParameter("export-btn") != null && request.getParameter("export-btn").equals("exportCSV")) {
                    //byte order mark giúp chương trình excel nhận diện đúng ecoding của csv là utf-8
                    ProductDao p = new ProductDao();
                    List<model.Product> list = p.getAll();
                    out.write('\uFEFF');
                    // Ghi tiêu đề các cột
                    out.println("ProductID,Product name,Description,Price,Quantities");
//                    for (Student student : listStu) {
//                        out.println(escapeCsv(student.getStudent_id()) + "," + escapeCsv(student.getUsername()) + "," + escapeCsv(student.getFull_name()) + "," + escapeCsv(student.getDob()) + "," + escapeCsv(student.getGender())
//                                + "," + escapeCsv(student.getEmail()) + "," + escapeCsv(student.getPhone_number()) + "," + escapeCsv(student.getAddress()) + "," + escapeCsv(student.getBranch_name())
//                                + "," + escapeCsv(student.getMajor_name()) + "," + escapeCsv(student.getRegistration_date()) + "," + escapeCsv(student.getStatus()));
//                    }
                    for (model.Product product : list) {
                        out.println(escapeCsv(product.getId()+"")+ "," 
                                + escapeCsv(product.getName()) + "," 
                                + escapeCsv(product.getDescription()) + "," 
                                + escapeCsv(product.getPrices()+"")+ "," + escapeCsv(product.getQuantity()+"") );
                    }
              //  }
          //  }
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
