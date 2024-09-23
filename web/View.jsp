<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta content="" name="description">
        <meta content="" name="keywords">
        <title>Coolmate</title>
        <link rel="shortcut icon" href="image/logo.png" type="image/png">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            .order-card {
                margin: 15px 0;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                background-color: #fff;
            }
            .order-card h4 {
                margin: 0 0 15px;
            }
            .order-card p {
                margin: 5px 0;
            }
        </style>
    </head>
    <body>
        <div>
            <jsp:include page="Menu.jsp"></jsp:include>
            </div>
            <div class="container" style="margin-top: 40px;">
                <h1 class="text-center my-5">Lịch sử mua hàng</h1>
                <div>
                <c:forEach items="${requestScope.order}" var="c">
                    <div class="order-card">
                        <h4>Hóa đơn ID: ${c.shopping_cart_id}</h4>
                        <p><strong>Hóa đơn:</strong> <fmt:formatNumber value="${c.total_prices}" pattern="#,###"/> VNĐ</p>
                        <p><strong>Ngày mua:</strong> ${c.date}</p>
                        <p><strong>Tên Sản phẩm:</strong> ${c.name}</p>
                        <p><strong>Số lượng:</strong> ${c.quantyti}</p>
                    </div>
                </c:forEach>
            </div>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
