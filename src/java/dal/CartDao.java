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
import model.Shopping_Cart_Item;
import model.Shopping_cart;
import model.TopUser;
import model.Users;

/**
 *
 * @author ngoda
 */
public class CartDao extends DBContext {
    //    public List<Shopping_Cart_Item> getShoppingCartItem() {
//        List<Shopping_Cart_Item> list = new ArrayList<>();
//        String spl = "select * from Product\n"
//                + "where seller = ?;";
//        try {
//            PreparedStatement st = connection.prepareStatement(spl);
//            st.setInt(1, id);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                Product s = new Product(rs.getInt("id"),
//                        rs.getString("name"),
//                        rs.getString("description"),
//                        rs.getFloat("prices"),
//                        rs.getString("img"),
//                        rs.getInt("seller"),
//                        rs.getInt("quantity"),
//                        rs.getInt("product_category_id"));
//
//                list.add(s);
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return list;
//    }
//    public void addCartItem(int quantity, int product_id, float price, int shopping_cart_id) {
//        String spl = "INSERT INTO [dbo].[Shopping_cart_item]\n"
//                + "           ([quantity]\n"
//                + "           ,[product_id]\n"
//                + "           ,[price]\n"
//                + "           ,[shopping_cart_id])\n"
//                + "     VALUES (?,?,?,?);";
//        try {
//            PreparedStatement st = connection.prepareStatement(spl);
//            st.setInt(1, quantity);
//            st.setInt(2, product_id);
//            st.setFloat(3, price);
//            st.setInt(4, shopping_cart_id);
//
//            st.executeUpdate();
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//    }

