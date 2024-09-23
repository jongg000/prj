<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>Coolmate</title>
        <link rel="shortcut icon" href="image/logo.png" type="image/png">
        <meta content="" name="description">
        <meta content="" name="keywords">
        <!-- Favicons -->
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700" rel="stylesheet">
        <!-- Vendor CSS Files -->
        <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet">
        <style>
            .custom-btn {
                padding: 10px 20px; /* Adjust padding to make the button look better */
                width: auto; /* Auto width to fit the content */
                height: auto; /* Auto height to fit the content */
                display: inline-block; /* Make it inline-block to respect the padding */
                text-align: center; /* Center the text */
                border-radius: 5px; /* Rounded corners for a nicer look */
            }
            #fail {
                text-decoration: none;
                color: blue;
            }

            #fail:hover {
                cursor: not-allowed;
            }
        </style>
    </head>

    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <main id="main">
                <!-- ======= Breadcrumbs Section ======= -->
                <section class="breadcrumbs">
                    <div class="container">
                        <div class="d-flex justify-content-between align-items-center">
                            <h1><strong>Chi tiết Sản phẩm</strong></h1>
                            <ol>
                                <li><a href="homesv">Trang chủ</a></li>
                                <li>${requestScope.dateil.name}</li>
                        </ol>
                    </div>
                </div>
            </section><!-- Breadcrumbs Section -->

            <!-- ======= Portfolio Details Section ======= -->
            <section id="portfolio-details" class="portfolio-details">
                <div class="container">
                    <div class="row gy-4">
                        <div class="col-lg-8">
                            <div class="portfolio-details-slider swiper">
                                <div class="swiper-wrapper align-items-center">
                                    <div class="swiper-slide">
                                        <img src="${requestScope.dateil.img}" class="img-fluid" alt="">
                                    </div>
                                </div>
                                <div class="swiper-pagination"></div>
                            </div>
                        </div>

                        <div class="col-lg-4">
                            <div class="portfolio-info">
                                <h3>${requestScope.dateil.name}</h3>
                                <ul class="list-unstyled">
                                    <li><p class="btn btn-danger btn-block"><fmt:formatNumber value="${requestScope.dateil.prices}" pattern="#,###"/>VNĐ</p></li>
                                    <li><strong>Số hàng trong kho: </strong>${requestScope.dateil.quantity}</li>
                                    <li><strong>Tình trạng: </strong>                                          
                                        <c:if test="${requestScope.dateil.quantity == 0}">
                                            Hết hàng
                                        </c:if>
                                        <c:if test="${requestScope.dateil.quantity != 0}">
                                            Còn hàng
                                        </c:if>
                                    </li>
                                    <li>
                                        <c:if test="${requestScope.dateil.quantity == 0}">
                                            <a href="" class="btn btn-lg btn-outline-primary text-uppercase custom-btn" id="fail">
                                                <i class="fas fa-shopping-cart"></i> Thêm vào giỏ hàng</a>
                                            </c:if>
                                            <c:if test="${requestScope.dateil.quantity != 0}">
                                            <a href="cart?pid=${requestScope.dateil.id}" class="btn btn-lg btn-outline-primary text-uppercase custom-btn">
                                                <i class="fas fa-shopping-cart"></i> Thêm vào giỏ hàng
                                            </a>
                                        </c:if>
                                    </li>

                                    </li>

                                </ul>
                            </div>
                            <div class="portfolio-description mt-4">
                                <h2>Chi tiết về sản phẩm</h2>
                                <p style="text-align: justify;">${requestScope.dateil.description}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section><!-- End Portfolio Details Section -->
        </main><!-- End #main -->

        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
            <jsp:include page="Footer.jsp"></jsp:include>
        <!-- Vendor JS Files -->
        <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
        <script src="assets/vendor/aos/aos.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
        <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
        <script src="assets/vendor/waypoints/noframework.waypoints.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>
        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>
    </body>

</html>
