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
import jakarta.servlet.http.HttpSession;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        int restaurantId =
                Integer.parseInt(request.getParameter("restaurantId"));

        session.setAttribute("restaurantId", restaurantId);

        String search = request.getParameter("search");
        String category = request.getParameter("category");

        MenuDAO dao = new MenuDAOImpl();

        List<Menu> menuList;

        if(search != null && !search.trim().isEmpty()){

            menuList =
                    dao.searchMenuByRestaurantId(restaurantId, search);

            request.setAttribute("searchValue", search);

        }
        else if(category != null && !category.trim().isEmpty()){

            menuList =
                    dao.getMenuByCategory(restaurantId, category);

        }
        else{

            menuList =
                    dao.getMenuByRestaurantId(restaurantId);

        }

        request.setAttribute("menuList", menuList);

        request.getRequestDispatcher("menu.jsp")
               .forward(request, response);
    }
}