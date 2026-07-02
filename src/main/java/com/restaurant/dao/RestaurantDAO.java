package com.restaurant.dao;

import java.util.List;
import com.restaurant.model.Restaurant;

public interface RestaurantDAO {

    List<Restaurant> getAllRestaurants();

    Restaurant getRestaurantById(int restaurantId);

    List<Restaurant> searchRestaurant(String keyword);
}