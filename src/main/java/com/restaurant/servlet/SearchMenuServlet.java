package com.restaurant.servlet;

import java.io.IOException;
import java.util.List;

import com.restaurant.dao.MenuDAO;
import com.restaurant.daoimpl.MenuDAOImpl;
import com.restaurant.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/searchMenu")
public class SearchMenuServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int restaurantId =
                Integer.parseInt(request.getParameter("restaurantId"));

        String keyword = request.getParameter("keyword");

        MenuDAO dao = new MenuDAOImpl();

        List<Menu> menuList =
                dao.searchMenuByRestaurantId(restaurantId, keyword);

        request.setAttribute("menuList", menuList);
        request.setAttribute("restaurantId", restaurantId);

        request.getRequestDispatcher("menu.jsp")
               .forward(request, response);
    }
}