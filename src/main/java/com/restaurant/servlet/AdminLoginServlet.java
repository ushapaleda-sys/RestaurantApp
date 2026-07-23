package com.restaurant.servlet;

import java.io.IOException;

import com.restaurant.dao.AdminDAO;
import com.restaurant.daoimpl.AdminDAOImpl;
import com.restaurant.model.Admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        AdminDAO dao = new AdminDAOImpl();

        Admin admin = dao.login(username, password);

        if (admin != null) {

            HttpSession session = request.getSession();
            session.setAttribute("admin", admin);

            response.sendRedirect("adminDashboard.jsp");

        } else {

            request.setAttribute("error", "Invalid Username or Password");

            request.getRequestDispatcher("adminLogin.jsp")
                    .forward(request, response);
        }
    }
}