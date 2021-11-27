<%-- 
    Document   : ManaPro
    Created on : Jul 12, 2021, 10:43:26 PM
    Author     : admin
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <%@include file="header.jsp" %>

        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <p> Manage Product </p>
                        </div>
                        <div class="col-sm-6">
                            <a href="#addEmployeeModal"  class="btn" data-toggle="modal"><i class="fa fa-plus-circle"></i> <span>Add New Product</span></a>

                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <!--                            <th>
                                                                                            <span class="custom-checkbox">
                                                                                                <input type="checkbox" id="selectAll">
                                                                                                <label for="selectAll"></label>
                                                                                            </span>
                                                        </th>-->
                            <th>Code</th>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${dataP}" var="p">
                            <tr>
                                <!--                                <td>
                                                                    <span class="custom-checkbox">
                                                                        <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                                                        <label for="checkbox1"></label>
                                                                    </span>
                                                                </td>-->
                                <td>${p.id_Pro}</td>
                                <td>${p.code}</td>
                                <td style="width: 189px">${p.name}</td>
                                <td>
                                    <div class="product" style="width: 300px ">
                                        <div class="product-img">
                                            <img style="height: 100%" src="${p.img}">
                                        </div>
                                    </div>

                                </td>
                                <td>
                                    <c:if test="${p.secondPrice != 0}">
                                        <fmt:formatNumber pattern="###,###.###" value="${p.secondPrice}"/>đ </br><del class="product-old-price"><fmt:formatNumber pattern="###,###.###" value="${p.firstPrice}"/>đ</del>
                                    </c:if>
                                    <c:if test="${p.secondPrice == 0}">
                                        <fmt:formatNumber pattern="###,###.###" value="${p.firstPrice}"/>đ
                                    </c:if></td>
                                <td>${p.quantity}</td>
                                <td>
                                    <a href="loadProduct?pcode=${p.code}"  class="edit" data-toggle="modal"><i class="fa fa-pencil" data-toggle="tooltip" title="Edit"></i></a>
                                    <a href="delete?code=${p.code}" class="delete" data-toggle="modal"><i class="fa fa-trash-o" data-toggle="tooltip" title="Delete"></i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="clearfix">
                    <div class="hint-text">Showing <b>${numEach}</b> out of <b>${numP}</b> entries</div>
                    <ul class="pagination">
                        <c:forEach begin="1" end="${requestScope.num}" var="i">
                            <li class="page-item ${requestScope.page==i?"active":""}"><a href="manage?page=${i}" class="page-link">${i}</a></li>
                            </c:forEach>
                    </ul>
                </div>
            </div>
            <a href="home1"><button type="button" class="btn">Back to home</button></a>
        </div>
        <!-- Edit Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="add" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Code</label>
                                <input name="code" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Product Name</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input type="file" id="img-up" name="image">
                            </div>
                            <div class="form-group">
                                <label>Quantity</label>
                                <input name="quantity" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input name="price" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea name="info" class="form-control" required></textarea>
                            </div>

                            <div class="form-group">
                                <label>Category</label>&nbsp;
                                <select name="category" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${dataC}" var="o">
                                        <option value="${o.id}">${o.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Brand</label>&nbsp;
                                <select name="brand" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${dataB}" var="o">
                                        <option value="${o.brand}">${o.brand}</option>
                                    </c:forEach>
                                </select>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>



        <%@include file="footer.jsp" %>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>
        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>
