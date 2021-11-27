<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="dal.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>Categories</title>

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
                        <li ><a href="home1">Home</a></li>
                        <li class="active"><a href="category">Categories</a></li>

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
                    <!-- ASIDE -->
                    <div id="aside" class="col-md-3">
                        <!-- aside Widget -->
                        <div class="aside">
                            <h3 class="aside-title">Categories</h3>
                            <div class="checkbox-filter">
                                <c:forEach items="${requestScope.dataC}" var="c">
                                    <div class="input-checkbox">
<!--                                        <input type="checkbox" id="category-${c.id}">-->
<!--                                        <label for="category-${c.id}">-->
                                        <span></span>
                                        <a class="${tag == c.id ? "active":""}" href="cateFirstMenu?fid=${c.id}">${c.name}</a>
                                        <small></small>
                                        <!--                                        </label>-->
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <!-- /aside Widget -->

                        <!-- aside Widget -->
                        <!--                        <div class="aside">
                                                    <h3 class="aside-title">Price</h3>
                                                    <div class="price-filter">
                                                        <div id="price-slider"></div>
                                                        <div class="input-number price-min">
                                                            <input id="price-min" type="number">
                                                            <span class="qty-up">+</span>
                                                            <span class="qty-down">-</span>
                                                        </div>
                                                        <span>-</span>
                                                        <div class="input-number price-max">
                                                            <input id="price-max" type="number">
                                                            <span class="qty-up">+</span>
                                                            <span class="qty-down">-</span>
                                                        </div>
                                                    </div>
                                                </div>-->
                        <!-- /aside Widget -->

                        <!-- aside Widget -->
                        <div class="aside">
                            <h3 class="aside-title">Brand</h3>
                            <div class="checkbox-filter">
                                <c:forEach items="${requestScope.dataB}" var="b">
                                    <div class="input-checkbox">
<!--                                        <input type="checkbox" id="brand-${b.id}">
                                        <label for="brand-${b.id}">-->
                                        <span></span>
                                        <a class="${brand == b.brand ? "active":""}" href="cateByBrand?brand=${b.brand}">${b.brand}</a>
                                        <small></small>
                                        <!--                                        </label>-->
                                    </div>
                                </c:forEach>


                            </div>
                        </div>
                        <!-- /aside Widget -->

                        
                    </div>
                    <!-- /ASIDE -->

                    <!-- STORE -->
                    <div id="store" class="col-md-9">
                        <!-- store top filter -->
<!--                        <div class="store-filter clearfix">
                            <div class="store-sort">
                                <label>
                                    Sort By:
                                    <select class="input-select">
                                        <option value="0">Popular</option>
                                        <option value="1">Position</option>
                                    </select>
                                </label>

                                <label>
                                    Show:
                                    <select class="input-select">
                                        <option value="0">20</option>
                                        <option value="1">50</option>
                                    </select>
                                </label>
                            </div>
                                                        <ul class="store-grid">
                                                            <li class="active"><i class="fa fa-th"></i></li>
                                                            <li><a href="#"><i class="fa fa-th-list"></i></a></li>
                                                        </ul>
                        </div>-->
                        <!-- /store top filter -->

                        <!-- store products -->
                        <div class="row">
                            <c:forEach var="p" items="${requestScope.dataP}">
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
                                                <!--                                                <i class="fa fa-star"></i>
                                                                                                <i class="fa fa-star"></i>
                                                                                                <i class="fa fa-star"></i>
                                                                                                <i class="fa fa-star"></i>
                                                                                                <i class="fa fa-star"></i>-->
                                            </div>

                                            <div class="product-btns">
                                                <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                                <!--                                                <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>-->
                                                <button class="quick-view"><a href="product?pcode=${p.code}"><i class="fa fa-eye"></i></a><span class="tooltipp">View</span></button>
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
                        <!-- /store products -->

                        <!-- store bottom filter -->
                        <div class="store-filter clearfix">
                            <!--                            <span class="store-qty">Showing 20-100 products</span>-->
                            <ul class="store-pagination" style="${requestScope.num==1?"display: none":""}">
                                <c:forEach begin="1" end="${requestScope.num}" var="i">
                                    <c:if test="${tag != null}">
                                        <li class="${requestScope.page==i?"active":""}"><a  href="cateFirstMenu?page=${i}&fid=${tag}">${i}</a></li>
                                        </c:if>
                                        <c:if test="${brand != null}">
                                        <li class="${requestScope.page==i?"active":""}"><a  href="cateByBrand?page=${i}&brand=${brand}">${i}</a></li>
                                        </c:if>
                                        <c:if test="${txt != null}">
                                        <li class="${requestScope.page==i?"active":""}"><a  href="search?page=${i}&txt=${txt}">${i}</a></li>
                                        </c:if>
                                        <c:if test="${tag == null && brand ==null && txt == null}">
                                        <li class="${requestScope.page==i?"active":""}"><a  href="category?page=${i}">${i}</a></li>
                                        </c:if>

                                </c:forEach>
                            </ul>
                        </div>
                        <!-- /store bottom filter -->
                    </div>
                    <!-- /STORE -->
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

        <!-- jQuery Plugins -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>
