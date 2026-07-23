package com.restaurant.dao;

import java.util.List;
import com.restaurant.model.User;

public interface UserDAO {

    boolean registerUser(User user);

    User login(String username, String password);

    User getUserById(int userId);

    boolean updateUser(User user);

    // Admin
    List<User> getAllUsers();
    
    int getUserCount();
}