    public void addOrder(Users c, Cart cart) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        try {
            //add sc iteam
            String sql = "INSERT INTO [dbo].[Shopping_cart]\n"
                    + "           ([total_prices]\n"
                    + "           ,[date]\n"
                    + "           ,[user_id])\n"
                    + "     VALUES (?,?,?);";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setFloat(1, cart.getTotalMoney());
            st.setString(2, date);
            st.setInt(3, c.getId());
            st.executeUpdate();
            //lay ra id cau order vau add
            String sql1 = "select top 1 id from Shopping_cart order by id DESC";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs1 = st1.executeQuery();
            //add vao bang shopping cart
            if (rs1.next()) {
                int oid = rs1.getInt("id");
                for (Item i : cart.getItems()) {
                    String sql2 = "INSERT INTO [dbo].[Shopping_cart_item]\n"
                            + "           ([quantity]\n"
                            + "           ,[product_id]\n"
                            + "           ,[price]\n"
                            + "           ,[shopping_cart_id])\n"
                            + "     VALUES (?,?,?,?);";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, i.getQuantity());
                    st2.setInt(2, i.getProduct().getId());
                    st2.setFloat(3, i.getPrice());
                    st2.setInt(4, oid);
                    st2.executeUpdate();
                }
            }
            //ca nhat lai so luong trong product
            String sql3 = "UPDATE [dbo].[Product]\n"
                    + "   SET [quantity] = [quantity] - ?\n"
                    + " WHERE id = ?;";
            PreparedStatement st3 = connection.prepareStatement(sql3);
            for (Item i : cart.getItems()) {
                st3.setInt(1, i.getQuantity());
                st3.setInt(2, i.getProduct().getId());
                st3.executeUpdate();
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Shopping_cart> getAllShopping_cart() {
        List<Shopping_cart> list = new ArrayList<>();
        String spl = "select * from Shopping_cart";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Shopping_cart s = new Shopping_cart(rs.getInt("id"),
                        rs.getFloat("total_prices"),
                        rs.getString("date"),
                        rs.getInt("user_id"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Shopping_cart> getAll() {
        List<Shopping_cart> list = new ArrayList<>();
        List<Users> user = new ArrayList<>();
        String spl = " select c.id,c.total_prices,c.date,c.user_id,u.last_name from Shopping_cart c join Users u on c.user_id=u.id";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Shopping_cart s = new Shopping_cart(rs.getInt("id"),
                        rs.getFloat("total_prices"),
                        rs.getString("date"),
                        rs.getInt("user_id"), rs.getString("last_name"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<TopUser> getAllShopping_cartTop5() {
        List<TopUser> list = new ArrayList<>();
        String spl = "select top 5 u.last_name, date,total_prices from Shopping_cart as s\n"
                + "join Users as u on s.user_id = u.id\n"
                + "order by total_prices DESC";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                TopUser s = new TopUser(rs.getString("last_name"), rs.getString("date"), rs.getFloat("total_prices"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Shopping_Cart_Item> getAllShopping_Cart_ItemById(String id) {
        List<Shopping_Cart_Item> list = new ArrayList<>();
        String spl = " select c.id,c.quantity,c.product_id,c.price,c.shopping_cart_id,u.name from Shopping_Cart_Item c join Product u on c.product_id=u.id where shopping_cart_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Shopping_Cart_Item s = new Shopping_Cart_Item(rs.getInt("id"), rs.getInt("quantity"),
                        rs.getInt("product_id"), rs.getFloat("price"), rs.getInt("shopping_cart_id"), rs.getString("name"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Shopping_Cart_Item> getOrderByUserID(int id) {
        List<Shopping_Cart_Item> list = new ArrayList<>();
        String spl = "select c.id, s.total_prices,c.quantity, p.name, s.date,s.user_id from [Shopping_cart_item] c \n"
                + "join [Product] p on c.product_id= p.id \n"
                + "join [Shopping_cart] s on c.shopping_cart_id=s.id\n"
                + "where s.user_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Shopping_Cart_Item s = new Shopping_Cart_Item(rs.getInt(1), rs.getFloat(2),rs.getInt(3),rs.getString(4),rs.getDate(5),rs.getInt(6));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Shopping_Cart_Item> getAllShopping_Cart_Item() {
        List<Shopping_Cart_Item> list = new ArrayList<>();
        String spl = "select * from Shopping_Cart_Item";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Shopping_Cart_Item s = new Shopping_Cart_Item(rs.getInt("id"), rs.getInt("quantity"),
                        rs.getInt("product_id"), rs.getFloat("price"), rs.getInt("shopping_cart_id"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //thong ke
    public int getTotalPricebyMonth(int month) {
        int x = 0;
        String spl = "select sum([total_prices])\n"
                + "from [dbo].[Shopping_cart]\n"
                + "where MONTH(date) = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, month);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                x = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return x;
    }

    public int getTotalbyProduct(int month) {
        int x = 0;
        String spl = "select count(s2.product_id)\n"
                + "from [dbo].[Shopping_cart] as s1\n"
                + "join Shopping_cart_item as s2 on s1.id = s2.shopping_cart_id\n"
                + "where MONTH(s1.date) = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, month);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                x = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return x;
    }

    public int getTotalbyProductAndYear(int month, int year) {
        int x = 0;
        String spl = "select count(s2.product_id)\n"
                + "from [dbo].[Shopping_cart] as s1\n"
                + "join Shopping_cart_item as s2 on s1.id = s2.shopping_cart_id\n"
                + "where MONTH(s1.date) = ? and YEAR(date) = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, month);
            st.setInt(2, year);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                x = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return x;
    }

    public int getTotalPricebyMonthAndYear(int month, int year) {
        int x = 0;
        String spl = "select sum([total_prices])\n"
                + "from [dbo].[Shopping_cart]\n"
                + "where MONTH(date) = ? and YEAR(date) = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, month);
            st.setInt(2, year);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                x = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return x;
    }

    public static void main(String[] args) {
        CartDao c = new CartDao();
        List<Shopping_Cart_Item> List = c.getOrderByUserID(1010);
        for (Shopping_Cart_Item shopping_Cart_Item : List) {
            System.out.println(shopping_Cart_Item.toString());
        }
    }
}
