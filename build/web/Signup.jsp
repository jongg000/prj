<%-- 
    Document   : login
    Created on : Jun 30, 2024, 8:17:34 AM
    Author     : ngoda
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="image/logo.png" type="">
        <title>Coolmate</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
        <style>
            body {
                margin: 0;
                padding: 0;
                background-color: #ffffff;
                height: 100vh;
            }
            #sigup .container #sigup-row #sigup-column #sigup-box {
                margin-top: 40px; /* Adjusted from 120px to 60px to move form higher */
                max-width: 600px;
                height: 500px;
                border: 1px solid #9C9C9C;
                background-color: #EAEAEA;
            }
            #sigup .container #sigup-row #sigup-column #sigup-box #sigup-form {
                padding: 20px;
            }
            #sigup .container #sigup-row #sigup-column #sigup-box #sigup-form {
                display: flex;
                justify-content: space-between;
            }
            #links{
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

        </style>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div id="sigup">
                <h3 class="text-center text-white pt-5">Đăng ký</h3>
                <div class="container">
                    <div id="sigup-row" class="row justify-content-center align-items-center">
                        <div id="sigup-column" class="col-md-6">
                            <div id="sigup-box" class="col-md-12">
                                <form  action="signup" method="post" class="form-signup">
                                    <h3 class="text-center text-info">Đăng Ký</h3>
                                <c:if test="${requestScope.ms != null}">
                                    <div class="alert alert-danger" role="alert"">
                                        ${requestScope.ms}
                                    </div>
                                </c:if>
                                <div class="form-group">
                                    <label for="email" class="text-info">Email:</label><br>
                                    <input name="user" type="email" id="user-name" class="form-control" placeholder="Email" required="" autofocus="">
                                </div>
                                <div class="form-group">
                                    <label for="password" class="text-info">Mật khẩu:</label><br>
                                    <input name="pass" type="password" id="user-pass" class="form-control" placeholder="Mật khẩu" required autofocus="">
                                </div>
                                <div class="form-group">
                                    <label for="repassword" class="text-info">Nhập lại Mật khẩu:</label><br>
                                    <input name="repass" type="password" id="user-repeatpass" class="form-control" placeholder="Nhập lại mật khẩu" required autofocus="">
                                </div>
                                <div id="links" class="form-group">
                                    <input type="submit" name="submit" class="btn btn-info btn-md" value="Đăng ký">
                                    <div>
                                        <a href="ForgotPass.jsp" class="text-info">Quên mật khẩu?</a> |
                                        <a href="Login.jsp" class="text-info">Đăng nhập</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
