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

@WebServlet("/updateCart")
public class UpdateCartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @SuppressWarnings("unchecked")
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        int menuId = Integer.parseInt(request.getParameter("menuId"));
        String action = request.getParameter("action");

        Integer restaurantId =
                (Integer) session.getAttribute("restaurantId");

        if (restaurantId == null) {
            response.sendRedirect("cart.jsp");
            return;
        }

        Map<Integer, List<CartItem>> allCarts =
                (Map<Integer, List<CartItem>>) session.getAttribute("allCarts");

        if (allCarts == null) {
            response.sendRedirect("cart.jsp");
            return;
        }

        List<CartItem> cart = allCarts.get(restaurantId);

        if (cart != null) {

            for (int i = 0; i < cart.size(); i++) {

                CartItem item = cart.get(i);

                if (item.getMenuId() == menuId) {

                    if ("increase".equals(action)) {

                        item.setQuantity(item.getQuantity() + 1);

                    } else if ("decrease".equals(action)) {

                        if (item.getQuantity() > 1) {

                            item.setQuantity(item.getQuantity() - 1);

                        } else {

                            cart.remove(i);
                        }
                    }

                    break;
                }
            }

            if (cart.isEmpty()) {
                allCarts.remove(restaurantId);
            } else {
                allCarts.put(restaurantId, cart);
            }

            session.setAttribute("allCarts", allCarts);
        }

        response.sendRedirect("cart.jsp");
    }
}