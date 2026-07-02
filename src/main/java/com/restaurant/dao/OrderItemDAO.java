package com.restaurant.dao;

import java.util.List;
import com.restaurant.model.OrderItem;

public interface OrderItemDAO {

    boolean addOrderItem(OrderItem item);

    List<OrderItem> getOrderItemsByOrderId(int orderId);

}