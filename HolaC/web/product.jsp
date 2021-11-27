<%-- 
    Document   : product
    Created on : Jul 9, 2021, 1:33:03 AM
    Author     : admin
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>${product.name}</title>

        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <!--        <link rel="stylesheet" type="text/css" href="css/style.css?ts=<?=time()?>" />-->
        <link rel="stylesheet" type="text/css" href="css/style.css?ts=<?=time()?>" />


        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
    <body>
        <%@include file="header.jsp" %>
        <!-- NAVIGATION -->
        <nav id="navigation">
            <!-- container -->
            <div class="container">
                <!-- responsive-nav -->
                <div id="responsive-nav">
                    <!-- NAV -->
                    <ul class="main-nav nav navbar-nav">
                        <li ><a href="home">Home</a></li>
                        <li ><a href="category">Categories</a></li>
                        <li class="active"><a href="product?pcode=${product.code}">${product.name}</a></li>
                    </ul>
                    <!-- /NAV -->
                </div>
                <!-- /responsive-nav -->
            </div>
            <!-- /container -->
        </nav>
        <!-- /NAVIGATION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- Product main img -->
                    <div class="col-md-5 col-md-push-2">
                        <div id="product-main-img">
                            <div class="product-preview">
                                <img src="${product.img}" alt="">
                            </div>
                        </div>
                    </div>
                    <!-- /Product main img -->

                    <!-- Product thumb imgs -->
                    <div class="col-md-2  col-md-pull-5" style="background-color: #D10024; height: 5px;">
                        <!--                        <div id="product-imgs">
                                                    <div class="product-preview">
                                                        <img src="./img/CAAV033.png" alt="">
                                                    </div>
                        
                                                    <div class="product-preview">
                                                        <img src="./img/CAAV033.png" alt="">
                                                    </div>
                        
                                                    <div class="product-preview">
                                                        <img src="./img/CAAV033.png" alt="">
                                                    </div>
                        
                                                    <div class="product-preview">
                                                        <img src="./img/CAAV033.png" alt="">
                                                    </div>
                                                </div>-->
                    </div>
                    <!-- /Product thumb imgs -->

                    <!-- Product details -->
                    <div class="col-md-5">
                        <div class="product-details">
                            <h2 class="product-name">${product.name}</h2>
                            <!--                            <div>
                                                            <div class="product-rating">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star-o"></i>
                                                            </div>
                                                            <a class="review-link" href="#">10 Review(s) | Add your review</a>
                                                        </div>-->
                            <div>

                                <c:if test="${product.secondPrice != 0}">
                                    <h4 class="product-price"><fmt:formatNumber pattern="###,###.###" value="${product.secondPrice}"/>đ <del class="product-old-price"><fmt:formatNumber pattern="###,###.###" value="${product.firstPrice}"/>đ</del></h4>
                                </c:if>
                                <c:if test="${product.secondPrice == 0}">
                                    <h4 class="product-price"><fmt:formatNumber pattern="###,###.###" value="${product.firstPrice}"/>đ</h4>
                                </c:if>

                            </div>
                            <p>${product.info}</p>

                            <div class="product-options">
                                <!--                                <label>
                                                                    Size
                                                                    <select class="input-select">
                                                                        <option value="0">X</option>
                                                                    </select>
                                                                </label>
                                                                <label>
                                                                    Color
                                                                    <select class="input-select">
                                                                        <option value="0">Red</option>
                                                                    </select>
                                                                </label>-->
                            </div>

                            <div class="add-to-cart">
                                <div class="qty-label">
                                    Qty
                                    <div class="input-number">
                                        <input type="number" value="${product.quantity}" name="quantity">
                                        <span class="qty-up">+</span>
                                        <span class="qty-down">-</span>
                                    </div>
                                </div>
                                <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                            </div>

                            <ul class="product-btns">

