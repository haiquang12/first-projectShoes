<%-- 
    Document   : navbar
    Created on : Mar 9, 2022, 11:04:39 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#!">Welcome to QH shop</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="/Shopping_Online/home">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">All Products</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                                <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                            </ul>
                        </li>
                        <li  class="nav-item"><a href="manager" class="nav-link" >Manage</a></li>
                    </ul>
                    <form action = "search" class="d-flex mx-auto">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name = "keyword">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                    <div class="d-flex my-2">
                        <a class="btn btn-outline-dark" type="submit" href="carts">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span id="cart_number" class="badge bg-dark text-white ms-1 rounded-pill">${sessionScope.carts.size()}</span>
                        </a>
                    </div>
                    <c:choose>
                            <c:when test="${sessionScope.account != null}">
                                <div class="dropdown">
                                    <button class="btn btn-outline-primary mg-lg-2">
                                        ${sessionScope.account.username}
                                    </button>
                                    <a href="logout"class="btn btn-outline-primary mg-lg-2">
                                        Log out
                                    </a>

                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="dropdown">
                                    <a href="login"class="btn btn-outline-primary mg-lg-2" >
                                        Log in
                                    </a>

                                </div>
                            </c:otherwise>
                        </c:choose>
                </div>
            </div>
        </nav>
