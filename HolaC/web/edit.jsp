<%-- 
    Document   : edit
    Created on : Jul 15, 2021, 2:26:32 AM
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

        <title>${p.name}</title>

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
                            <p> Edit Product </p>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="edit" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title" style=" display: inline-block">${p.code}</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">	
                                <div class="form-group">
                                    <label>Code</label>
                                    <input value="${p.code}" name="code" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Name</label>
                                    <input value="${p.name}" name="name" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Image</label>
                                    <input value="${p.img}" name="image" type="file" required>
                                </div>
                                <div class="form-group">
                                    <label>Quantity</label>
                                    <input value="${p.quantity}" name="quantity" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>First Price</label>
                                    <input value="${p.firstPrice}" name="fprice" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Second Price</label>
                                    <input value="${p.secondPrice}" name="sprice" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea name="info" class="form-control" required rows="7">${p.info}</textarea>
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
                                <a href="manage"><button type="button" class="btn">Cancel</button></a>
                                <input type="submit" class="btn btn-success" value="Save">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
        <%@include file="footer.jsp" %>

        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>
