package com.restaurant.servlet;

import java.io.IOException;

import com.restaurant.dao.RestaurantDAO;
import com.restaurant.daoimpl.RestaurantDAOImpl;
import com.restaurant.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateRestaurant")
public class UpdateRestaurantServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        Restaurant restaurant = new Restaurant();

        restaurant.setRestaurantId(
                Integer.parseInt(request.getParameter("restaurantId")));

        restaurant.setName(request.getParameter("restaurantName"));
        restaurant.setAddress(request.getParameter("address"));
        restaurant.setCuisineType(request.getParameter("cuisineType"));
        restaurant.setRating(
                Double.parseDouble(request.getParameter("rating")));
        restaurant.setImagePath(request.getParameter("imagePath"));

        RestaurantDAO dao = new RestaurantDAOImpl();

        dao.updateRestaurant(restaurant);

        response.sendRedirect("viewRestaurants");
    }
}