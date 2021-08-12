<%-- 
    Document   : customerLogin
    Created on : Mar 17, 2021, 2:56:05 PM
    Author     : Hùng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Login</title>
        <link rel="stylesheet" href="css/styleAdmin.css" />
       
    </head>
    <body>
        <!-- Form without bootstrap -->
        <div class="auth-wrapper">
            <div class="auth-container">
                <div class="auth-action-left">
                    <div class="auth-form-outer">
                        <h2 class="auth-form-title">Login</h2>
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
                            <p class="auth-sgt">or login with:</p>
                        </div>
                        <form action="loginCustomer" method="post" class="login-form">
                            <p style="color:red;">${username}</p>
                            <input
                                name="name"
                                type="text"
                                class="auth-form-input"
                                placeholder="Username"
                                value="${name}"
                                />
                            <div class="input-icon">
                                <input
                                    name="pass"
                                    type="password"
                                    class="auth-form-input"
                                    placeholder="Password"
                                    value="${pass}"
                                    />
                                <input
                                    name="pass_2"
                                    type="password"
                                    class="auth-form-input"
                                    placeholder="Enter 2nd password if you are admin"
                                    />
                                <i class="fa fa-eye show-password"></i>
                            </div>
<!--                            <label class="btn active">
                                <input name="check" type="checkbox" checked />
                                <span> Login with Admin.</span>
                            </label>-->
                            <div class="footer-action">
                                <input type="submit" value="Login" class="auth-submit" />
                                <a href="customerRegister.jsp" class="auth-btn-direct">Register</a>
                            </div>
                        </form>
                        <div class="auth-forgot-password">
                            <a href="customerRePass.jsp">Forgot Password</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/common.js"></script>
    </body>
</html>
