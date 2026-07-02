package com.restaurant.model;

public class Menu {

    private int menuId;
    private String name;
    private String description;
    private double price;
    private int restaurantId;
    private String imagePath;

    public Menu() {
    }

    public Menu(int menuId, String name, String description, double price,
            int restaurantId, String imagePath) {

        this.menuId = menuId;
        this.name = name;
        this.description = description;
        this.price = price;
        this.restaurantId = restaurantId;
        this.imagePath = imagePath;
    }

    public int getMenuId() {
        return menuId;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }
}