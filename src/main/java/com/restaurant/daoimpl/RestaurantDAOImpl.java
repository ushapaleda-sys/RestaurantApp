package com.restaurant.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.restaurant.dao.RestaurantDAO;
import com.restaurant.model.Restaurant;
import com.restaurant.utility.DBConnection;

public class RestaurantDAOImpl implements RestaurantDAO {

    private Connection con;

    public RestaurantDAOImpl() {
        con = DBConnection.getConnection();
    }

    @Override
    public List<Restaurant> getAllRestaurants() {

        List<Restaurant> list = new ArrayList<>();

        String sql = "SELECT * FROM restaurant";

        try {

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Restaurant r = new Restaurant();

                r.setRestaurantId(rs.getInt("restaurant_id"));
                r.setName(rs.getString("restaurant_name"));
                r.setCuisineType(rs.getString("cuisine_type"));
                r.setAddress(rs.getString("address"));
                r.setRating(rs.getDouble("rating"));
                r.setImagePath(rs.getString("image_path"));

                list.add(r);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public Restaurant getRestaurantById(int restaurantId) {

        Restaurant r = null;

        String sql = "SELECT * FROM restaurant WHERE restaurant_id=?";

        try {

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, restaurantId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                r = new Restaurant();

                r.setRestaurantId(rs.getInt("restaurant_id"));
                r.setName(rs.getString("restaurant_name"));
                r.setCuisineType(rs.getString("cuisine_type"));
                r.setAddress(rs.getString("address"));
                r.setRating(rs.getDouble("rating"));
                r.setImagePath(rs.getString("image_path"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return r;
    }

    @Override
    public List<Restaurant> searchRestaurant(String keyword) {

        List<Restaurant> list = new ArrayList<>();

        String sql = "SELECT * FROM restaurant WHERE restaurant_name LIKE ? OR cuisine_type LIKE ?";


        try {

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Restaurant r = new Restaurant();

                r.setRestaurantId(rs.getInt("restaurant_id"));
                r.setName(rs.getString("restaurant_name"));
                r.setCuisineType(rs.getString("cuisine_type"));
                r.setAddress(rs.getString("address"));
                r.setRating(rs.getDouble("rating"));
                r.setImagePath(rs.getString("image_path"));

                list.add(r);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}