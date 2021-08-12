<%-- 
    Document   : adminRegister
    Created on : Mar 17, 2021, 4:56:26 PM
    Author     : Hùng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Register</title>
        <link rel="stylesheet" href="css/styleAdmin.css" />

    </head>
    <body>
        <!-- Form without bootstrap -->
        <div class="auth-wrapper">
            <div class="auth-container">
                <div class="auth-action-left">
                    <div class="auth-form-outer">
                        <h2 class="auth-form-title">Create Account</h2>
                        <div class="auth-external-container">
                            <div class="auth-external-list">
                                <ul>
                                   <li>
                                        <a href="#"> <img src="images/icon-google.png" height="15px" width="15px" > <i class="fa fa-google"></i></a>
                                    </li>
                                    <li>
                                        <a href="#"> <img src="images/icon-facebook.png" height="15px" width="15px"><i class="fa fa-facebook"></i></a>
                                    </li>
                                    <li>
                                        <a href="#"> <img src="images/icon-twitter.png" height="15px" width="15px"><i class="fa fa-twitter"></i></a>
                                    </li>
                                    <li>
                                        <a href="#"> <img src="images/icon-instagram.png" height="15px" width="15px"><i class="fa fa-linkedin"></i></a>
                                    </li>
                                </ul>
                            </div>
                            <p class="auth-sgt">or use your email for registration:</p>
                        </div>
                        <form class="login-form" action="register" method="post">
                             <p style="color:red;">${name}</p>
                            <input type="text" class="auth-form-input" placeholder="Name" name="name" />
                             <p style="color:red;">${fullname}</p>
                            <input type="text" class="auth-form-input" placeholder="FullName" name="fullname" />
                          
                            <div class="input-icon">
                                <input
                                    type="password"
                                    class="auth-form-input"
                                    placeholder="Password"
                                    name="pass"
                                    value="${pass}"
                                    />
                                <i class="fa fa-eye show-password"></i>
                            </div>
                            <input
                                type="password"
                                class="auth-form-input"
                                placeholder="Password 2"
                                name="pass2"
                                />

                            <label class="btn active">
                                <input type="checkbox" name="email1" checked />
                                <i class="fa fa-square-o"></i
                                ><i class="fa fa-check-square-o"></i>
                                <span>
                                    I agree to the <a href="#">Terms</a> and
                                    <a href="#">Privacy Policy</a>.</span
                                >
                            </label>
                            <div class="footer-action">
                                <input type="submit" value="Register" class="auth-submit" />
                                <a href="adminLogin.jsp" class="auth-btn-direct">login</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/common.js"></script>
    </body>
</html>
