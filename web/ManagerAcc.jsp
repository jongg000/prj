<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="css/css.css">
        <style>
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
            .table td {
                vertical-align: middle; /* Căn chỉnh các phần tử theo chiều dọc */
                text-align: center; /* Căn chỉnh nội dung văn bản vào giữa */
            }

            .edit-button {
                vertical-align: middle; /* Căn chỉnh biểu tượng chỉnh sửa vào giữa */
                margin-right: 5px; /* Khoảng cách giữa nút chỉnh sửa và nút xóa */
            }
        </style>

    </head>
    <body>
        <div class="row">
            <div class="col-md-2">
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
                                <i class='bx bxs-shopping-bag-alt'></i>
                                <span class="text">Loại sản phẩm</span>
                            </a>
                        </li>
                        <li>
                            <a href="product">
                                <i class='bx bx-briefcase'></i>
                                <span class="text">Sản phẩm</span>
                            </a>
                        </li>
                        <li class="active">
                            <a href="acount">
                                <i class='bx bxs-doughnut-chart'></i>
                                <span class="text">Tài khoản</span>
                            </a>
                        </li>
                        <li>
                            <a href="history">
                                <i class='bx bxs-message-dots'></i>
                                <span class="text">Lịch sử giao dịch</span>
                            </a>
                        </li>
                    </ul>
                    <ul class="side-menu">
                        <li>
                            <a href="logout" class="logout">
                                <i class='bx bxs-log-out'></i>
                                <span class="text">Đăng xuất</span>
                            </a>
                        </li>
                    </ul>
                </section>
            </div>
            <div class="col-md-10" style="margin-bottom: 30px; margin-left: 270px; padding-right: 50px;">
                <h1 class="text-center my-5 custom-heading">Quản lý tài khoản</h1>
                <div class="container">
                    <!-- User Table -->
                    <table class="table table-striped custab">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Họ</th>
                                <th>Tên</th>
                                <th>Email</th>
                                <th>Mật Khẩu</th>
                                <th>Vai trò</th>
                                <th>Avatar</th>
                                <th>Địa chỉ</th>
                                <th class="text-center">Chỉnh sửa</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${userall}" var="o">
                                <tr>
                                    <td class="user-id">${o.id}</td>
                                    <td class="user-first-name">${o.first_name}</td>
                                    <td class="user-last-name">${o.last_name}</td>
                                    <td class="user-email">${o.email}</td>
                                    <td class="user-password">${o.pass}</td>
                                    <td class="user-role">
                                        <c:choose>
                                            <c:when test="${o.role == 0}">Khách hàng</c:when>
                                            <c:when test="${o.role == 1}">Người bán</c:when>
                                            <c:when test="${o.role == 2}">Quản lý</c:when>
                                        </c:choose>
                                    </td>
                                    <td><img src="${o.img}" class="user-img" style="height:200px"></td>
                                    <td class="user-address">${o.adress}</td>
                                    <td>
                                        <a href="#" class="edit-button" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                        <form action="acount" method="post">
                                            <input type="hidden" name="action" value="delete"/>
                                            <input type="hidden" name="id" value="${o.id}"/>
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
                            <form action="acount" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="action" value="add"/>
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="email" class="form-control" id="email" name="email" required>
                                </div>
                                <div class="form-group">
                                    <label for="password">Mật khẩu</label>
                                    <input type="text" class="form-control" id="password" name="password" required>
                                </div>
                                <div class="form-group">
                                    <label for="first_name">Họ</label>
                                    <input type="text" class="form-control" id="first_name" name="first_name" required>
                                </div>
                                <div class="form-group">
                                    <label for="last_name">Tên</label>
                                    <input type="text" class="form-control" id="last_name" name="last_name" required>
                                </div>
                                <div class="form-group">
                                    <label for="role">Vai trò</label>
                                    <input type="text" class="form-control" id="role" name="role" required>
                                </div>
                                <div class="form-group">
                                    <label for="address">Địa chỉ</label>
                                    <input type="text" class="form-control" id="address" name="address" required>
                                </div>
                                <div class="form-group">
                                    <label for="img">Avatar</label>
                                    <input type="file" class="form-control" id="img" name="img" accept=".jpg, .jpeg, .png" required>
                                </div>
                                <button type="submit" class="btn btn-primary btn-block">Thêm</button>
                            </form>
                        </div>
                    </div>

                    <!-- Edit User Form -->
                    <div class="row mb-4" id="editForm" style="display:none;">
                        <div class="col-md-12">
                            <form action="acount" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="action" value="edit"/>
                                <div class="form-group">
                                    <label for="edit-id">ID</label>
                                    <input type="text" class="form-control" id="edit-id" name="id" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="edit-first-name">Họ</label>
                                    <input type="text" class="form-control" id="edit-first-name" name="first_name" required>
                                </div>
                                <div class="form-group">
                                    <label for="edit-last-name">Tên</label>
                                    <input type="text" class="form-control" id="edit-last-name" name="last_name" required>
                                </div>
                                <div class="form-group">
                                    <label for="edit-email">Email</label>
                                    <input type="email" class="form-control" id="edit-email" name="email" required>
                                </div>
                                <div class="form-group">
                                    <label for="edit-password">Mật khẩu</label>
                                    <input type="text" class="form-control" id="edit-password" name="password" required>
                                </div>
                                <div class="form-group">
                                    <label for="edit-role">Vai trò</label>
                                    <input type="text" class="form-control" id="edit-role" name="role" required>
                                </div>
                                <div class="form-group">
                                    <label for="edit-img">Avatar</label>
                                    <input type="file" class="form-control" id="edit-img" name="img" required>
                                </div>
                                <div class="form-group">
                                    <label for="edit-address">Địa chỉ</label>
                                    <input type="text" class="form-control" id="edit-address" name="address" required>
                                </div>
                                <button type="submit" class="btn btn-primary btn-block">Lưu</button>
                                <button type="button" class="btn btn-secondary btn-block" id="cancelEdit">Hủy</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                // Handle Edit button click
                $('.edit-button').click(function (event) {
                    event.preventDefault(); // Prevent default link behavior
                    var row = $(this).closest('tr');
                    var id = row.find('.user-id').text();
                    var firstName = row.find('.user-first-name').text();
                    var lastName = row.find('.user-last-name').text();
                    var email = row.find('.user-email').text();
                    var password = row.find('.user-password').text();
                    var img = row.find('.user-img').attr('src');
                    var address = row.find('.user-address').text();

                    $('#edit-id').val(id);
                    $('#edit-first-name').val(firstName);
                    $('#edit-last-name').val(lastName);
                    $('#edit-email').val(email);
                    $('#edit-password').val(password);
                    $('#edit-address').val(address);

                    // Update the form action URL to include the image
                    $('#editForm form').attr('action', 'acount?img=' + encodeURIComponent(img));

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
        <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.2/dist/chart.umd.min.js"></script>
        <script src="script.js"></script>
    </body>
</html>
