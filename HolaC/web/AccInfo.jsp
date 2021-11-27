<%-- 
    Document   : AccInfo
    Created on : Jul 15, 2021, 11:56:30 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>Manage Product</title>

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
        <link rel="stylesheet" type="text/css" href="css/managePro.css?ts=<?=time()?>" />
        <script>
            function check() {
                var confirm = prompt("Enter your old password");
                var oldpass = document.getElementById("oldpass").value;
                if (oldpass == confirm) {
                    alert("Correct password, changes will be saved");
                    return true;
                } else {
                    alert("Wrong password! Change will not be saved");
                    return false;
                }
            }
        </script>
    </head>
    <body>
        <%@include file="header.jsp" %>

        <!-- BREADCRUMB -->
        <div id="breadcrumb" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <h3 class="breadcrumb-header">Account Info</h3>
                        <ul class="breadcrumb-tree">
                            <li><a href="home1">Home</a></li>
                            <li class="active">Account</li>
                        </ul>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /BREADCRUMB -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <div class="col-md-7">
                        <!-- Billing Details -->
                        <div class="billing-details">
                            <form action="account"  method="post">
                                <div class="section-title">
                                    <h3 class="title">${sessionScope.customer.name}</h3>
                                </div>
                                <div class="form-group">
                                    <label>Username</label>
                                    <input type="text" class="form-control" name="name" value="${sessionScope.customer.username}" readonly>
                                </div>
                                <div class="form-group">
                                    <input type="password" style="display: none;" class="form-control" id="oldpass" value="${sessionScope.acc.password}">
                                </div>
                                <div class="form-group">
                                    <label>Customer Name</label>
                                    <input type="text" class="form-control" name="address" value="${sessionScope.customer.name}">
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input type="password" class="form-control" name="pass" value="${sessionScope.acc.password}">
                                </div>
                                <div class="form-group">
                                    <label>Email:</label>
                                    <input type="email" class="form-control" name="email" value="${sessionScope.customer.email}">
                                </div>
                                <div class="form-group">
                                    <label>Address</label>
                                    <input type="text" class="form-control" name="address" value="${sessionScope.customer.address}">
                                </div>
                                <div class="form-group">
                                    <label>Phone Number</label>
                                    <input type="text" class="form-control" name="phone" value="${sessionScope.customer.phone}">
                                </div>
                                <input type="submit" class="btn" value="Save"/>
                                <small id="emailHelp" class="form-text text-muted"></small>
                            </form>

                        </div>
                        <!-- /Billing Details -->
                    </div>

                    <!-- Order Details -->
                    <div class="col-md-5 order-details">
                        <div class="section-title text-center">
                            <h3 class="title">Your Avatar</h3>
                            <div class="product-img" >
                                <img src="./img/Tung.jpg" alt="" style="height: 500px; margin-top: 10px; border: 1px solid black;">
                            </div>
                        </div>
                        <!--                        <div class="order-summary">
                                                    <div class="order-col">
                                                        <div><strong>PRODUCT</strong></div>
                                                        <div><strong>TOTAL</strong></div>
                                                    </div>
                                                    <div class="order-products">
                                                        <div class="order-col">
                                                            <div>1x Product Name Goes Here</div>
                                                            <div>$980.00</div>
                                                        </div>
                                                        <div class="order-col">
                                                            <div>2x Product Name Goes Here</div>
                                                            <div>$980.00</div>
                                                        </div>
                                                    </div>
                                                    <div class="order-col">
                                                        <div>Shiping</div>
                                                        <div><strong>FREE</strong></div>
                                                    </div>
                                                    <div class="order-col">
                                                        <div><strong>TOTAL</strong></div>
                                                        <div><strong class="order-total">$2940.00</strong></div>
                                                    </div>
                                                </div>
                                                <div class="payment-method">
                                                    <div class="input-radio">
                                                        <input type="radio" name="payment" id="payment-1">
                                                        <label for="payment-1">
                                                            <span></span>
                                                            Direct Bank Transfer
                                                        </label>
                                                        <div class="caption">
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                                        </div>
                                                    </div>
                                                    <div class="input-radio">
                                                        <input type="radio" name="payment" id="payment-2">
                                                        <label for="payment-2">
                                                            <span></span>
                                                            Cheque Payment
                                                        </label>
                                                        <div class="caption">
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                                        </div>
                                                    </div>
                                                    <div class="input-radio">
                                                        <input type="radio" name="payment" id="payment-3">
                                                        <label for="payment-3">
                                                            <span></span>
                                                            Paypal System
                                                        </label>
                                                        <div class="caption">
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="input-checkbox">
                                                    <input type="checkbox" id="terms">
                                                    <label for="terms">
                                                        <span></span>
                                                        I've read and accept the <a href="#">terms & conditions</a>
                                                    </label>
                                                </div>
                                                <a href="#" class="primary-btn order-submit">Place order</a>-->
                    </div>
                    <!-- /Order Details -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->


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
