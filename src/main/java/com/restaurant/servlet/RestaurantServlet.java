package com.restaurant.servlet;

import java.io.IOException;
import java.util.List;

import com.restaurant.dao.RestaurantDAO;
import com.restaurant.daoimpl.RestaurantDAOImpl;
import com.restaurant.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/restaurants")
public class RestaurantServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        RestaurantDAO dao = new RestaurantDAOImpl();

        String keyword = request.getParameter("search");

        List<Restaurant> restaurantList;

        if (keyword != null && !keyword.trim().isEmpty()) {

            restaurantList = dao.searchRestaurant(keyword);

        } else {

            restaurantList = dao.getAllRestaurants();
        }

        request.setAttribute("restaurantList", restaurantList);

        request.getRequestDispatcher("restaurants.jsp")
               .forward(request, response);
    }
}