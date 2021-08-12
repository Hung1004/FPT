<%-- 
    Document   : customerRePass
    Created on : Mar 17, 2021, 8:48:10 PM
    Author     : Hùng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <link rel="stylesheet" href="css/styleAdmin.css" />

    </head>
    <body>
        <!-- Form without bootstrap -->
        <div class="auth-wrapper">
            <div class="auth-container">
                <div class="auth-action-left">
                    <div class="auth-form-outer">
                        <h2 class="auth-form-title">Get Password</h2>
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
                            <p class="auth-sgt">or use your email for password retrieval:</p>
                        </div>
                        <form class="login-form" action="rePassCustomer">
                             <p style="color:red;">${username1}</p>
                            <input
                                type="text"
                                class="auth-form-input"
                                placeholder="Username"
                                name="username"
                               value="${username}"
                                />
                             <p style="color:red;">${phone1}</p>
                             <input type="text" class="auth-form-input" placeholder="Phone" name="phone" value="${phone}"/>
                            <label>   Press <b>Get Password</b> to retrieve your password </label>
                            <input
                                type="text"
                                class="auth-form-input"
                                placeholder="Your Password:"
                                readonly
                                value="${pass}"
                                />

                            <div class="footer-action">
                                <input type="submit" value="Get Password" class="auth-submit" />
                                <a href="customerLogin.jsp" class="auth-btn-direct">login</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

