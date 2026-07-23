package com.restaurant.servlet;

import java.io.IOException;

import com.restaurant.dao.RestaurantDAO;
import com.restaurant.daoimpl.RestaurantDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteRestaurant")
public class DeleteRestaurantServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int restaurantId = Integer.parseInt(request.getParameter("id"));

        RestaurantDAO dao = new RestaurantDAOImpl();

        boolean status = dao.deleteRestaurant(restaurantId);

        System.out.println("Delete Status = " + status);

        response.sendRedirect("viewRestaurants");
    }
}