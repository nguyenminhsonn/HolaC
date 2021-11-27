<%-- 
    Document   : header
    Created on : Jul 12, 2021, 5:40:23 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- HEADER -->
        <header>
            <!-- TOP HEADER -->
            <div id="top-header">
                <div class="container">
                    <ul class="header-links pull-left">
                        <li><a href="#"><i class="fa fa-phone"></i> 0966240301</a></li>
                        <li><a href="#"><i class="fa fa-envelope-o"></i> sonnmhe150349@fpt.edu.vn</a></li>
                        <li><a href="#"><i class="fa fa-map-marker"></i> ROOM 203L - Dom D - FPT University</a></li>
                    </ul>
                    <ul class="header-links pull-right">
                        <c:if test="${sessionScope.acc.role == 1}">
                            <li><a href="manage"><i class="fa fa-product-hunt"></i>Product Manage</a></li>
                        </c:if>
                        <c:if test="${sessionScope.customer == null}">
                            <li><a href="login"><i class="fa fa-user-o"></i>Login</a></li>
                            </c:if>
                            <c:if test="${sessionScope.customer != null}">
                            <li><a href="account"><i class="fa fa-user-o"></i> ${sessionScope.customer.name}</a></li>
                            <li><a href="logout"><i class="fa fa-sign-out" aria-hidden="true"></i>Log Out</a></li>
                            </c:if>

                    </ul>
                </div>
            </div>

            <!-- /TOP HEADER -->

            <!-- MAIN HEADER -->
            <div id="header">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <!-- LOGO -->
                        <div class="col-md-3">
                            <div class="header-logo">
                                <a href="home1" class="logo">
                                    <img src="./img/logo.png" alt="">
                                </a>
                            </div>
                        </div>
                        <!-- /LOGO -->

                        <!-- SEARCH BAR -->
                        <div class="col-md-6">
                            <div class="header-search">
                                <form action="search" method="POST">
                                    <input class="input" placeholder="Search here" name="txt" value="${txt}">
                                    <button class="search-btn" type="submit">Search</button>
                                </form>
                            </div>
                        </div>
                        <!-- /SEARCH BAR -->

                        <!-- ACCOUNT -->
                        <div class="col-md-3 clearfix">
                            <div class="header-ctn">
                                <!-- Wishlist -->
<!--                                <div>
                                    <a href="#">
                                        <i class="fa fa-heart-o"></i>
                                        <span>Your Wishlist</span>
                                        <div class="qty">2</div>
                                    </a>
                                </div>-->
                                <!-- /Wishlist -->

                                <!-- Cart -->
                                <div class="dropdown">
                                    <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span>Your Cart</span>
                                        <div class="qty">3</div>
                                    </a>
                                    <div class="cart-dropdown">
                                        <div class="cart-list">
                                            <div class="product-widget">
                                                <div class="product-img">
                                                    <img src="./img/TNED004.png" alt="">
                                                </div>
                                                <div class="product-body">
                                                    <h3 class="product-name"><a href="#">E-Dra EH412 Black</a></h3>
                                                    <h4 class="product-price"><span class="qty">1x</span>499.000đ</h4>
                                                </div>
                                                <button class="delete"><i class="fa fa-close"></i></button>
                                            </div>

                                            <div class="product-widget">
                                                <div class="product-img">
                                                    <img src="./img/GHEG722.png" alt="">
                                                </div>
                                                <div class="product-body">
                                                    <h3 class="product-name"><a href="#">Cooler Master Caliber R1S Rose White</a></h3>
                                                    <h4 class="product-price"><span class="qty">3x</span>3.999.000đ</h4>
                                                </div>
                                                <button class="delete"><i class="fa fa-close"></i></button>
                                            </div>
                                        </div>
                                        <div class="cart-summary">
                                            <small>2 Item(s) selected</small>
                                            <h5>SUBTOTAL: 0đ</h5>
                                        </div>
                                        <div class="cart-btns">
                                            <a href="#">View Cart</a>
                                            <a href="#">Checkout  <i class="fa fa-arrow-circle-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <!-- /Cart -->


                            </div>
                        </div>
                        <!-- /ACCOUNT -->
                    </div>
                    <!-- row -->
                </div>
                <!-- container -->
            </div>
            <!-- /MAIN HEADER -->
        </header>
        <!-- /HEADER -->

        
    </body>
</html>
