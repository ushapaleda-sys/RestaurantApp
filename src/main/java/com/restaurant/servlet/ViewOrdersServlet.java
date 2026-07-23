package com.restaurant.servlet;

import java.io.IOException;
import java.util.List;

import com.restaurant.dao.OrderDAO;
import com.restaurant.daoimpl.OrderDAOImpl;
import com.restaurant.model.Order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/viewOrders")
public class ViewOrdersServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        OrderDAO dao = new OrderDAOImpl();

        List<Order> orders = dao.getAllOrders();

        request.setAttribute("orders", orders);

        request.getRequestDispatcher("viewOrders.jsp")
               .forward(request, response);
    }
}