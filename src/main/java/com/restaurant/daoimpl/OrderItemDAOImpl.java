package com.restaurant.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.restaurant.dao.OrderItemDAO;
import com.restaurant.model.OrderItem;
import com.restaurant.utility.DBConnection;

public class OrderItemDAOImpl implements OrderItemDAO {

    private Connection con;

    public OrderItemDAOImpl() {
        con = DBConnection.getConnection();
    }

    @Override
    public boolean addOrderItem(OrderItem item) {

        String sql = "INSERT INTO order_item(order_id,menu_id,quantity,price) VALUES(?,?,?,?)";

        try {

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, item.getOrderId());
            ps.setInt(2, item.getMenuId());
            ps.setInt(3, item.getQuantity());
            ps.setDouble(4, item.getPrice());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public List<OrderItem> getOrderItemsByOrderId(int orderId) {

        List<OrderItem> list = new ArrayList<>();

        String sql = "SELECT * FROM order_item WHERE order_id=?";

        try {

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, orderId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                OrderItem item = new OrderItem();

                item.setOrderItemId(rs.getInt("order_item_id"));
                item.setOrderId(rs.getInt("order_id"));
                item.setMenuId(rs.getInt("menu_id"));
                item.setQuantity(rs.getInt("quantity"));
                item.setPrice(rs.getDouble("price"));

                list.add(item);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}