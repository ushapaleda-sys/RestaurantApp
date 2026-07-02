package com.restaurant.dao;

import java.util.List;
import com.restaurant.model.Menu;

public interface MenuDAO {

    List<Menu> getMenuByRestaurantId(int restaurantId);

    Menu getMenuById(int menuId);

    List<Menu> searchMenuByRestaurantId(int restaurantId, String keyword);

    List<Menu> getMenuByCategory(int restaurantId, String category);
}