<!--                                <li><a href="#"><i class="fa fa-heart-o"></i> add to wishlist</a></li>-->
                                <!--                                <li><a href="#"><i class="fa fa-exchange"></i> add to compare</a></li>-->
                            </ul>

                            <ul class="product-links">
                                <li>Category:</li>
                                <li><a href="cateFirstMenu?fid=${product.idSecond.idFirst.id}">${product.idSecond.idFirst.name}</a></li>
                            </ul>
                            <ul class="product-links">
                                <li>Brand:</li>
                                <li><a href="cateByBrand?brand=${product.idSecond.brand}">${product.idSecond.brand}</a></li>
                            </ul>


                        </div>
                    </div>
                    <!-- /Product details -->


                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- Section -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <div class="col-md-12">
                        <div class="section-title text-center">
                            <h3 class="title">Related Products</h3>
                        </div>
                    </div>

                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">
                                <!-- tab -->
                                <div id="tab1" class="tab-pane active">
                                    <div class="products-slick" data-nav="#slick-nav-1">
                                        <c:forEach var="p" items="${requestScope.listP}">
                                            <!-- product -->
                                            <div class="col-md-4 col-xs-6">
                                                <div class="product">
                                                    <div class="product-img">
                                                        <img src="${p.img}" alt="">
                                                        <div class="product-label">
                                                            <c:if test="${p.secondPrice != 0}">
                                                                <span class="sale">
                                                                    <fmt:formatNumber pattern="##" value="-${(100-p.secondPrice/p.firstPrice*100)}"/>%
                                                                </span>
                                                            </c:if>

                                                        </div>
                                                    </div>
                                                    <div class="product-body">
                                                        <p class="product-category">${p.code}</p>
                                                        <h3 class="product-name"><a href="product?pcode=${p.code}">${p.name}</a></h3>
                                                            <c:if test="${p.secondPrice != 0}">
                                                            <h4 class="product-price">${p.secondPrice}đ <del class="product-old-price">${p.firstPrice}đ</del></h4>
                                                        </c:if>
                                                        <c:if test="${p.secondPrice == 0}">
                                                            <h4 class="product-price">${p.firstPrice}đ </h4>
                                                        </c:if>

                                                        <div class="product-rating">
                                                            <!--                                                            <i class="fa fa-star"></i>
                                                                                                                        <i class="fa fa-star"></i>
                                                                                                                        <i class="fa fa-star"></i>
                                                                                                                        <i class="fa fa-star"></i>
                                                                                                                        <i class="fa fa-star"></i>-->
                                                        </div>
                                                        <div class="product-btns">
<!--                                                            <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>-->
                                                            <!--                                                <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>-->
                                                            <button class="quick-view"><a href="product?pcode=${p.code}"><i class="fa fa-eye"></i></a><span class="tooltipp">quick view</span></button>
                                                        </div>
                                                    </div>
                                                    <div class="add-to-cart">

                                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /product -->
                                        </c:forEach>
                                    </div>
                                    <div id="slick-nav-1" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab -->
                            </div>
                        </div>
                    </div>
                    <!-- Products tab & slick -->

                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /Section -->

        <!--         NEWSLETTER 
                <div id="newsletter" class="section">
                     container 
                    <div class="container">
                         row 
                        <div class="row">
                            <div class="col-md-12">
                                <div class="newsletter">
                                    <p>Sign Up for the <strong>NEWSLETTER</strong></p>
                                    <form>
                                        <input class="input" type="email" placeholder="Enter Your Email">
                                        <button class="newsletter-btn"><i class="fa fa-envelope"></i> Subscribe</button>
                                    </form>
                                    <ul class="newsletter-follow">
                                        <li>
                                            <a href="#"><i class="fa fa-facebook"></i></a>
                                        </li>
                                        <li>
                                            <a href="#"><i class="fa fa-twitter"></i></a>
                                        </li>
                                        <li>
                                            <a href="#"><i class="fa fa-instagram"></i></a>
                                        </li>
                                        <li>
                                            <a href="#"><i class="fa fa-pinterest"></i></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                         /row 
                    </div>
                     /container 
                </div>
                 /NEWSLETTER -->

        <%@include file="footer.jsp" %>

        <!-- jQuery Plugins -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>

