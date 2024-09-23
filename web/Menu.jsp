<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            .navbar-nav {
                font-size: 1rem;
            }
            .form-inline {
                flex-grow: 1;
                justify-content: flex-end;
            }
            .navbar-nav-right {
                margin-left: auto;
            }
            .navbar .container {
                display: flex;
                justify-content: space-between;
            }
            .navbar-brand {
                font-weight: bold;
            }
            .nav-link {
                margin-left: 1rem;
            }
            .top-bar {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 10px 50px;
                background-color: #343a40;
                color: white;
            }
            .top-bar img {
                height: 40px;
            }
            .search-bar {
                flex-grow: 1;
                display: flex;
                justify-content: center;
            }
            .search-bar form {
                display: flex;
                width: 50%;
            }
        </style>
        <title>Coolmate</title>
    </head>

    <body>
        <div class="top-bar">
            <a href="homesv"><img style="height: 60px; width: 60px;" src="https://www.coolmate.me/images/logo-coolmate-new.svg?v=1" alt="Logo Coolmate"></a>
            <div class="search-bar">
                <form action="search" method="post" class="form-inline my-2 my-lg-0">
                    <div class="input-group input-group-sm">
                        <input name="txt" type="text" value="${requestScope.txts}" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Tìm kiếm...">
                        <div class="input-group-append">
                            <button type="submit" class="btn btn-secondary btn-number">
                                <i class="fa fa-search"></i>
                            </button>
                        </div>
                    </div>    
                </form>
            </div>
            <a class="btn btn-success btn-sm ml-3" href="show">
                <i class="fa fa-shopping-cart"></i> Giỏ hàng 
                <span class="badge badge-light">${requestScope.size}</span>
            </a>
        </div>

        <nav class="navbar navbar-expand-md navbar-dark bg-dark">
            <div class="container">
                <div class="collapse navbar-collapse" id="navbarsExampleDefault">
                    <ul class="navbar-nav m-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="homesv">Trang chủ</a>
                        </li>
                        <c:if test="${sessionScope.acc.role == 2}">
                            <li class="nav-item">
                                <a class="nav-link" href="admin">Thống kê</a>
                            </li>
                        </c:if>
                        <c:if test="${(sessionScope.acc.role == 1 || sessionScope.acc.role == 2)}">
                            <li class="nav-item">
                                <a class="nav-link" href="manager">Quản lý</a>
                            </li>
                        </c:if>
                        <li class="nav-item">
                            <a class="nav-link" href="about.jsp">Về Coolmate</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="location.jsp">Vị trí cửa hàng</a>
                        </li>
                        <c:if test="${sessionScope.acc.role == 0}">
                            <li class="nav-item">
                                <a class="nav-link" href="vieworder">Lịch sử mua hàng</a>
                            </li>
                        </c:if>
                    </ul>
                    <ul class="navbar-nav navbar-nav-right">
                        <c:if test="${sessionScope.acc != null}">
                            <li class="nav-item">
                                <a class="nav-link" href="profile?cid=${sessionScope.acc.id}">Xin Chào ${sessionScope.acc.last_name}</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.acc != null}">
                            <li class="nav-item">
                                <a class="nav-link" href="logout">Đăng xuất</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.acc == null}">
                            <li class="nav-item">
                                <a class="nav-link" href="Login.jsp"><i class="fa fa-user" aria-hidden="true" style="padding-right: 10px;"></i> Đăng nhập</a>
                            </li>
                            <li class="divider"></li>
                            <li class="nav-item">
                                <a class="nav-link" href="Signup.jsp"><i class="fa fa-user" aria-hidden="true" style="padding-right: 10px;"></i> Đăng ký</a>
                            </li>
                        </c:if>   
                    </ul>
                </div>
            </div>
        </nav>



        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
