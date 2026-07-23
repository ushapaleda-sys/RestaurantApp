package com.restaurant.servlet;

import java.io.IOException;

import com.restaurant.dao.MenuDAO;
import com.restaurant.daoimpl.MenuDAOImpl;
import com.restaurant.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateMenu")
public class UpdateMenuServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int menuId = Integer.parseInt(request.getParameter("menuId"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));
        String imagePath = request.getParameter("imagePath");

        Menu menu = new Menu();

        menu.setMenuId(menuId);
        menu.setName(name);
        menu.setDescription(description);
        menu.setPrice(price);
        menu.setRestaurantId(restaurantId);
        menu.setImagePath(imagePath);

        MenuDAO dao = new MenuDAOImpl();

        boolean status = dao.updateMenu(menu);

        System.out.println("Update Menu Status = " + status);

        response.sendRedirect("viewMenus");
    }
}