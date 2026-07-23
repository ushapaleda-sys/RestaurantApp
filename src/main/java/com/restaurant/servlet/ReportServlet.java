package com.restaurant.servlet;

import java.io.IOException;

import com.restaurant.dao.MenuDAO;
import com.restaurant.dao.OrderDAO;
import com.restaurant.dao.RestaurantDAO;
import com.restaurant.dao.UserDAO;
import com.restaurant.daoimpl.MenuDAOImpl;
import com.restaurant.daoimpl.OrderDAOImpl;
import com.restaurant.daoimpl.RestaurantDAOImpl;
import com.restaurant.daoimpl.UserDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/reports")
public class ReportServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        RestaurantDAO restaurantDAO = new RestaurantDAOImpl();
        MenuDAO menuDAO = new MenuDAOImpl();
        UserDAO userDAO = new UserDAOImpl();
        OrderDAO orderDAO = new OrderDAOImpl();

        request.setAttribute("restaurants",
                restaurantDAO.getRestaurantCount());

        request.setAttribute("menus",
                menuDAO.getMenuCount());

        request.setAttribute("users",
                userDAO.getUserCount());

        request.setAttribute("orders",
                orderDAO.getTotalOrders());

        request.setAttribute("revenue",
                orderDAO.getTotalRevenue());

        request.getRequestDispatcher("reports.jsp")
               .forward(request, response);
    }
}