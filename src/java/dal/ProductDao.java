/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.CountProduct;
import model.Item;
import model.Product;
import model.Product_Category;
import model.Shopping_Cart_Item;
import model.Shopping_cart;
import model.TopUser;
import model.Users;

/**
 *
 *
 * @author ACER
 */
public class ProductDao extends DBContext {

    public List<Product> getAll() {
        List<Product> list = new ArrayList<>();
        String spl = "select * from Product";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product s = new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getFloat("prices"),
                        rs.getString("img"),
                        rs.getInt("seller"),
                        rs.getInt("quantity"),
                        rs.getInt("product_category_id"));

                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Product> getListByPage(List<Product> list, int start, int end) {
        List<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public Product getNewProduct() {
        String spl = "select top 1 * from Product\n"
                + "order by id DESC";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product s = new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getFloat("prices"),
                        rs.getString("img"),
                        rs.getInt("seller"),
                        rs.getInt("quantity"),
                        rs.getInt("product_category_id"));
                return s;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Product getOldProduct() {
        String spl = "select top 1 * from Product\n"
                + "order by id";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product s = new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getFloat("prices"),
                        rs.getString("img"),
                        rs.getInt("seller"),
                        rs.getInt("quantity"),
                        rs.getInt("product_category_id"));
                return s;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Product getProductById(int id) {
        String spl = "select * from Product\n"
                + "where id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product s = new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getFloat("prices"),
                        rs.getString("img"),
                        rs.getInt("seller"),
                        rs.getInt("quantity"),
                        rs.getInt("product_category_id"));
                return s;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    

    
    public List<Product> searchByName(String name) {
        List<Product> list = new ArrayList<>();
        String spl = "select * from Product\n"
                + "where [name] like ?;";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, "%" + name + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product s = new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getFloat("prices"),
                        rs.getString("img"),
                        rs.getInt("seller"),
                        rs.getInt("quantity"),
                        rs.getInt("product_category_id"));

                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> searchByPrice(String from, String to) {
        List<Product> list = new ArrayList<>();
        String spl = "SELECT * FROM Product\n"
                + "WHERE prices BETWEEN ? AND ?;";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, from);
            st.setString(2, to);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product s = new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getFloat("prices"),
                        rs.getString("img"),
                        rs.getInt("seller"),
                        rs.getInt("quantity"),
                        rs.getInt("product_category_id"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> selectTop5Product() {
        List<Product> list = new ArrayList<>();
        List<CountProduct> list2 = new ArrayList<>();
        String spl = "SELECT top 5 product_id, COUNT(product_id) AS so_lan_xuat_hien\n"
                + "FROM Shopping_cart_item\n"
                + "GROUP BY product_id\n"
                + "ORDER BY COUNT(product_id) Desc;";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                CountProduct s = new CountProduct(rs.getInt("product_id"), rs.getInt("so_lan_xuat_hien"));
                list2.add(s);
            }
            if (!list2.isEmpty() && (list2.size() != 0)) {
                for (CountProduct cc : list2) {
                    String spl1 = "select * from Product where id = ?";
                    PreparedStatement st1 = connection.prepareStatement(spl1);
                    st1.setInt(1, cc.getProduct_id());
                    ResultSet rs1 = st1.executeQuery();
                    while (rs1.next()) {
                        Product p = new Product(rs1.getInt("id"),
                                rs1.getString("name"),
                                rs1.getString("description"),
                                rs1.getFloat("prices"),
                                rs1.getString("img"),
                                rs1.getInt("seller"),
                                rs1.getInt("quantity"),
                                rs1.getInt("product_category_id"));
                        list.add(p);
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getBySeller(int id) {
        List<Product> list = new ArrayList<>();
        String spl = "select * from Product\n"
                + "where seller = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product s = new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getFloat("prices"),
                        rs.getString("img"),
                        rs.getInt("seller"),
                        rs.getInt("quantity"),
                        rs.getInt("product_category_id"));

                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void deleteProduct(int id) {
        String spl = "delete from product\n"
                + "where id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertProduct(String name, String description, Double price, String image, int quantity,
            int category, int sid) {
        String spl = "INSERT INTO [dbo].[Product]\n"
                + "           ([name]\n"
                + "           ,[img]\n"
                + "           ,[description]\n"
                + "           ,[prices]\n"
                + "           ,[quantity]\n"
                + "           ,[product_category_id]\n"
                + "           ,[seller])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?);";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, name);
            st.setString(2, image);
            st.setString(3, description);
            st.setDouble(4, price);
            st.setInt(5, quantity);
            st.setInt(6, category);
            st.setInt(7, sid);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    
    public void editProduct(String name, String img, String description,
            Float prices, int quantity, int product_category_id, int pid) {
        String spl = "UPDATE [dbo].[Product]\n"
                + "   SET [name] = ?,\n"
                + "      [img] = ?,\n"
                + "      [description] = ?,\n"
                + "      [prices] = ?,\n"
                + "      [quantity] = ?,\n"
                + "      [product_category_id] = ?\n"
                + " WHERE id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, name);
            st.setString(2, img);
            st.setString(3, description);
            st.setFloat(4, prices);
            st.setInt(5, quantity);
            st.setInt(6, product_category_id);
            st.setInt(7, pid);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public static void main(String[] args) {
        ProductDao p = new ProductDao();
        p.insertProduct("name", "des", 20.2, "img", 1, 1, 1);
    }
    
    
    
}
