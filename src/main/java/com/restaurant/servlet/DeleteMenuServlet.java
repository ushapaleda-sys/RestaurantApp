package com.restaurant.servlet;

import java.io.IOException;

import com.restaurant.dao.MenuDAO;
import com.restaurant.daoimpl.MenuDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteMenu")
public class DeleteMenuServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int menuId = Integer.parseInt(request.getParameter("id"));

        MenuDAO dao = new MenuDAOImpl();

        boolean status = dao.deleteMenu(menuId);

        System.out.println("Delete Menu Status = " + status);

        response.sendRedirect("viewMenus");
    }
}