<%-- 
    Document   : adminController
    Created on : Mar 17, 2021, 8:58:34 AM
    Author     : Hùng
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                        <h1 style="text-align: center">Customer Manager</h1>
                        <table border="1">
                            <thead>
                                <tr>
                                    <th>Title</th>
                                    <th>Product ID</th>
                                    <th>Product Name</th>
                                    <th>Quantity</th>
                                    <th>Price</th>
                                    <th>Sale</th>
                                    <th>Sold</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listGetProductBySoldMax}" var="o">
                                    <tr>
                                        <td>Sold Max</td>
                                        <td>${o.id}</td>
                                        <td>${o.name}</td>
                                        <td>${o.quantity}</td>
                                        <td>${o.price}</td>
                                        <td>${o.sale}</td>
                                        <td>${o.sold}</td>
                                        <td>${o.sold*(o.price-o.price*o.sale/100)}$</td>
                                    </tr>
                                </c:forEach>
                                <c:forEach items="${listGetProductBySoldMin}" var="c">
                                    <tr>
                                        <td>Sold Min</td>
                                        <td>${c.id}</td>
                                        <td>${c.name}</td>
                                        <td>${c.quantity}</td>
                                        <td>${c.price}</td>
                                        <td>${c.sale}</td>
                                        <td>${c.sold}</td>
                                        <td>$${c.sold*(c.price-c.price*c.sale/100)}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <h3> Total profit: $${total}</h3>
                    </div>
                </div>
            </div>
        </c:if>
    </body>
</html>
