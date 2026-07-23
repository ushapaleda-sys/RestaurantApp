package com.restaurant.servlet;

import java.io.IOException;
import java.util.List;

import com.restaurant.dao.UserDAO;
import com.restaurant.daoimpl.UserDAOImpl;
import com.restaurant.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/viewUsers")
public class ViewUsersServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        UserDAO dao = new UserDAOImpl();

        List<User> users = dao.getAllUsers();

        request.setAttribute("users", users);

        request.getRequestDispatcher("viewUsers.jsp")
               .forward(request, response);
    }
}