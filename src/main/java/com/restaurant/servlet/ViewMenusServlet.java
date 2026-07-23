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

@WebServlet("/viewMenus")
public class ViewMenusServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        MenuDAO dao = new MenuDAOImpl();

        List<Menu> menus = dao.getAllMenus();

        request.setAttribute("menus", menus);

        request.getRequestDispatcher("viewMenus.jsp")
               .forward(request, response);
    }
}