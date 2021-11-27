

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

        <title>HoLaC</title>

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
                        <li class="active"><a href="home1">Home</a></li>
                        <li><a href="category">Categories</a></li>

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
                    <!-- shop -->
                    <div class="col-md-4 col-xs-6">
                        <div class="shop">
                            <div class="shop-img">
                                <img src="./img/LTMS337.png" alt="">
                            </div>
                            <div class="shop-body">
                                <h3>Laptop<br>Collection</h3>
                                <a href="cateFirstMenu?fid=1" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- /shop -->

                    <!-- shop -->
                    <div class="col-md-4 col-xs-6">
                        <div class="shop">
                            <div class="shop-img">
                                <img src="./img/MOMS010.png" alt="">
                            </div>
                            <div class="shop-body">
                                <h3>Monitor<br>Collection</h3>
                                <a href="cateFirstMenu?fid=3" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- /shop -->

                    <!-- shop -->
                    <div class="col-md-4 col-xs-6">
                        <div class="shop">
                            <div class="shop-img">
                                <img src="./img/TNLO039.png" alt="">
                            </div>
                            <div class="shop-body">
                                <h3>Headphone<br>Collection</h3>
                                <a href="cateFirstMenu?fid=4" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- /shop -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">New Products</h3>
                            <div class="section-nav">
                                <ul class="section-tab-nav tab-nav">
                                    <!--                                    <li class="active"><a data-toggle="tab" href="#tab1">Laptops</a></li>
                                                                        <li><a data-toggle="tab" href="#tab1">Monitor</a></li>
                                                                        <li><a data-toggle="tab" href="#tab1">Headphone</a></li>
                                                                        <li><a data-toggle="tab" href="#tab1">Camera</a></li>
                                                                        <li><a data-toggle="tab" href="#tab1">Gaming Chair</a></li>
                                                                        <li><a data-toggle="tab" href="#tab1">Mouse</a></li>
                                                                        <li><a data-toggle="tab" href="#tab1">Keyboard</a></li>-->
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">
                                <!-- tab -->
                                <div id="tab1" class="tab-pane active">
                                    <div class="products-slick" data-nav="#slick-nav-1">
                                        <c:forEach var="p" items="${requestScope.newPro}">
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
                                                            <span class="new">NEW</span>
                                                        </div>
                                                    </div>
                                                    <div class="product-body">
                                                        <p class="product-category">${p.code}</p>
                                                        <h3 class="product-name"><a href="product?pcode=${p.code}">${p.name}</a></h3>
                                                            <c:if test="${p.secondPrice != 0}">
                                                            <h4 class="product-price"><fmt:formatNumber pattern="###,###.###" value="${p.secondPrice}"/>đ <del class="product-old-price"><fmt:formatNumber pattern="###,###.###" value="${p.firstPrice}"/>đ</del></h4>
                                                        </c:if>
                                                        <c:if test="${p.secondPrice == 0}">
                                                            <h4 class="product-price"><fmt:formatNumber pattern="###,###.###" value="${p.firstPrice}"/>đ</h4>
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
        <!-- /SECTION -->

        <!-- HOT DEAL SECTION -->
        <div id="hot-deal" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="hot-deal">
                            <ul class="hot-deal-countdown">
<!--                                <li>
                                    <div>
                                        <h3>02</h3>
                                        <span>Days</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>10</h3>
                                        <span>Hours</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>34</h3>
                                        <span>Mins</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>60</h3>
                                        <span>Secs</span>
                                    </div>
                                </li>-->
                            </ul>
                            <h2 class="text-uppercase">hot deal this week</h2>
                            <p>New Collection Up to 50% OFF</p>
                            <a class="primary-btn cta-btn" href="category">Shop now</a>
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /HOT DEAL SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">Old Product</h3>
                            <div class="section-nav">
                                <ul class="section-tab-nav tab-nav">
<!--                                    <li class="active"><a data-toggle="tab" href="#tab2">Laptops</a></li>
                                    <li><a data-toggle="tab" href="#tab2">Smartphones</a></li>
                                    <li><a data-toggle="tab" href="#tab2">Cameras</a></li>
                                    <li><a data-toggle="tab" href="#tab2">Accessories</a></li>-->
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">
                                <!-- tab -->
                                <div id="tab2" class="tab-pane fade in active">
                                    <div class="products-slick" data-nav="#slick-nav-2">
                                        <c:forEach var="p" items="${requestScope.oldPro}">
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
                                                            <h4 class="product-price"><fmt:formatNumber pattern="###,###.###" value="${p.secondPrice}"/>đ <del class="product-old-price"><fmt:formatNumber pattern="###,###.###" value="${p.firstPrice}"/>đ</del></h4>
                                                        </c:if>
                                                        <c:if test="${p.secondPrice == 0}">
                                                            <h4 class="product-price"><fmt:formatNumber pattern="###,###.###" value="${p.firstPrice}"/>đ</h4>
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
                                    <div id="slick-nav-2" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab -->
                            </div>
                        </div>
                    </div>
                    <!-- /Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        

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

        <!-- Modal Layout -->

        <!-- jQuery Plugins -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>
