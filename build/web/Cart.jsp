<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="shortcut icon" href="image/logo.png" type="image/png">
        <title>Coolmate</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css">     
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <style>
            .table th, .table td {
                vertical-align: middle;
                text-align: center;
                padding: 15px;
            }
            .table th {
                background-color: #f8f9fa;
                font-weight: bold;
            }
            .table td.text-right {
                text-align: right;
            }
            .table td.text-center {
                text-align: center;
            }
            .table .product-name {
                text-align: left;
                width: 30%;
            }
            .table .quantity {
                width: 15%;
            }
            .table .price, .table .total-price {
                width: 20%;
            }
            .table .actions {
                width: 10%;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>

            <div class="container mt-5">
                <div class="shopping-cart">
                    <h1 class="text-center mb-5">Giỏ hàng online</h1>
                    <div class="row">
                        <div class="col-lg-12 bg-white rounded shadow-sm">
                            <!-- Shopping cart table -->
                            <div class="row">
                                <div class="col-lg-12 bg-white rounded shadow-sm">
                                    <!-- Shopping cart table -->
                                    <div class="table-responsive">
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th class="text-uppercase">ID</th>
                                                    <th class="text-uppercase">Tên sản phẩm</th>
                                                    <th class="text-center text-uppercase">Số lượng</th>
                                                    <th class="text-uppercase">Giá tiền</th>
                                                    <th class="text-uppercase">Tổng tiền</th>
                                                    <th class="text-uppercase">Xóa</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:set var="cart" value="${requestScope.cart}" />
                                            <c:set var="counter" value="0" />
                                            <c:forEach var="item" items="${cart.items}">
                                                <c:set var="counter" value="${counter + 1}" />
                                                <tr>
                                                    <td style="padding-top: 35px;">${counter}</td>
                                                    <td style="padding-top: 35px;">${item.product.name}</td>
                                                    <td style="padding-top: 35px;" >
                                                        <a href="process?num=-1&id=${item.product.id}" class="btn btn-outline-secondary btn-sm">-</a>
                                                        ${item.quantity}
                                                        <a href="process?num=1&id=${item.product.id}" class="btn btn-outline-secondary btn-sm">+</a>
                                                    </td>
                                                    <td style="padding-top: 35px;" >
                                                        <fmt:formatNumber value="${item.price}" pattern="#,###"/> VNĐ
                                                    </td>
                                                    <td style="padding-top: 35px;">
                                                        <fmt:formatNumber value="${item.price * item.quantity}" pattern="#,###"/> VNĐ
                                                    </td>
                                                    <td>
                                                        <form action="process" method="post">
                                                            <input type="hidden" name="id" value="${item.product.id}"/>
                                                            <button type="submit" class="btn btn-sm"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></button>
                                                        </form>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- End -->
                            </div>
                        </div>
                        <!-- End -->
                    </div>
                </div>

                <div class="row py-5 mt-4 bg-white rounded shadow-sm">
                    <div class="col-md-12">
                        <div class="p-4">
                            <h4 class="mb-4">Hóa đơn</h4>
                            <ul class="list-unstyled mb-4">
                                <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Giá sản phẩm</strong><strong>
                                        <fmt:formatNumber value="${cart.totalMoney}" pattern="#,###"/> VNĐ
                                    </strong></li>
                                <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Shipping</strong><strong>Free ship</strong></li>
                                <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">VAT</strong><strong>5%</strong></li>
                                <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Tổng</strong>
                                    <h5 class="font-weight-bold"><strong class="text-muted">
                                            <fmt:formatNumber value="${cart.totalMoney * 1.05}" pattern="#,###"/> VNĐ
                                    </h5>
                                </li>
                            </ul>
                            <a href="checkout" class="btn btn-dark rounded-pill py-2 btn-block">Mua ngay</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="Footer.jsp"></jsp:include>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7HUiibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
