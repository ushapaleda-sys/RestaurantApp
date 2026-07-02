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

@WebServlet("/payment")
public class PaymentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("loggedInUser");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String paymentMethod = request.getParameter("paymentMethod");

        Integer restaurantId =
                (Integer) session.getAttribute("restaurantId");

        Map<Integer, List<CartItem>> allCarts =
                (Map<Integer, List<CartItem>>) session.getAttribute("allCarts");

        if (allCarts == null || restaurantId == null) {
            response.sendRedirect("cart.jsp");
            return;
        }

        List<CartItem> cart = allCarts.get(restaurantId);

        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("cart.jsp");
            return;
        }

        double total = 0;

        for (CartItem item : cart) {
            total += item.getPrice() * item.getQuantity();
        }

        Order order = new Order();

        order.setUserId(user.getUserId());
        order.setRestaurantId(restaurantId);
        order.setTotalAmount(total);
        order.setPaymentMethod(paymentMethod);
        order.setStatus("Placed");

        OrderDAO orderDAO = new OrderDAOImpl();

        int orderId = orderDAO.placeOrder(order);

        OrderItemDAO orderItemDAO = new OrderItemDAOImpl();

        for (CartItem item : cart) {

            OrderItem orderItem = new OrderItem();

            orderItem.setOrderId(orderId);
            orderItem.setMenuId(item.getMenuId());
            orderItem.setQuantity(item.getQuantity());
            orderItem.setPrice(item.getPrice());

            orderItemDAO.addOrderItem(orderItem);
        }

        allCarts.remove(restaurantId);

        session.setAttribute("allCarts", allCarts);

        response.sendRedirect("orderSuccess.jsp");
    }
}