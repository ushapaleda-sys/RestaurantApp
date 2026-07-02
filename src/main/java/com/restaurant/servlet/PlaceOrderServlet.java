package com.restaurant.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.restaurant.dao.OrderDAO;
import com.restaurant.dao.OrderItemDAO;
import com.restaurant.daoimpl.OrderDAOImpl;
import com.restaurant.daoimpl.OrderItemDAOImpl;
import com.restaurant.model.CartItem;
import com.restaurant.model.Order;
import com.restaurant.model.OrderItem;
import com.restaurant.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/placeOrder")
public class PlaceOrderServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private OrderDAO orderDAO =
            new OrderDAOImpl();

    private OrderItemDAO orderItemDAO =
            new OrderItemDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user =
          (User) session.getAttribute("loggedInUser");

        Integer restaurantId =
          (Integer) session.getAttribute("restaurantId");

        String paymentMethod =
          (String) session.getAttribute("paymentMethod");

        Map<Integer,List<CartItem>> allCarts =
          (Map<Integer,List<CartItem>>) session.getAttribute("allCarts");

        List<CartItem> cart =
          allCarts.get(restaurantId);

        double totalAmount = 0;

        for(CartItem item : cart){

            totalAmount +=
             item.getPrice() * item.getQuantity();
        }

        Order order = new Order();

        order.setUserId(user.getUserId());
        order.setRestaurantId(restaurantId);
        order.setTotalAmount(totalAmount);
        order.setPaymentMethod(paymentMethod);
        order.setStatus("Placed");

        int orderId =
                orderDAO.placeOrder(order);

        for(CartItem cartItem : cart){

            OrderItem item =
                    new OrderItem();

            item.setOrderId(orderId);
            item.setMenuId(cartItem.getMenuId());
            item.setQuantity(cartItem.getQuantity());
            item.setPrice(cartItem.getPrice());

            orderItemDAO.addOrderItem(item);
        }

        allCarts.remove(restaurantId);

        session.setAttribute("allCarts",
                             allCarts);

        response.sendRedirect(
                "orderSuccess.jsp");
    }
}