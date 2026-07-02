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

@WebServlet("/searchRestaurant")
public class SearchRestaurantServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("keyword");

        RestaurantDAO dao = new RestaurantDAOImpl();

        List<Restaurant> restaurants = dao.searchRestaurant(keyword);

        request.setAttribute("restaurantList", restaurants);

        request.getRequestDispatcher("restaurants.jsp")
               .forward(request, response);
    }
}