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
import model.Users;
import java.security.SecureRandom;

/**
 *
 * @author ngoda
 */
public class UserDao extends DBContext {

    private static final String UPPERCASE = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    private static final String LOWERCASE = "abcdefghijklmnopqrstuvwxyz";
    private static final String DIGITS = "0123456789";
    private static final String SPECIAL_CHARACTERS = "!@#$%^&*()-_=+[]{}|;:'\",.<>?/`~";
    private static final String ALL_CHARACTERS = UPPERCASE + LOWERCASE + DIGITS + SPECIAL_CHARACTERS;
    private static final SecureRandom RANDOM = new SecureRandom();

    public static String generatePassword(int length) {
        if (length < 4) {
            throw new IllegalArgumentException("Password length must be at least 4 characters");
        }

        StringBuilder password = new StringBuilder(length);

        // Ensure the password contains at least one character from each character set
        password.append(UPPERCASE.charAt(RANDOM.nextInt(UPPERCASE.length())));
        password.append(LOWERCASE.charAt(RANDOM.nextInt(LOWERCASE.length())));
        password.append(DIGITS.charAt(RANDOM.nextInt(DIGITS.length())));
        password.append(SPECIAL_CHARACTERS.charAt(RANDOM.nextInt(SPECIAL_CHARACTERS.length())));

        // Fill the remaining length with random characters from all sets
        for (int i = 4; i < length; i++) {
            password.append(ALL_CHARACTERS.charAt(RANDOM.nextInt(ALL_CHARACTERS.length())));
        }

        // Shuffle the characters to avoid a predictable pattern
        return shuffleString(password.toString());
    }

    private static String shuffleString(String input) {
        char[] characters = input.toCharArray();
        for (int i = characters.length - 1; i > 0; i--) {
            int j = RANDOM.nextInt(i + 1);
            char temp = characters[i];
            characters[i] = characters[j];
            characters[j] = temp;
        }
        return new String(characters);
    }

    public void changePass(int id, String pass) {
        String spl = "UPDATE [dbo].[Users] set pass =? where id= ?  ";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, pass);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Users getAccount(String email, String pass) {
        String sql = "select * from Users\n"
                + "where email = ? and pass = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Users s = new Users(rs.getInt("id"), rs.getString("first_name"), rs.getString("last_name"),
                        rs.getString("email"), rs.getString("pass"), rs.getInt("role"),
                        rs.getString("img"), rs.getString("adress"));
                return s;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Users> getAllAcc() {
        List<Users> list = new ArrayList<>();
        String spl = "select * from Users";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Users s = new Users(rs.getInt("id"), rs.getString("first_name"), rs.getString("last_name"),
                        rs.getString("email"), rs.getString("pass"), rs.getInt("role"),
                        rs.getString("img"), rs.getString("adress"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Users getUsersById(int id) {
        String spl = "select * from Users where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Users u = new Users(rs.getInt("id"), rs.getString("first_name"),
                        rs.getString("last_name"), rs.getString("email"),
                        rs.getString("pass"), rs.getInt("role"),
                        rs.getString("img"), rs.getString("adress"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void insertUsers(String first_name, String last_name, String email,
            String pass, String role, String img, String adress) {
        String spl = "insert into Users (first_name,last_name,email,pass,role,img,adress) values (?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, first_name);
            st.setString(2, last_name);
            st.setString(3, email);
            st.setString(4, pass);
            st.setString(5, role);
            st.setString(6, img);
            st.setString(7, adress);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateUsers(String cid, String first_name, String last_name, String email,
            String pass, String role, String img, String adress) {
        String spl = "UPDATE [dbo].[Users]\n"
                + "   SET [first_name] = ?\n"
                + "      ,[last_name] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[pass] = ?\n"
                + "      ,[role] = ?\n"
                + "      ,[img] = ?\n"
                + "      ,[adress] = ?\n"
                + " WHERE id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, first_name);
            st.setString(2, last_name);
            st.setString(3, email);
            st.setString(4, pass);
            st.setString(5, role);
            st.setString(6, img);
            st.setString(7, adress);
            st.setString(8, cid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void editUsers(String fname, String lname, String email, String pass,
            String img, String adress, int id) {
        String spl = "UPDATE [dbo].[Users]\n"
                + "   SET [first_name] = ?\n"
                + "      ,[last_name] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[pass] = ?\n"
                + "      ,[img] = ?\n"
                + "      ,[adress] = ?\n"
                + " WHERE id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, fname);
            st.setString(2, lname);
            st.setString(3, email);
            st.setString(4, pass);
            st.setString(5, img);
            st.setString(6, adress);
            st.setInt(7, id);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Users login(String u, String p) {
        String spl = "select * from Users\n"
                + "where email = ?\n"
                + "and pass = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, u);
            st.setString(2, p);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Users user = new Users(rs.getInt("id"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("email"),
                        rs.getString("pass"),
                        rs.getInt("role"),
                        rs.getString("img"), rs.getString("adress"));
                return user;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Users checkExist(String u) {
        String spl = "select * from Users\n"
                + "where email = ?\n";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, u);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Users user = new Users(rs.getInt("id"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("email"),
                        rs.getString("pass"),
                        rs.getInt("role"),
                        rs.getString("img"), rs.getString("adress"));
                return user;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void signUp(String u, String p, String name) {
        String spl = "INSERT INTO [dbo].[Users]\n"
                + "           ([first_name]\n"
                + "           ,[last_name]\n"
                + "           ,[email]\n"
                + "           ,[pass]\n"
                + "           ,[role])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,0)";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, name);
            st.setString(2, name);
            st.setString(3, u);
            st.setString(4, p);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteAcc(int id) {
        String spl = "delete from Users\n"
                + "where id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
//    public static void main(String[] args) throws SQLException{
//        UserDao o = new UserDao();
//        o.deleteAcc(1016);
//    }
//    

}
