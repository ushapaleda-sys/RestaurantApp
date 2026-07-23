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

@WebServlet("/addRestaurant")
public class AddRestaurantServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("restaurantName");
        String address = request.getParameter("address");
        String cuisine = request.getParameter("cuisineType");
        double rating = Double.parseDouble(request.getParameter("rating"));
        String image = request.getParameter("imagePath");

        Restaurant restaurant = new Restaurant();

        restaurant.setName(name);
        restaurant.setAddress(address);
        restaurant.setCuisineType(cuisine);
        restaurant.setRating(rating);
        restaurant.setImagePath(image);

        RestaurantDAO dao = new RestaurantDAOImpl();

        if (dao.addRestaurant(restaurant)) {

        	request.setAttribute("success", "Restaurant Added Successfully!");

        	request.getRequestDispatcher("addRestaurant.jsp")
        	       .forward(request, response);

        } else {

            request.setAttribute("error", "Unable to Add Restaurant");

            request.getRequestDispatcher("addRestaurant.jsp")
                   .forward(request, response);
        }
    }
}