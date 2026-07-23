package com.restaurant.dao;

import java.util.List;
import com.restaurant.model.Menu;

public interface MenuDAO {

    // User Side
    List<Menu> getMenuByRestaurantId(int restaurantId);

    Menu getMenuById(int menuId);

    List<Menu> searchMenuByRestaurantId(int restaurantId, String keyword);

    List<Menu> getMenuByCategory(int restaurantId, String category);

    // Admin Side
    boolean addMenu(Menu menu);

    boolean updateMenu(Menu menu);

    boolean deleteMenu(int menuId);

    List<Menu> getAllMenus();
    
    int getMenuCount();
}