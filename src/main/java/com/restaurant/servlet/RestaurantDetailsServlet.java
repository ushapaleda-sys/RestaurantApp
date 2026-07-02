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

@WebServlet("/restaurantDetails")
public class RestaurantDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));
        RestaurantDAO dao = new RestaurantDAOImpl();
        Restaurant restaurant = dao.getRestaurantById(restaurantId);
        request.setAttribute("restaurant", restaurant);
        request.getRequestDispatcher("restaurantDetails.jsp")
               .forward(request, response);
    }
}
