package com.restaurant.dao;

import java.util.List;
import com.restaurant.model.Order;

public interface OrderDAO {

    int placeOrder(Order order);

    List<Order> getOrdersByUser(int userId);

    Order getOrderById(int orderId);

    List<Order> getAllOrders();
    
    int getTotalOrders();

    double getTotalRevenue();
}