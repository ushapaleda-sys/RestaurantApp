package com.restaurant.servlet;

import java.io.IOException;
import java.util.List;
import com.restaurant.dao.OrderDAO;
import com.restaurant.dao.OrderItemDAO;
import com.restaurant.daoimpl.OrderDAOImpl;
import com.restaurant.daoimpl.OrderItemDAOImpl;
import com.restaurant.model.Order;
import com.restaurant.model.OrderItem;
import com.restaurant.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/orderDetails")
public class OrderDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loggedInUser");
        if(user == null){
            response.sendRedirect("login.jsp");
            return;
        }

        int orderId = Integer.parseInt(request.getParameter("orderId"));

        OrderDAO orderDAO = new OrderDAOImpl();
        Order order = orderDAO.getOrderById(orderId);

        OrderItemDAO orderItemDAO = new OrderItemDAOImpl();
        List<OrderItem> orderItems = orderItemDAO.getOrderItemsByOrderId(orderId);

        request.setAttribute("order", order);
        request.setAttribute("orderItems", orderItems);
        request.setAttribute("orderId", orderId);

        request.getRequestDispatcher("orderDetails.jsp")
               .forward(request, response);
    }
}
