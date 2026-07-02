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

@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int userId = Integer.parseInt(request.getParameter("userId"));

        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String password = request.getParameter("password");

        User user = new User();

        user.setUserId(userId);
        user.setName(name);
        user.setUsername(username);
        user.setEmail(email);
        user.setPhone(phone);
        user.setAddress(address);
        user.setPassword(password);

        UserDAO dao = new UserDAOImpl();

        boolean status = dao.updateUser(user);

        if(status){

            HttpSession session = request.getSession();

            session.setAttribute("loggedInUser", user);

            response.sendRedirect("profile.jsp");

        }else{

            response.sendRedirect("profile.jsp");

        }
    }
}