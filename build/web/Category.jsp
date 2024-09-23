<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Coolmate</title>
        <link rel="shortcut icon" href="image/logo.png" type="">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <!-- Boxicons -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- My CSS -->
        <link rel="stylesheet" href="css/css.css">
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            .custab {
                border: 1px solid #ccc;
                padding: 5px;
                margin: 5% 0;
                box-shadow: 3px 3px 2px #ccc;
                transition: 0.5s;
            }
            .custab:hover {
                box-shadow: 3px 3px 0px transparent;
                transition: 0.5s;
            }
            body {
                background-color: #f3f3f3;
            }
            .container {
                margin-top: 50px;
            }
            .form-row {
                margin-bottom: 20px;
            }
            .table-striped tbody tr:nth-of-type(odd) {
                background-color: #f9f9f9;
            }
            .btn-danger, .btn-primary {
                margin-right: 5px;
            }
            #label {
                align-items: center;
            }
            img {
                width: 200px;
                height: 120px;
            }
            .custom-heading {
                font-size: 3rem; /* Increases the font size */
                font-weight: bold; /* Makes the font bold */
                color: #333; /* Sets the font color */
                text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2); /* Adds a subtle shadow */
            }
            @import url('https://fonts.googleapis.com/css2?family=Bodoni+Moda+SC:ital,opsz,wght@0,6..96,400..900;1,6..96,400..900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap');
        </style>
    </head>
    <body>
        <div class="row">
            <div class="col-sm-2">
                <section id="sidebar">
                    <c:if test="${sessionScope.acc.role == 2}">
                        <a href="admin" class="brand">
                            <i class='bx bxs-home-smile'></i>
                            <span class="text">Trang thống kê</span>
                        </a>
                    </c:if>
                    <c:if test="${sessionScope.acc.role == 1}">
                        <a href="manager" class="brand">
                            <i class='bx bxs-home-smile'></i>
                            <span class="text">Trang quản lý</span>
                        </a>
                    </c:if>

                    <ul class="side-menu top">  
                        <li>
                            <a href="homesv">
                                <i class='bx bxs-home' ></i>
                                <span class="text">Trang chủ</span>
                            </a>
                        </li>
                        <c:if test="${sessionScope.acc.role == 2}">
                            <li >
                                <a href="admin">
                                    <i class='bx bxs-dashboard' ></i>
                                    <span class="text">Số liệu</span>
                                </a>
                            </li>
                        </c:if>
                        <li class="active">
                            <a href="categorys">
                                <i class='bx bxs-shopping-bag-alt' ></i>
                                <span class="text">Loại sản phẩm</span>
                            </a>
                        </li>
                        <c:if test="${sessionScope.acc.role == 1}">
                            <li>
                                <a href="manager">
                                    <i class='bx bx-briefcase'></i>
                                    <span class="text">Sản phẩm</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.acc.role == 2}">
                            <li>
                                <a href="product">
                                    <i class='bx bx-briefcase'></i>
                                    <span class="text">Sản phẩm</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.acc.role == 2}">
                            <li>
                                <a href="acount">
                                    <i class='bx bxs-doughnut-chart' ></i>
                                    <span class="text">Tài khoản</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.acc.role == 2}">
                            <li>
                                <a href="history">
                                    <i class='bx bxs-message-dots' ></i>
                                    <span class="text">Lịch sử giao dịch</span>
                                </a>
                            </li>
                        </c:if>
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
            <div class="col-md-10" style="margin-bottom: 30px; margin-left: 270px; padding-right: 50px;">
                <h1 class="text-center my-5 custom-heading">Quản lý loại Sản phẩm</h1>
                <div class="container">
                    <!-- User Table -->
                    <table class="table table-striped custab">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên</th>
                                <th>Chỉnh sửa</th>
                                <th>Xóa</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${categorys}" var="category">
                                <tr>
                                    <td>${category.id}</td>
                                    <td>${category.name}</td>
                                    <td>
                                        <a href="#" class="edit-button" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                    </td>
                                    <td>
                                        <form action="categorys" method="post" style="display:inline-block;">
                                            <input type="hidden" name="action" value="delete"/>
                                            <input type="hidden" name="id" value="${category.id}"/>
                                            <button type="submit" class="btn btn-sm" onclick="return confirm('Are you sure?')"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <!-- Add User Form -->
                    <div class="row mb-4" id="addForm">
                        <div class="col-md-12">
                            <form action="categorys" method="post">
                                <input type="hidden" name="action" value="add"/>
                                <div class="form-group">
                                    <label for="name">Tên</label>
                                    <input type="text" class="form-control" id="name" name="name" required>
                                </div>
                                <button type="submit" class="btn btn-primary btn-block">Thêm</button>
                            </form>
                        </div>
                    </div>

                    <!-- Edit User Form -->
                    <div class="row mb-4" id="editForm" style="display:none;">
                        <div class="col-md-12">
                            <form action="categorys" method="post">
                                <input type="hidden" name="action" value="edit"/>
                                <div class="form-group">
                                    <label for="edit-id">ID</label>
                                    <input type="text" class="form-control" id="edit-id" name="id" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="edit-name">Tên</label>
                                    <input type="text" class="form-control" id="edit-name" name="name" required>
                                </div>
                                <button type="submit" class="btn btn-primary btn-block">Lưu</button>
                                <button type="button" class="btn btn-secondary btn-block" id="cancelEdit">Hủy</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
        <script src="script.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.2/dist/chart.umd.min.js"></script>
        <script src="js/manager.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                // Handle Edit button click
                $('.edit-button').click(function (event) {
                    event.preventDefault(); // Prevent default link behavior

                    var row = $(this).closest('tr');
                    var id = row.find('td:eq(0)').text(); // Get ID from the first column
                    var name = row.find('td:eq(1)').text(); // Get Name from the second column

                    $('#edit-id').val(id);
                    $('#edit-name').val(name);

                    $('#editForm').show();
                    $('#addForm').hide();
                });

                // Handle Cancel button click in Edit Form
                $('#cancelEdit').click(function () {
                    $('#editForm').hide();
                    $('#addForm').show();
                });
            });
        </script>
    </body>
</html>
