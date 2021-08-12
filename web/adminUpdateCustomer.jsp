<%-- 
    Document   : adminUpdateCustomer
    Created on : Mar 24, 2021, 3:14:44 PM
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
                        <h2 class="auth-form-title">Update Account</h2>

                        <form class="login-form" action="ControllerCustomer?action=update&cid=${cid}" method="post">
                            <input type="text" class="auth-form-input" placeholder="Name" name="name" value="${name}"/>
                            <input type="text" class="auth-form-input" placeholder="Address" name="address" value="${address}"/>
                            <input type="text" class="auth-form-input" placeholder="Phone" name="phone"  value="${phone}"/>
                            <input
                                type="text"
                                class="auth-form-input"
                                placeholder="Username"
                                name="username"
                                value="${username}"
                                />
                            <div class="input-icon">
                                <p style="color:red;">${alert}</p>
                                <input
                                    type="password"
                                    class="auth-form-input"
                                    placeholder="Password"
                                    name="pass"
                                    value="${pass}"
                                    />
                                <i class="fa fa-eye show-password"></i>
                            </div>
                            <p style="color:red;">${alert}</p>
                            <input
                                type="password"
                                class="auth-form-input"
                                placeholder="Confirm Password"
                                name="repass"
                                value="${pass}"
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
                                <input type="submit" value="Update" class="auth-submit" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/common.js"></script>
    </body>
</html>
