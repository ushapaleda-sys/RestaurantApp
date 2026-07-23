# 🍽️ FoodieApp — Full-Stack Restaurant & Food Ordering System

[![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)](https://www.oracle.com/java/)
[![JSP Servlets](https://img.shields.io/badge/JavaEE-Servlets%20%26%20JSP-007396?style=for-the-badge&logo=java&logoColor=white)](https://jakarta.ee/)
[![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Bootstrap 5](https://img.shields.io/badge/Bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white)](https://getbootstrap.com/)
[![Tomcat](https://img.shields.io/badge/Apache%20Tomcat-F8DC75?style=for-the-badge&logo=apache-tomcat&logoColor=black)](https://tomcat.apache.org/)

**FoodieApp** is a robust, dynamic full-stack web application designed for online food ordering, menu browsing, cart management, and administrative control. Built using standard **Java Servlets, JSP, JDBC, MySQL, HTML5, CSS3, and Bootstrap 5**, it provides seamless experiences for both everyday users and system administrators.

---

## ✨ Features Overview

### 👤 User Side
* **🔐 Authentication**: User Registration and Login with session management & password security.
* **🏪 Restaurant Discovery**: Browse available top-rated restaurants with dynamic ratings, cuisines, and images.
* **🍕 Menu Catalog**: Explore menu items categorized by dish type (Biryani, Pizza, Burgers, Desserts, Beverages, etc.) with real-time price calculations.
* **🛒 Cart System**: Multi-restaurant smart cart management, quantity incremental/decremental controls, item removal, and subtotal calculation.
* **💳 Checkout & Payment**: Integrated order confirmation flow supporting multiple payment options (COD, UPI, Card, NetBanking).
* **📦 Order History**: Track past order details, itemized breakdown, total amounts, and delivery status updates.
* **👤 User Profile**: Personal profile details management and address configuration.

### ⚙️ Admin Side
* **🔐 Admin Portal**: Secure isolated login gateway for administrators (`adminLogin.jsp`).
* **📊 Dashboard**: Interactive control panel (`adminDashboard.jsp`) with real-time system metrics and quick navigation.
* **🏪 Restaurant Management**: Full CRUD support to add (`addRestaurant.jsp`), view (`viewRestaurants.jsp`), edit (`editRestaurant.jsp`), and delete restaurants.
* **🍔 Menu Management**: Full CRUD support to add (`addMenu.jsp`), view (`viewMenus.jsp`), edit (`editMenu.jsp`), and delete menu items across restaurants.
* **🛒 Customer Orders Control**: View real-time incoming orders with status tracking (`viewOrders.jsp`).
* **👥 User Accounts Management**: Overview of all registered customer profiles (`viewUsers.jsp`).
* **📈 Analytics & Reports**: Revenue statistics, sales breakdown, total order counts, and user metrics (`reports.jsp`).

---

## 🏗️ Architecture & Technology Stack

| Layer | Technology |
| :--- | :--- |
| **Frontend** | JSP (JavaServer Pages), HTML5, CSS3, Bootstrap 5, Google Fonts |
| **Backend Logic** | Java Servlets (Controller Layer), Java Models (POJO/DTO Layer) |
| **Data Access** | DAO (Data Access Object) Pattern with JDBC |
| **Database** | MySQL Server |
| **Web Container** | Apache Tomcat v10+ |
| **IDE** | Eclipse IDE for Enterprise Java Web Developers |

---

## 📂 Project Structure

```text
RestaurantApp/
 ├── src/main/java/com/restaurant/
 │    ├── dao/                # Data Access Object Interfaces (User, Restaurant, Menu, Order, Admin)
 │    ├── daoimpl/            # DAO Implementation Classes with JDBC operations
 │    ├── model/              # Entity POJOs (User, Restaurant, Menu, Order, OrderItem, CartItem, Admin)
 │    ├── servlet/            # Controller Servlets (Auth, Cart, Orders, Admin operations)
 │    └── utility/            # Database Connection Pool Helper (DBConnection.java)
 ├── src/main/webapp/
 │    ├── css/                # Stylesheets (style.css for Users, admin-style.css for Admin)
 │    ├── images/             # Restaurant, Menu, Banner media assets
 │    ├── WEB-INF/            # Deployment descriptor & library dependencies (.jar)
 │    ├── adminDashboard.jsp  # Admin Main Dashboard
 │    ├── adminLogin.jsp      # Admin Authentication Page
 │    ├── addRestaurant.jsp   # Admin Add Restaurant
 │    ├── viewRestaurants.jsp # Admin Manage Restaurants
 │    ├── editRestaurant.jsp # Admin Edit Restaurant
 │    ├── addMenu.jsp        # Admin Add Menu Item
 │    ├── viewMenus.jsp       # Admin Manage Menu Catalog
 │    ├── editMenu.jsp        # Admin Edit Menu Item
 │    ├── viewOrders.jsp      # Admin View Orders
 │    ├── viewUsers.jsp       # Admin View Registered Users
 │    ├── reports.jsp         # Admin System Analytics & Reports
 │    ├── home.jsp            # User Home Landing Page
 │    ├── login.jsp           # User Login
 │    ├── register.jsp        # User Registration
 │    ├── restaurants.jsp     # User Restaurants List
 │    ├── menu.jsp            # User Menu Page
 │    ├── cart.jsp            # User Shopping Cart
 │    ├── payment.jsp         # User Checkout & Payment
 │    ├── orders.jsp           # User Order History
 │    └── profile.jsp         # User Profile Settings
 └── README.md                # Project Documentation
```

---

## ⚡ Setup & Installation Instructions

### Prerequisites
* **Java Development Kit (JDK 17 or higher)**
* **Apache Tomcat Web Server (v10.1+)**
* **MySQL Community Server (v8.0+)**
* **Eclipse IDE for Enterprise Java and Web Developers**

### Step 1: Clone Repository
```bash
git clone https://github.com/ushapaleda-sys/RestaurantApp.git
```

### Step 2: Database Setup
Import and execute your MySQL schema scripts to create the necessary tables:
```sql
CREATE DATABASE IF NOT EXISTS restaurant_db;
USE restaurant_db;

-- Tables: users, restaurants, menu, orders, order_items, admin
```
Ensure database credentials inside `DBConnection.java` match your MySQL setup:
```java
String URL = "jdbc:mysql://localhost:3306/restaurant_db";
String USER = "your_mysql_username";
String PASSWORD = "your_mysql_password";
```

### Step 3: Import into Eclipse & Run
1. Open **Eclipse IDE** $\rightarrow$ `File` $\rightarrow$ `Import` $\rightarrow$ `Existing Projects into Workspace`.
2. Select the cloned `RestaurantApp` folder.
3. Target **Apache Tomcat v10.1** runtime server in Project Properties.
4. Right-click project $\rightarrow$ `Run As` $\rightarrow$ `Run on Server`.
5. Access the user application at `http://localhost:8080/RestaurantApp/` and the admin portal at `http://localhost:8080/RestaurantApp/adminLogin.jsp`.

---

## 👩‍💻 Developer

**Usha P T**  
🔗 GitHub: [@ushapaleda-sys](https://github.com/ushapaleda-sys)  
💻 Project Repository: [FoodieApp Repository](https://github.com/ushapaleda-sys/RestaurantApp)

---
*⭐ Star this repository if you find it helpful!*
