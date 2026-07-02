package com.restaurant.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static Connection connection;

    private static final String URL =
            "jdbc:mysql://localhost:3306/restaurantdb";

    private static final String USER =
            "root";

    private static final String PASSWORD =
            "root";

    public static Connection getConnection() {

        try {

            if(connection == null || connection.isClosed()) {

            	System.out.println("Loading MySQL Driver...");
            	Class.forName("com.mysql.cj.jdbc.Driver");
            	System.out.println("Driver Loaded Successfully");

                connection = DriverManager.getConnection(URL, USER, PASSWORD);
            }

        }
        catch(Exception e) {
            e.printStackTrace();
        }

        return connection;
    }
}