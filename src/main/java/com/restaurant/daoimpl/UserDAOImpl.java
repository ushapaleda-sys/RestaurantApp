package com.restaurant.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.restaurant.dao.UserDAO;
import com.restaurant.model.User;
import com.restaurant.utility.DBConnection;

public class UserDAOImpl implements UserDAO {

    private Connection con;

    public UserDAOImpl() {
        con = DBConnection.getConnection();
    }

    @Override
    public boolean registerUser(User user) {

        String sql = "INSERT INTO users(name, email, phone, address, username, password) VALUES(?,?,?,?,?,?)";

        try {
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPhone());
            ps.setString(4, user.getAddress());
            ps.setString(5, user.getUsername());
            ps.setString(6, user.getPassword());

            int rows = ps.executeUpdate();
            System.out.println("Inserted rows: " + rows);

            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("REGISTER ERROR: " + e.getMessage());
        }

        return false;
    }
    @Override
    public User login(String username, String password) {

        User user = null;

        String sql = "SELECT * FROM users WHERE username=? AND password=?";

        try {

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                user = new User();

                user.setUserId(rs.getInt("user_id"));
                user.setName(rs.getString("name"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    @Override
    public User getUserById(int userId) {

        User user = null;

        String sql = "SELECT * FROM users WHERE user_id=?";

        try {

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                user = new User();

                user.setUserId(rs.getInt("user_id"));
                user.setName(rs.getString("name"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    @Override
    public boolean updateUser(User user) {

        String sql = "UPDATE users SET name=?, username=?, password=?, email=?, phone=?, address=? WHERE user_id=?";

        try {

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, user.getName());
            ps.setString(2, user.getUsername());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getPhone());
            ps.setString(6, user.getAddress());
            ps.setInt(7, user.getUserId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}