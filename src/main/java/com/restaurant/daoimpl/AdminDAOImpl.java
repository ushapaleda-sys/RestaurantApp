package com.restaurant.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.restaurant.dao.AdminDAO;
import com.restaurant.model.Admin;
import com.restaurant.utility.DBConnection;

public class AdminDAOImpl implements AdminDAO {

    private Connection con;

    public AdminDAOImpl() {
        con = DBConnection.getConnection();
    }

    @Override
    public Admin login(String username, String password) {

        Admin admin = null;

        String sql = "SELECT * FROM admin WHERE username=? AND password=?";

        try {

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                admin = new Admin();

                admin.setAdminId(rs.getInt("admin_id"));
                admin.setUsername(rs.getString("username"));
                admin.setPassword(rs.getString("password"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return admin;
    }
}