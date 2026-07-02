package com.restaurant.servlet;

import java.io.IOException;

import com.restaurant.dao.UserDAO;
import com.restaurant.daoimpl.UserDAOImpl;
import com.restaurant.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = new User();

        user.setName(name);
        user.setEmail(email);
        user.setPhone(phone);
        user.setAddress(address);
        user.setUsername(username);
        user.setPassword(password);

        UserDAO dao = new UserDAOImpl();

        boolean status = dao.registerUser(user);

        if (status) {

            request.setAttribute("success",
                    "Registration Successful! Please Login.");

            request.getRequestDispatcher("login.jsp")
                   .forward(request, response);

        } else {

            request.setAttribute("error",
                    "Registration Failed!");

            request.getRequestDispatcher("register.jsp")
                   .forward(request, response);
        }
    }
}