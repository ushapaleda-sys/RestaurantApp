package com.restaurant.servlet;

import java.io.IOException;
import java.util.List;

import com.restaurant.dao.OrderDAO;
import com.restaurant.daoimpl.OrderDAOImpl;
import com.restaurant.model.Order;
import com.restaurant.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/orders")
public class OrdersServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("loggedInUser");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        OrderDAO orderDAO = new OrderDAOImpl();

        List<Order> orders = orderDAO.getOrdersByUser(user.getUserId());

        request.setAttribute("orders", orders);

        request.getRequestDispatcher("orders.jsp")
               .forward(request, response);
    }
}