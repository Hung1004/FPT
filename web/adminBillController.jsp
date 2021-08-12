<%-- 
    Document   : index
    Created on : Mar 17, 2021, 8:58:34 AM
    Author     : Hùng
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/index.css" rel="stylesheet" type="text/css"/>
        <script src="js/paggerAdmin.js" type="text/javascript"></script>
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
                        <h1 style="text-align: center">Bill Manager</h1>
                        <div style="text-align: center">
                            <form action="ControllerBill?action=searchByStatus" method="POST">
                                <select name="searchStatus" onchange="this.form.submit()">
                                    <option value="" hidden>Select</option>
                                    <option value="0" >Wait</option>
                                    <option value="1" >Process</option>
                                    <option value="2" >Done</option>
                                </select>
                            </form>
                        </div>  
                        <table border="1">
                            <thead>
                                <tr>
                                    <th>View</th>
                                    <th>Bill ID</th>
                                    <th>Date Create</th>
                                    <th>Customer ID</th>
                                    <th>Rec Name</th>
                                    <th>Rec Address</th>
                                    <th>Rec Phone</th>
                                    <th>Total Money</th>
                                    <th>Bill Detail</th>
                                    <th>Bill Detail</th>
                                    <th>Delete</th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listgetAllBill}" var="c">
                                    <tr>
                                        <td><a href="managerBillDetail?hid=${c.id}">View Detail</a></td>
                                        <td>${c.id}</td>
                                        <td>${c.date}</td>
                                        <td>${c.cid}</td>
                                        <td>${c.name}</td>
                                        <td>${c.address}</td>
                                        <td>${c.phone}</td>
                                        <td>$${c.total}</td>
                                        <td>${c.description}</td>
                                        <td><form action="ControllerBill?action=changeStatus&bid=${c.id}" method="POST">
                                                <select name="selectStatus"  ${(c.status == 2 ? "disabled" : "")} onchange="this.form.submit()">
                                                    <option value="0" ${(c.status == 0 ? "selected" : "")}>Wait</option>
                                                    <option value="1" ${(c.status == 1 ? "selected" : "")}>Process</option>
                                                    <option value="2" ${(c.status == 2 ? "selected" : "")}>Done</option>
                                                </select>
                                            </form></td>
                                            <c:if test="${c.status == 2}">
                                            <td><a href="ControllerBill?action=delete&bid=${c.id}"onclick="return confirm('Do you want to delete')">Delete</a></td>
                                        </c:if>

                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <div id="bottom_pagger" style="text-align: center; margin-top: 50px"></div>
                        <script>
                            renderPaggerB("bottom_pagger",${requestScope.pageIndexB}, ${requestScope.totalPageB}, 2);
                        </script>
                    </div>
                </div>
            </div>
        </c:if>

    </body>
</html>
