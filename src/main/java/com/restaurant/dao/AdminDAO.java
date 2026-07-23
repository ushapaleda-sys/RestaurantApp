package com.restaurant.dao;

import com.restaurant.model.Admin;

public interface AdminDAO {

    Admin login(String username, String password);

}