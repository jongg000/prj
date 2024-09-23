<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
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
            .export-form {
                background: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                text-align: center;
            }
            .export-form button {
                background-color: #007bff;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                font-size: 16px;
                cursor: pointer;
            }
            .export-form button:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <div class="row">
            <div class="col-md-2">
                <section id="sidebar">
                    <a href="manager" class="brand">
                        <i class='bx bxs-home-smile'></i>
                        <span class="text">Trang quản lý</span>
                    </a>
                    <ul class="side-menu top">
                        <li>
                            <a href="homesv">
                                <i class='bx bxs-home' ></i>
                                <span class="text">Trang chủ</span>
                            </a>
                        </li>
                        <li>
                            <a href="categorys">
                                <i class='bx bxs-shopping-bag-alt' ></i>
                                <span class="text">Loại sản phẩm</span>
                            </a>
                        </li>
                        <li class="active">
                            <a href="manager">
                                <i class='bx bx-briefcase'></i>
                                <span class="text">Sản phẩm</span>
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
                <h1 class="text-center my-5 custom-heading">Quản lý Sản phẩm</h1>
                <div class="container">
                    <!-- User Table -->
                    <table class="table table-striped custab">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên sản phẩm</th>
                                <th>Mô tả</th>
                                <th>Giá</th>
                                <th>Ảnh</th>
                                <th>Số lượng</th>
                                <th>Tình trạng</th>
                                <th class="text-center">Chỉnh sửa</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listP}" var="o">
                                <tr>
                                    <td>${o.id}</td>
                                    <td>${o.name}</td>
                                    <td style="width: 300px; text-align: justify;">${o.description}</td>
                                    <td style="width: 130px;" ><fmt:formatNumber value="${o.prices}" pattern="#,###"/> VNĐ</td>
                                    <td><img src="${o.img}" style="height:200px"></td>
                                    <td style="width: 100px;">${o.quantity}</td>
                                    <td style="width: 100px;" >
                                        <c:if test="${o.quantity == 0}">
                                            Hết hàng
                                        </c:if>
                                        <c:if test="${o.quantity != 0}">
                                            Còn hàng
                                        </c:if>
                                    </td>
                                    <td>
                                        <a href="#" class="edit-button" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                        <form action="manager" method="post">
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
                            <form action="manager" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="action" value="add"/>
                                <div class="form-group">
                                    <label for="name">Tên Sản phẩm</label>
                                    <input type="text" class="form-control" id="name" name="name" required>
                                </div>
                                <div class="form-group">
                                    <label for="description">Mô tả</label>
                                    <input type="text" class="form-control" id="description" name="description" required>
                                </div>
                                <div class="form-group">
                                    <label for="price">Giá</label>
                                    <input type="text" class="form-control" id="price" name="price" required>
                                </div>
                                <div class="form-group">
                                    <label for="img">Ảnh</label>
                                    <input type="file" class="form-control" id="img" name="img" accept=".jpg, .jpeg, .png" required>
                                </div>
                                <div class="form-group">
                                    <label for="quantity">Số lượng</label>
                                    <input type="number" class="form-control" id="quantity" name="quantity" required>
                                </div>
                                <div class="form-group">
                                    <select id="productid" name='productid'>
                                        <c:forEach items="${listc}" var="c">
                                            <option value="${c.id}">${c.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-primary btn-block">Thêm</button>
                            </form>
                        </div>
                    </div>

                    <!-- Edit User Form -->
                    <div class="row mb-4" id="editForm" style="display:none;">
                        <div class="col-md-12">
                            <form action="manager" method="post" enctype="multipart/form-data" id="editProductForm">
                                <input type="hidden" name="action" value="edit"/>
                                <div class="form-group">
                                    <label for="edit-id">ID</label>
                                    <input type="text" class="form-control" id="edit-id" name="id" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="edit-name">Tên Sản phẩm</label>
                                    <input type="text" class="form-control" id="edit-name" name="name" required>
                                </div>
                                <div class="form-group">
                                    <label for="edit-description">Mô tả</label>
                                    <input type="text" class="form-control" id="edit-description" name="description" required>
                                </div>
                                <div class="form-group">
                                    <label for="edit-price">Giá</label>
                                    <input type="text" class="form-control" id="edit-price" name="price" required>
                                </div>
                                <div class="form-group">
                                    <label for="edit-img">Ảnh</label>
                                    <input type="file" class="form-control" id="edit-img" name="img" accept=".jpg, .jpeg, .png" required>
                                </div>
                                <div class="form-group">
                                    <label for="edit-quantity">Số lượng</label>
                                    <input type="number" class="form-control" id="edit-quantity" name="quantity" required>
                                </div>
                                <div class="form-group">
                                    <select id="select" name='select'>
                                        <c:forEach items="${listc}" var="c">
                                            <option value="${c.id}">${c.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-primary btn-block">Lưu</button>
                                <button type="button" class="btn btn-secondary btn-block" id="cancelEdit">Hủy</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/manager.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                // Handle Edit button click
                $('.edit-button').click(function (event) {
                    event.preventDefault(); // Prevent default link behavior
                    var row = $(this).closest('tr');
                    var id = row.find('td:eq(0)').text();
                    var name = row.find('td:eq(1)').text();
                    var description = row.find('td:eq(2)').text();
                    var price = row.find('td:eq(3)').text().replace(' VNĐ', '').replace(',', '');
                    var img = row.find('img').attr('src');
                    var quantity = row.find('td:eq(5)').text();

                    $('#edit-id').val(id);
                    $('#edit-name').val(name);
                    $('#edit-description').val(description);
                    $('#edit-price').val(price);
                    $('#edit-img').val(''); // Clear the file input
                    $('#edit-quantity').val(quantity);

                    // Show the edit form and hide the add form
                    $('#editForm').show();
                    $('#addForm').hide();
                });

                // Handle Cancel button click in Edit Form
                $('#cancelEdit').click(function () {
                    $('#editForm').hide();
                    $('#addForm').show();

                    // Reset the edit form
                    $('#editProductForm')[0].reset();
                });
            });
        </script>

        <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.2/dist/chart.umd.min.js"></script>
        <script src="script.js"></script>
    </body>
</html>
