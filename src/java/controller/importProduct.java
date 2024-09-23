package controller;

import dal.CategoryDao;
import dal.ProductDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import model.Users;

@WebServlet(name = "importProduct", urlPatterns = {"/import"})
@MultipartConfig // Set max file size to 5MB
public class importProduct extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Hàm để phân tích dòng CSV và giữ nguyên dấu phẩy
    private ArrayList<String> parseCsvLine(String line) {
        ArrayList<String> fields = new ArrayList<>();
        StringBuilder field = new StringBuilder();
        boolean inQuotes = false;
        for (char c : line.toCharArray()) {
            if (c == '"') {
                inQuotes = !inQuotes;
            } else if (c == ',' && !inQuotes) {
                fields.add(field.toString());
                field.setLength(0); // Reset StringBuilder
            } else {
                field.append(c);
            }
        }
        // Add last field
        fields.add(field.toString());
        return fields;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Part filePart = request.getPart("file");

            if (filePart == null || filePart.getSize() == 0) {
                out.println("<p>No file uploaded!</p>");
                return;
            }

            try (InputStream fileContent = filePart.getInputStream();
                 BufferedReader reader = new BufferedReader(new InputStreamReader(fileContent, StandardCharsets.UTF_8))) {

                ProductDao p = new ProductDao();
                CategoryDao c = new CategoryDao();
                HttpSession session = request.getSession(false);
                Users a = (Users) session.getAttribute("acc");
                int id = a.getId();
                String line;
                boolean isFirstLine = true;
                while ((line = reader.readLine()) != null) {
                    if (isFirstLine) {
                        isFirstLine = false;
                        continue;
                    }
                    ArrayList<String> fields = parseCsvLine(line);

                    Double price = Double.parseDouble(fields.get(2));
                    int quantity = Integer.parseInt(fields.get(3));
                    
                    if (c.checkCategory(fields.get(4)) !=null) {
                        int category = c.getCategoryID(fields.get(4));
                        p.insertProduct(fields.get(0), fields.get(1), price, "img", quantity, category , id);
                    }
                    else {
                        c.addCategory(fields.get(4));
                        int category = c.getNewCate();
                        p.insertProduct(fields.get(0), fields.get(1), price, "img", quantity, category , id);
                    }
                    
               
                }

               response.sendRedirect("product");
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p>Error processing file: " + e.getMessage() + "</p>");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
