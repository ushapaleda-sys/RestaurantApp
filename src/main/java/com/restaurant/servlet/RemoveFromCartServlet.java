package com.restaurant.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.restaurant.model.CartItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/removeFromCart")
public class RemoveFromCartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @SuppressWarnings("unchecked")
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Integer restaurantId =
                (Integer) session.getAttribute("restaurantId");

        if (restaurantId == null) {
            response.sendRedirect("cart.jsp");
            return;
        }

        int menuId = Integer.parseInt(request.getParameter("menuId"));

        Map<Integer, List<CartItem>> allCarts =
                (Map<Integer, List<CartItem>>) session.getAttribute("allCarts");

        if (allCarts != null) {

            List<CartItem> cart = allCarts.get(restaurantId);

            if (cart != null) {

                cart.removeIf(item -> item.getMenuId() == menuId);

                if (cart.isEmpty()) {
                    allCarts.remove(restaurantId);
                } else {
                    allCarts.put(restaurantId, cart);
                }

                session.setAttribute("allCarts", allCarts);
            }
        }

        response.sendRedirect("cart.jsp");
    }
}