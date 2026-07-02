package com.restaurant.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.restaurant.dao.MenuDAO;
import com.restaurant.model.Menu;
import com.restaurant.utility.DBConnection;

public class MenuDAOImpl implements MenuDAO {

    private Connection con;

    public MenuDAOImpl() {
        con = DBConnection.getConnection();
    }

    @Override
    public List<Menu> getMenuByRestaurantId(int restaurantId) {

        List<Menu> menuList = new ArrayList<>();

        String sql = "SELECT * FROM menu WHERE restaurant_id=?";

        try {

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, restaurantId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                Menu menu = new Menu();

                menu.setMenuId(rs.getInt("menu_id"));
                menu.setName(rs.getString("name"));
                menu.setDescription(rs.getString("description"));
                menu.setPrice(rs.getDouble("price"));
                menu.setRestaurantId(rs.getInt("restaurant_id"));
                menu.setImagePath(rs.getString("image_path"));

                menuList.add(menu);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return menuList;
    }

    @Override
    public Menu getMenuById(int menuId) {

        Menu menu = null;

        String sql = "SELECT * FROM menu WHERE menu_id=?";

        try {

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, menuId);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                menu = new Menu();

                menu.setMenuId(rs.getInt("menu_id"));
                menu.setName(rs.getString("name"));
                menu.setDescription(rs.getString("description"));
                menu.setPrice(rs.getDouble("price"));
                menu.setRestaurantId(rs.getInt("restaurant_id"));
                menu.setImagePath(rs.getString("image_path"));
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return menu;
    }

    @Override
    public List<Menu> searchMenuByRestaurantId(int restaurantId, String keyword) {

        List<Menu> menuList = new ArrayList<>();

        String sql = "SELECT * FROM menu WHERE restaurant_id=? AND (name LIKE ? OR description LIKE ?)";

        try {

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, restaurantId);
            ps.setString(2, "%" + keyword + "%");
            ps.setString(3, "%" + keyword + "%");

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                Menu menu = new Menu();

                menu.setMenuId(rs.getInt("menu_id"));
                menu.setName(rs.getString("name"));
                menu.setDescription(rs.getString("description"));
                menu.setPrice(rs.getDouble("price"));
                menu.setRestaurantId(rs.getInt("restaurant_id"));
                menu.setImagePath(rs.getString("image_path"));

                menuList.add(menu);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return menuList;
    }

    @Override
    public List<Menu> getMenuByCategory(int restaurantId, String category) {

        List<Menu> menuList = new ArrayList<>();

        String sql = "SELECT * FROM menu WHERE restaurant_id=? AND name LIKE ?";

        try {

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, restaurantId);
            ps.setString(2, "%" + category + "%");

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                Menu menu = new Menu();

                menu.setMenuId(rs.getInt("menu_id"));
                menu.setName(rs.getString("name"));
                menu.setDescription(rs.getString("description"));
                menu.setPrice(rs.getDouble("price"));
                menu.setRestaurantId(rs.getInt("restaurant_id"));
                menu.setImagePath(rs.getString("image_path"));

                menuList.add(menu);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return menuList;
    }
}