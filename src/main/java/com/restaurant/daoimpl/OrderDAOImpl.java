package com.restaurant.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.restaurant.dao.OrderDAO;
import com.restaurant.model.Order;
import com.restaurant.utility.DBConnection;

public class OrderDAOImpl implements OrderDAO {

    private Connection con;

    public OrderDAOImpl() {
        con = DBConnection.getConnection();
    }

    @Override
    public int placeOrder(Order order) {

        int orderId = 0;

        String sql = "INSERT INTO orders(user_id,restaurant_id,total_amount,payment_method,status) VALUES(?,?,?,?,?)";

        try {

            PreparedStatement ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);

            ps.setInt(1, order.getUserId());
            ps.setInt(2, order.getRestaurantId());
            ps.setDouble(3, order.getTotalAmount());
            ps.setString(4, order.getPaymentMethod());
            ps.setString(5, order.getStatus());

            int rows = ps.executeUpdate();

            if (rows > 0) {

                ResultSet rs = ps.getGeneratedKeys();

                if (rs.next()) {
                    orderId = rs.getInt(1);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orderId;
    }

    @Override
    public List<Order> getOrdersByUser(int userId) {

        List<Order> orders = new ArrayList<>();

        String sql = "SELECT * FROM orders WHERE user_id=? ORDER BY order_id DESC";

        try {

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                Order order = new Order();

                order.setOrderId(rs.getInt("order_id"));
                order.setUserId(rs.getInt("user_id"));
                order.setRestaurantId(rs.getInt("restaurant_id"));
                order.setTotalAmount(rs.getDouble("total_amount"));
                order.setPaymentMethod(rs.getString("payment_method"));
                order.setStatus(rs.getString("status"));
                order.setOrderDate(rs.getString("order_date"));

                orders.add(order);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
    }

    @Override
    public Order getOrderById(int orderId) {

        Order order = null;

        String sql = "SELECT * FROM orders WHERE order_id=?";

        try {

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, orderId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                order = new Order();

                order.setOrderId(rs.getInt("order_id"));
                order.setUserId(rs.getInt("user_id"));
                order.setRestaurantId(rs.getInt("restaurant_id"));
                order.setTotalAmount(rs.getDouble("total_amount"));
                order.setPaymentMethod(rs.getString("payment_method"));
                order.setStatus(rs.getString("status"));
                order.setOrderDate(rs.getString("order_date"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return order;
    }
}