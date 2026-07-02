<%@ page import="com.restaurant.model.User" %>

<%
User user = (User) session.getAttribute("loggedInUser");
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">

    <div class="container">

        <a class="navbar-brand fw-bold" href="home.jsp">
            🍽 FoodieApp
        </a>

        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarNav">

            <span class="navbar-toggler-icon"></span>

        </button>

        <div class="collapse navbar-collapse" id="navbarNav">

            <ul class="navbar-nav ms-auto">

                <li class="nav-item">
                    <a class="nav-link" href="home.jsp">
                        Home
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="restaurants">
                        Restaurants
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="cart.jsp">
                        Cart
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="orders">
                        Orders
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="profile.jsp">
                        Profile
                    </a>
                </li>

                <% if(user!=null){ %>

                <li class="nav-item">

                    <span class="navbar-text text-warning me-3">

                        Welcome,

                        <%= user.getName() %>

                    </span>

                </li>

                <% } %>

                <li class="nav-item">

                    <a href="logout" class="btn btn-danger ms-2">
                       Logout
                    </a>

                </li>

            </ul>

        </div>

    </div>

</nav>