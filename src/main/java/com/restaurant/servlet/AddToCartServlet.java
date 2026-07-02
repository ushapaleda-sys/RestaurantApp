package com.restaurant.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.restaurant.dao.MenuDAO;
import com.restaurant.daoimpl.MenuDAOImpl;
import com.restaurant.model.CartItem;
import com.restaurant.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @SuppressWarnings("unchecked")
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        int menuId = Integer.parseInt(request.getParameter("menuId"));
        int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));

        MenuDAO menuDAO = new MenuDAOImpl();

        Menu menu = menuDAO.getMenuById(menuId);

        if (menu == null) {
            response.sendRedirect("menu?restaurantId=" + restaurantId);
            return;
        }

        Map<Integer, List<CartItem>> allCarts =
                (Map<Integer, List<CartItem>>) session.getAttribute("allCarts");

        if (allCarts == null) {
            allCarts = new HashMap<>();
        }

        List<CartItem> cart = allCarts.get(restaurantId);

        if (cart == null) {
            cart = new ArrayList<>();
        }

        boolean found = false;

        for (CartItem item : cart) {

            if (item.getMenuId() == menuId) {

                item.setQuantity(item.getQuantity() + 1);

                found = true;

                break;
            }
        }

        if (!found) {

            CartItem item = new CartItem();

            item.setMenuId(menu.getMenuId());
            item.setRestaurantId(menu.getRestaurantId());
            item.setName(menu.getName());
            item.setPrice(menu.getPrice());
            item.setQuantity(1);

            cart.add(item);
        }

        allCarts.put(restaurantId, cart);

        session.setAttribute("allCarts", allCarts);

        response.sendRedirect("cart.jsp");
    }
}