package com.restaurant.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/switchCart")
public class SwitchCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String restIdParam = request.getParameter("restaurantId");

        if(restIdParam != null && !restIdParam.isEmpty()){
            int restaurantId = Integer.parseInt(restIdParam);
            // Switch the active restaurant in session
            session.setAttribute("restaurantId", restaurantId);
        }

        // Redirect back to cart
        response.sendRedirect("cart.jsp");
    }
}
