<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            .category-item {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100px;
                background-color: #f8f9fa; /* Light background color */
                border: 1px solid #dee2e6; /* Light border color */
                border-radius: 5px;
                transition: background-color 0.3s, border-color 0.3s;
                width: 100%;
            }

            .category-item.active,
            .category-item:hover {
                background-color: #e9ecef; /* Slightly darker color on hover/active */
                border-color: #ced4da; /* Slightly darker border on hover/active */
            }

            .category-link {
                color: #495057; /* Dark text color */
                text-decoration: none;
                font-weight: bold;
                text-align: center;
                width: 100%;
            }

            .category-item.active .category-link,
            .category-item:hover .category-link {
                color: #343a40; /* Darker text color for active/hover link */
            }

        </style>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>

        <c:if test="${requestScope.txts == null && requestScope.tag==null && requestScope.from == null && requestScope.to == null}">
            <section id="hero">
                <div class="hero-container">
                    <div id="heroCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel" data-bs-interval="5000">

                        <ol id="hero-carousel-indicators" class="carousel-indicators"></ol>

                        <div class="carousel-inner" role="listbox">

                            <div class="carousel-item active" style="background-image: url(image/2.jpg)">
                                <div class="carousel-container">
                                    <div class="container">
                                        <h2 class="animate__animated animate__fadeInDown">COOLMATE</h2>
                                        <p class="animate__animated animate__fadeInUp">Một Website bán đồ thời trang Online cho nam giới tối giản và tinh tế.</p>
                                    </div>
                                </div>
                            </div>

                            <div class="carousel-item" style="background-image: url(image/86757116_2537967639759095_6622201471435800576_n.jpg)">
                                <div class="carousel-container">
                                    <div class="container">
                                        <h2 class="animate__animated animate__fadeInDown">COOLMATE</h2>
                                        <p class="animate__animated animate__fadeInUp">Một Thương Hiệu đồ thời trang cho nam giới hướng tới các sản phẩm tối giản, tập trung vào chất liệu và sự bền vững: Substainable Fashion.</p>
                                    </div>
                                </div>
                            </div>

                            <div class="carousel-item" style="background-image: url(image/1.jpg)">
                                <div class="carousel-container">
                                    <div class="container">
                                        <h2 class="animate__animated animate__fadeInDown">COOLMATE</h2>
                                        <p class="animate__animated animate__fadeInUp">Một doanh nghiệp bán hàng Online đầu tiên tại Việt Nam có chính sách kỳ quặc: cho phép khách hàng đổi trả sản phẩm tới 60 ngày kể cả đã qua sử dụng.</p>
                                    </div>
                                </div>
                            </div>

                            <div class="carousel-item" style="background-image: url(image/be1bc24a-20200218_appvinid_bannerweb_coolmate-1.jpg)">
                                <div class="carousel-container">
                                    <div class="container">
                                        <h2 class="animate__animated animate__fadeInDown">COOLMATE</h2>
                                        <p class="animate__animated animate__fadeInUp">Một Startup nguồn lực hạn chế đã có chương trình Care&Share đóng góp cho hoạt động từ thiện ý nghĩa.</p>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <a class="carousel-control-prev" href="#heroCarousel" role="button" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon bi bi-chevron-left" aria-hidden="true"></span>
                        </a>

                        <a class="carousel-control-next" href="#heroCarousel" role="button" data-bs-slide="next">
                            <span class="carousel-control-next-icon bi bi-chevron-right" aria-hidden="true"></span>
                        </a>

                    </div>
                </div>
            </section>
            <section id="about">
                <div class="container" data-aos="fade-up">

                    <header class="section-header">
                        <h3>Sản phẩm nổi bật</h3>
                    </header>

                    <div class="row about-cols">

                        <div class="col-md-4" data-aos="fade-up" data-aos-delay="100">
                            <div class="about-col">
                                <div class="img">
                                    <img src="${requestScope.last.img}" alt="" class="img-fluid">
                                    <div class="icon"><i class="bi bi-briefcase"></i></div>
                                </div>
                                <h2 class="title"><a href="detail?pid=${requestScope.last.id}">${requestScope.last.name}</a></h2>
                                <p class="btn btn-block"><fmt:formatNumber value="${requestScope.last.prices}" pattern="#,###"/> VNĐ</p>
                            </div>
                        </div>
                        <div class="col-md-4" data-aos="fade-up" data-aos-delay="100">
                            <div class="about-col">
                                <div class="img">
                                    <img src="${requestScope.old.img}" alt="" class="img-fluid">
                                    <div class="icon"><i class="bi bi-briefcase"></i></div>
                                </div>
                                <h2 class="title"><a href="detail?pid=${requestScope.old.id}">${requestScope.old.name}</a></h2>
                                <p class="btn btn-block"><fmt:formatNumber value="${requestScope.old.prices}" pattern="#,###"/> VNĐ</p>
                            </div>
                        </div>
                        <div class="col-md-4" data-aos="fade-up" data-aos-delay="100">
                            <div class="about-col">
                                <div class="img">
                                    <img src="${requestScope.sp.img}" alt="" class="img-fluid">
                                    <div class="icon"><i class="bi bi-briefcase"></i></div>
                                </div>
                                <h2 class="title"><a href="detail?pid=${requestScope.sp.id}">${requestScope.sp.name}</a></h2>
                                <p class="btn btn-block"><fmt:formatNumber value="${requestScope.sp.prices}" pattern="#,###"/> VNĐ</p>
                            </div>
                        </div>
                    </div>

                </div>
            </section>
        </c:if>

        <section id="portfolio" class="section-bg">
            <div class="container" data-aos="fade-up">
                <header class="section-header">
                    <h3 class="section-title">Tất cả Sản phẩm</h3>
                </header>
                <div class="row">
                    <div class="col-md-10" style="margin-top:50px;">
                        <div class="row" data-aos="fade-up" data-aos-delay="100">
                            <div class="col-lg-12">
                                <div class="row">
                                    <c:forEach items="${listc}" var="o">
                                        <div class="col-md-2" style="padding-bottom: 20px;">
                                            <div style="width: 150px; height: 60px; display: flex; justify-content: center; align-items: center;" class="list-group-item ${requestScope.tag == o.id ? 'active' : ''} category-item">
                                                <a href="category?cid=${o.id}" class="category-link">${o.name}</a>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2" style="padding: 20px;">
                        
                            <form action="searchPrice" method="post" style="display: flex; flex-direction: column; background-color: #f8f9fa; padding: 10px 15px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); width: 200px; height: 230px;">
                                <h5 style="margin-bottom: 15px; font-weight: bold;">Theo giá</h5>
                                <div style="display: flex; align-items: center; margin-bottom: 10px;">
                                    <label for="from" style="margin-right: 5px; white-space: nowrap;">Từ</label>
                                    <input type="number" id="from" name="from" placeholder="Giá nhỏ nhất" value="${requestScope.from}" style="flex-grow: 1; padding: 5px; border: 1px solid #ced4da; border-radius: 4px;">
                                </div>
                                <div style="display: flex; align-items: center; margin-bottom: 15px;">
                                    <label for="to" style="margin-right: 5px; white-space: nowrap;">Tới</label>
                                    <input type="number" id="to" name="to" placeholder="Giá cao nhất" value="${requestScope.to}" style="flex-grow: 1; padding: 5px; border: 1px solid #ced4da; border-radius: 4px;">
                                </div>
                                <input type="submit" value="Tìm kiếm" style="padding: 5px 15px; background-color: #007bff; color: white; border: none; border-radius: 4px; cursor: pointer;">
                            </form>
                        
                    </div>

                </div>
                <div class="row portfolio-container" data-aos="fade-up" data-aos-delay="200">
                    <c:forEach items="${requestScope.list}" var="p">
                        <div class="col-lg-4 col-md-6 portfolio-item filter-app" style="margin-bottom: 50px;">
                            <div class="portfolio-wrap">
                                <figure>
                                    <img src="${p.img}" class="img-fluid" alt="">
                                    <a href="${p.img}" data-lightbox="portfolio" data-title="${p.name}" class="link-preview"><i class="bi bi-plus"></i></a>
                                    <a href="detail?pid=${p.id}" class="link-details" title="More Details"><i class="bi bi-link"></i></a>
                                </figure>
                                <div class="portfolio-info" style="height: 200px;">
                                    <h5><a style="color: black;" href="detail?pid=${p.id}">${p.name}</a></h5>
                                    <p class="btn btn-block"><fmt:formatNumber value="${p.prices}" pattern="#,###"/> VNĐ</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>


                <div class="pagination-container" style="text-align: center; margin-top: 20px;">
                    <c:if test="${requestScope.numpage != null}">
                        <c:set var="page" value="${requestScope.page}"/>
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">
                                <c:if test="${page != 1}">
                                    <li class="page-item"><a class="page-link" href="homesv?cid=${requestScope.tag}&page=${page - 1}">Trước</a></li>
                                    </c:if>
                                    <c:forEach begin="1" end="${requestScope.numpage}" var="a">
                                    <li class="page-item ${a == page ? 'active' : ''}">
                                        <a class="page-link" href="homesv?cid=${requestScope.tag}&page=${a}" style="${a == page ? 'background-color: #18D26E;' : ''}">${a}</a>
                                    </li>
                                </c:forEach>
                                <c:if test="${page != requestScope.numpage}">
                                    <li class="page-item"><a class="page-link" href="homesv?cid=${requestScope.tag}&page=${page + 1}">Tiếp</a></li>
                                    </c:if>
                            </ul>
                        </nav>
                    </c:if>
                </div>

        </section>
        <section id="contact" class="section-bg">
            <div class="container" data-aos="fade-up">

                <div class="section-header">
                    <h3>Liên hệ với chúng tôi</h3>
                </div>

                <div class="row contact-info">

                    <div class="col-md-4">
                        <div class="contact-address">
                            <i class="bi bi-geo-alt"></i>
                            <h3>Địa chỉ</h3>
                            <address>Hòa Lạc, Đại học FPT</address>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="contact-phone">
                            <i class="bi bi-phone"></i>
                            <h3>Số điện thoại</h3>
                            <p><a href="tel:+123456789155">+1 2345 67891 55</a></p>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="contact-email">
                            <i class="bi bi-envelope"></i>
                            <h3>Email</h3>
                            <p><a href="mailto:coolmate@gmail.com">coolmate@gmail.com</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <jsp:include page="Footer.jsp"></jsp:include>
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
