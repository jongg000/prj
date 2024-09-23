<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Boxicons -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- My CSS -->
        <link rel="stylesheet" href="css/css.css">
        <link rel="shortcut icon" href="image/logo.png" type="">
        <title>Coolmate</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <!--         Material Icons -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined"rel="stylesheet"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.35.5/apexcharts.min.js"></script>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }

            .chart-container {
                display: flex;
                justify-content: space-around;
                align-items: center;
                flex-wrap: wrap;
            }

            .chart {
                width: 45%;
                text-align: center;
                margin: 20px;
            }
            @import url('https://fonts.googleapis.com/css2?family=Bodoni+Moda+SC:ital,opsz,wght@0,6..96,400..900;1,6..96,400..900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap');
            .main-cards {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-around;
            }

            .card {
                border: 1px solid #ccc;
                border-radius: 8px;
                padding: 16px;
                margin: 8px;
                width: 22%;
                box-sizing: border-box;
                text-align: center;
                background-color: #F9F9F9;
            }

            .card-inner {
                margin-bottom: 16px;
            }

            .card h3 {
                margin: 0;
            }

            .card span {
                font-size: 40px;
                display: block;
                margin: 8px 0;
            }

        </style>
    </head>
    <body>
        <!-- SIDEBAR -->
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
                <li class="active">
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
                <li>
                    <a href="acount">
                        <i class='bx bxs-doughnut-chart' ></i>
                        <span class="text">Tài khoản</span>
                    </a>
                </li>
                <li>
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
        <!-- SIDEBAR -->
        <!-- CONTENT -->
        <div class="content1">
            <section id="content">
                <!-- MAIN -->
                <main>
                    <div class="head-title">
                        <div class="left">
                            <h1>Số liệu thống kê</h1>
                        </div>
                    </div>
                    <div class="main-cards" >
                        <c:set var="p" value="${requestScope.listp}"/>
                        <div class="card" style="background-color: #FAD4DC;">
                            <div class="card-inner">
                                <h3>Sản phẩm</h3>
                                <span class="material-icons-outlined">inventory_2</span>
                            </div>
                            <h1>${p.size()}</h1>
                        </div>
                        <c:set var="category" value="${requestScope.listc}"/> 
                        <div class="card" style="background-color: #C8E6FA;">
                            <div class="card-inner">
                                <h3>Loại sản phẩm</h3>
                                <span class="material-icons-outlined">category</span>
                            </div>
                            <h1>${category.size()}</h1>
                        </div>
                        <c:set var="order" value="${requestScope.listsc}"/>
                        <div class="card" style="background-color: #FFECD9;">
                            <div class="card-inner">
                                <h3>Đơn hàng</h3>
                                <span class="material-icons-outlined">description</span>
                            </div>
                            <h1>${order.size()}</h1>
                        </div>

                        <c:set var="price" value="0"/>
                        <div class="card" style="background-color: #FAEED1;">
                            <div class="card-inner" >
                                <h3>Doanh thu</h3>
                                <span class="material-symbols-outlined">
                                    paid
                                </span>
                            </div>
                            <h1>
                                <c:forEach items="${requestScope.listsc}" var="o">
                                    <c:set var="price" value="${price + o.total_prices}"/>
                                </c:forEach>
                                <fmt:formatNumber value="${price}" pattern="#,###"/> VNĐ
                            </h1>
                        </div>
                    </div>
                    <div class="chart-container" style="background-color: #F9F9F9; margin-top: 20px; border-radius: 20px;">
                        <div class="chart">
                            <div>
                                <h3>Doanh thu theo biểu đồ </h3>
                                <form action="thongke" method="get">
                                    <h3>
                                        <select name="nam" onchange="this.form.submit()">
                                            <option value="0" ${requestScope.nam == 0 ? 'selected' : ''}>All</option>
                                            <option value="2022" ${requestScope.nam == 2022 ? 'selected' : ''}>2022</option>
                                            <option value="2023" ${requestScope.nam == 2023 ? 'selected' : ''}>2023</option>
                                            <option value="2024" ${requestScope.nam == 2024 ? 'selected' : ''}>2024</option>
                                        </select>
                                    </h3>
                                </form>
                            </div>
                            <canvas id="barChart"></canvas>
                        </div>
                        <div class="chart">
                            <div>
                                <h3>Doanh thu theo biểu đồ </h3>
                                <form action="thongke" method="get">
                                    <h3>
                                        <select name="nam" onchange="this.form.submit()">
                                            <option value="0" ${requestScope.nam == 0 ? 'selected' : ''}>All</option>
                                            <option value="2022" ${requestScope.nam == 2022 ? 'selected' : ''}>2022</option>
                                            <option value="2023" ${requestScope.nam == 2023 ? 'selected' : ''}>2023</option>
                                            <option value="2024" ${requestScope.nam == 2024 ? 'selected' : ''}>2024</option>
                                        </select>
                                    </h3>
                                </form>
                            </div>
                            <canvas id="barChart2"></canvas>
                        </div>
                    </div>
                    <div class="table-data">
                        <div class="order">
                            <div class="head">
                                <h3>5 Sản phẩm bán chạy nhất</h3>
                            </div>
                            <table>
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên</th>
                                        <th>Số lượng</th>
                                        <th style="padding-left: 20px;">Giá</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.listpp}" var="o">
                                        <tr>
                                            <td>${o.id}</td>
                                            <td>${o.name}</td>
                                            <td>${o.quantity}</td>
                                            <td><span class="status completed">
                                                    <fmt:formatNumber value="${o.prices}" pattern="#,###"/>VNĐ</span></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <div class="order">
                            <div class="head">
                                <h3>5 Đơn hàng cao nhất</h3>
                            </div>
                            <table>
                                <thead>
                                    <tr>
                                        <th>Tên khách hàng</th>
                                        <th>Ngày đặt đơn</th>
                                        <th>Hóa đơn</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.listsctop}" var="aa">
                                        <tr>
                                            <td>${aa.name}</td>
                                            <td>${aa.date}</td>
                                            <td><span class="status completed">
                                                    <fmt:formatNumber value="${aa.total_prices}" pattern="#,###"/>VNĐ</span></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </main>
                <!-- MAIN -->
            </section>
        </div>
        <!-- CONTENT -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.2/dist/chart.umd.min.js"></script>
        <script>
                                            var ctx = document.getElementById('barChart').getContext('2d');
                                            var myChart = new Chart(ctx, {
                                                type: 'doughnut',
                                                data: {
                                                    labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'],
                                                    datasets: [{
                                                            label: 'Tổng Doanh thu',
                                                            data: [${requestScope.t1}, ${requestScope.t2}, ${requestScope.t3}, ${requestScope.t4}, ${requestScope.t5}, ${requestScope.t6}, ${requestScope.t7}, ${requestScope.t8}, ${requestScope.t9}, ${requestScope.t10}, ${requestScope.t11}, ${requestScope.t12}],
                                                            backgroundColor: [
                                                                'rgba(255, 99, 132, 0.2)',
                                                                'rgba(54, 162, 235, 0.2)',
                                                                'rgba(255, 206, 86, 0.2)',
                                                                'rgba(75, 192, 192, 0.2)',
                                                                'rgba(153, 102, 255, 0.2)',
                                                                'rgba(255, 159, 64, 0.2)'
                                                            ],
                                                            borderColor: [
                                                                'rgba(255, 99, 132, 1)',
                                                                'rgba(54, 162, 235, 1)',
                                                                'rgba(255, 206, 86, 1)',
                                                                'rgba(75, 192, 192, 1)',
                                                                'rgba(153, 102, 255, 1)',
                                                                'rgba(255, 159, 64, 1)'
                                                            ],
                                                            borderWidth: 1
                                                        }]
                                                },
                                                options: {
                                                    scales: {
                                                        y: {
                                                            beginAtZero: true
                                                        }
                                                    }
                                                }
                                            });
        </script>
        <script>
            var ctx = document.getElementById('barChart2').getContext('2d');
            var myChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'],
                    datasets: [{
                            label: 'Tổng Doanh thu',
                            data: [${requestScope.t1}, ${requestScope.t2}, ${requestScope.t3}, ${requestScope.t4}, ${requestScope.t5}, ${requestScope.t6}, ${requestScope.t7}, ${requestScope.t8}, ${requestScope.t9}, ${requestScope.t10}, ${requestScope.t11}, ${requestScope.t12}],
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 1
                        }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        </script>
        <script src="script.js"></script>
    </body>
</html>
