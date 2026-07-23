package com.restaurant.dao;

import java.util.List;
import com.restaurant.model.Restaurant;

public interface RestaurantDAO {

    // User Side
    List<Restaurant> getAllRestaurants();

    Restaurant getRestaurantById(int restaurantId);

    List<Restaurant> searchRestaurant(String keyword);

    // Admin Side
    boolean addRestaurant(Restaurant restaurant);

    boolean updateRestaurant(Restaurant restaurant);

    boolean deleteRestaurant(int restaurantId);
    
    int getRestaurantCount();
}