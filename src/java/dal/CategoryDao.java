/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Product;
import model.Product_Category;
import model.Shopping_Cart_Item;
import model.Users;

/**
 *
 * @author ACER
 */
public class CategoryDao extends DBContext {

    public List<Product_Category> getCate() {
        List<Product_Category> list = new ArrayList<>();
        String spl = "select * from Product_Category";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product_Category s = new Product_Category(rs.getInt("id"),
                        rs.getString("name"));

                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Product_Category getCategoryById(String id) {
        String spl = "select * from Product_Category where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product_Category s = new Product_Category(rs.getInt("id"),
                        rs.getString("name"));

                return s;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateCategory(String id, String name) {
        String spl = "UPDATE [dbo].[Product_category]\n"
                + "   SET [name] = ?\n"
                + " WHERE id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, name);
            st.setString(2, id);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Product_Category checkCategory(String name) {
        String sql = "select * from Product_category\n"
                + "where name like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product_Category p = new Product_Category(rs.getInt("id"), rs.getString("name"));
                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public int getCategoryID(String name) {
        int result = 0;
        String sql = "select * from Product_category\n"
                + "where name like ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                result = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return result;
    }
    public int getNewCate() {
        int result = 0;
        String spl = "select top 1[id]  from Product_category order by id DESC";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                result = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return result;
    }
    public void addCategory(String name) {
        String spl = "INSERT INTO [dbo].[Product_category]\n"
                + "           ([name])\n"
                + "     VALUES (?);";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, name);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Product> searchByCid(int id) {
        List<Product> list = new ArrayList<>();
        String spl = "select * from Product\n"
                + "where product_category_id = ?";
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

    public List<Product> searchListByIdCategory(String id) {
        List<Product> list = new ArrayList<>();
        String spl = "select p.id\n"
                + "      ,p.name\n"
                + "      ,[img]\n"
                + "      ,[description]\n"
                + "      ,[prices]\n"
                + "      ,[quantity]\n"
                + "      ,[product_category_id]\n"
                + "      ,[seller] from Product as p\n"
                + "join Product_category as c on p.product_category_id = c.id\n"
                + "where c.id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, id);
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

    public void deleteCategory(String id) {
        String spl = "DELETE FROM [dbo].[Product_category]\n"
                + "      WHERE id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
//    public static void main(String[] args) throws SQLException{
//        CategoryDao o = new CategoryDao();
//        System.out.println(o.getCategoryID("Áo"));
//    }

}
