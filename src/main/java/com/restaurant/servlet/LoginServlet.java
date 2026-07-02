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
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAOImpl();

        User user = dao.login(username, password);

        if(user != null){

            HttpSession session = request.getSession();

            session.setAttribute("loggedInUser", user);

            response.sendRedirect("home.jsp");

        }else{

            request.setAttribute("error", "Invalid Username or Password");

            request.getRequestDispatcher("login.jsp")
                   .forward(request, response);

        }

    }

}