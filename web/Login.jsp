<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="shortcut icon" href="image/logo.png" type="">
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
        <title>Coolmate</title>
        <style>
            body {
                margin: 0;
                padding: 0;
                background-color: #ffffff;
                height: 100vh;
            }
            #logreg-forms .container #login-row #login-column #login-box {
                margin-top: 120px;
                max-width: 600px;
                height: 450px;
                border: 1px solid #9C9C9C;
                background-color: #EAEAEA;
            }
            #logreg-forms .container #login-row #login-column #login-box #login-form {
                padding: 20px;
            }
            #logreg-forms .container #login-row #login-column #login-box #login-form #links {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>

            <div id="logreg-forms">
                <div class="container">
                    <div id="login-row" class="row justify-content-center align-items-center">
                        <div id="login-column" class="col-md-6">
                            <div id="login-box" class="col-md-12">
                                <form id="login-form" class="form-signin" action="login" method="post">
                                    <h1 class="h3 mb-3 font-weight-normal" style="text-align: center">Đăng nhập</h1>
                                <c:if test="${requestScope.ms != null}">
                                    <div class="alert alert-danger" role="alert">
                                        ${requestScope.ms}
                                    </div>
                                </c:if>
                                <div class="form-group">
                                    <label for="username" class="text-info">Email:</label><br>
                                    <input name="user" value="${cookie.cu.value}" type="email" id="inputEmail" class="form-control" placeholder="Email" required="" autofocus="">
                                </div>
                                <div class="form-group">
                                    <label for="password" class="text-info">Mật khẩu:</label><br>
                                    <input name="pass" value="${cookie.cp.value}"  type="password" id="inputPassword" class="form-control" placeholder="Mật khẩu" required="">

                                </div>
                                <div class="form-group form-check">
                                    <input name="remember" value="1" type="checkbox" class="form-check-input" id="exampleCheck1" ${cookie.cr != null ?'checked':''}>
                                    <label class="form-check-label text-info" for="exampleCheck1">Nhớ mật khẩu</label>
                                </div>
                                <div id="links" class="form-group">
                                    <input type="submit" name="submit" class="btn btn-info btn-md" value="Đăng nhập">
                                    <div>
                                        <a href="ForgotPass.jsp" class="text-info">Quên mật khẩu?</a> |
                                        <a href="Signup.jsp" class="text-info">Đăng ký</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script>
            function toggleResetPswd(e) {
                e.preventDefault();
                $('#logreg-forms .form-signin').toggle() // display:block or none
                $('#logreg-forms .form-reset').toggle() // display:block or none
            }

            function toggleSignUp(e) {
                e.preventDefault();
                $('#logreg-forms .form-signin').toggle(); // display:block or none
                $('#logreg-forms .form-signup').toggle(); // display:block or none
            }

            $(() => {
                // Login Register Form
                $('#logreg-forms #forgot_pswd').click(toggleResetPswd);
                $('#logreg-forms #cancel_reset').click(toggleResetPswd);
                $('#logreg-forms #btn-signup').click(toggleSignUp);
                $('#logreg-forms #cancel_signup').click(toggleSignUp);
            })
        </script>
    </body>
</html>