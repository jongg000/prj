<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transaction History</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- My CSS -->
        <link rel="stylesheet" href="css/css.css">
        <link rel="shortcut icon" href="image/logo.png" type="">
        <title>Coolmate</title>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            .custom-heading {
                font-size: 3rem; /* Increases the font size */
                font-weight: bold; /* Makes the font bold */
                color: #333; /* Sets the font color */
                text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2); /* Adds a subtle shadow */
            }
        </style>
    </head>
    <body>
        <div class="row">
            <div class="col-md-3">
                <section id="sidebar">
                    <a href="admin" class="brand">
                        <i class='bx bxs-home-smile'></i>
                        <span class="text">Trang thống kê</span>
                    </a>
                    <ul class="side-menu top">
                            <li>
                                <a href="homesv">
                                    <i class='bx bxs-home' ></i>
                                    <span class="text">Trang chủ</span>
                                </a>
                            </li>
                            <li >
                                <a href="admin">
                                    <i class='bx bxs-dashboard' ></i>
                                    <span class="text">Số liệu</span>
                                </a>
                            </li>
                        <li>
                            <a href="categorys">
                                <i class='bx bxs-shopping-bag-alt' ></i>
                                <span class="text">Loại sản phẩm</span>
                            </a>
                        </li>
                        <li>
                            <a href="product">
                                <i class='bx bx-briefcase'></i>
                                <span class="text">Sản phẩm</span>
                            </a>
                        </li>
                        <li >
                            <a href="acount">
                                <i class='bx bxs-doughnut-chart' ></i>
                                <span class="text">Tài khoản</span>
                            </a>
                        </li>
                        <li class="active">
                            <a href="history">
                                <i class='bx bxs-message-dots' ></i>
                                <span class="text">Lịch sử giao dịch</span>
                            </a>
                        </li>
                    </ul>
                    <ul class="side-menu">
                        <li>
                            <a href="logout" class="logout">
                                <i class='bx bxs-log-out' ></i>
                                <span class="text">Đăng xuất</span>
                            </a>
                        </li>
                    </ul>
                </section>
            </div>
            <div class="container col-md-9">
                <h1 class="text-center my-5" custom-heading>Lịch sử giao dịch</h1>
                <div style="margin-right: 50px;">
                    <c:if test="${requestScope.icart != null && requestScope.icart2 == null}">
                        <table class="table table-bordered table-hover">
                            <thead class="thead-dark">
                                <tr>
                                    <th>ID</th>
                                    <th>Hóa đơn</th>
                                    <th>Ngày mua</th>
                                    <th>ID Khách hàng</th>
                                    <th>Tên Khách hàng</th>
                                    <th>Chi tiết</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.icart}" var="c">
                                    <tr>
                                        <td>${c.id}</td>
                                        <td><fmt:formatNumber value="${c.total_prices}" pattern="#,###"/> VNĐ</td>
                                        <td>${c.date}</td>
                                        <td>${c.user_id}</td>
                                        <td>${c.last_name}</td>
                                        <td><a href="history2?id=${c.id}" class="btn btn-info btn-sm">Chi tiết</a></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                    <c:if test="${requestScope.icart2 != null}">
                        <table class="table table-bordered table-hover">
                            <thead class="thead-dark">
                                <tr>
                                    <th>ID sản phẩm</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Số lượng</th>
                                    <th>Giá</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.icart2}" var="b">
                                    <tr>
                                        <td>${b.product_id}</td>
                                        <td>${b.name}</td>
                                        <td>${b.quantyti}</td>
                                        <td><fmt:formatNumber value="${b.price}" pattern="#,###"/> VNĐ</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                </div>
            </div>
        </div>
    </body>
</html>
