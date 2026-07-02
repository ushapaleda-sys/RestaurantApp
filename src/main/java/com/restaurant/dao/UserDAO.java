package com.restaurant.dao;

import com.restaurant.model.User;

public interface UserDAO {

    boolean registerUser(User user);

    User login(String username, String password);

    User getUserById(int userId);

    boolean updateUser(User user);
}