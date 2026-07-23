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

@WebServlet("/editMenu")
public class EditMenuServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int menuId = Integer.parseInt(request.getParameter("id"));

        MenuDAO dao = new MenuDAOImpl();

        Menu menu = dao.getMenuById(menuId);

        request.setAttribute("menu", menu);

        request.getRequestDispatcher("editMenu.jsp")
               .forward(request, response);
    }
}