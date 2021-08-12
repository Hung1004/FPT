<%-- 
    Document   : adminBillDetailController
    Created on : Mar 17, 2021, 8:58:34 AM
    Author     : Hùng
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/index.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${sessionScope.listAd !=null}">
            <div class="container">
                <div class="menu">
                    <div class="top">
                        <h2>Welcome ${sessionScope.listAd.fullname}</h2>
                    </div>
                    <div class="bot">
                        <a href="logout">Logout</a>
                    </div>
                </div>
                <div class="content">
                    <div class="left">
                        <ul>
                            <li><a href="adminController">Admin Manager</a></li>
                            <li><a href="managerCustomer">Customer Manager</a></li>
                            <li><a href="managerProduct">Product Manager</a></li>
                            <li><a href="managerBill">Bill Manager</a></li>
                        </ul>
                    </div>
                    <div class="right">
                        <h1 style="text-align: center">Bill Detail Manager</h1>
                        <table border="1">
                            <thead>
                                <tr>
                                    <th>Bill ID</th>
                                    <th>Product ID</th>
                                    <th>Product Image</th>
                                    <th>Product Name</th>
                                    <th>Rec Name</th>
                                    <th>Date</th>
                                    <th>Quantity</th>
                                    <th>Price</th>
                                    <th>Total money</th>
                                </tr>
                            </thead>
                            <tbody>
<!--String hid, String pid, String image, String name, String cname, Date date, int quantity, int price, int subtotal, int status-->
                                <c:forEach items="${listgetAllBillDetail}" var="o">
                                    <tr>
                                        <td>${o.hid}</td>
                                        <td>${o.pid}</td>
                                        <td><img src="images/${o.image}"alt="${o.image}" width="70px" height="34px"></td>
                                        <td>${o.name}</td>
                                        <td>${o.cname}</td>
                                        <td>${o.date}</td>
                                        <td>${o.quantity}</td>
                                        <td>$${o.price}</td>
                                        <td>$${o.subtotal}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </c:if>
    </body>
</html>
