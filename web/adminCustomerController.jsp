<%-- 
    Document   : adminCustomerController
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
                    <h1 style="text-align: center">Customer Manager</h1>
                    <form action="ControllerCustomer?action=searchName" method="POST" style="text-align: center">
                        <lable>Search by name: <input type="text" name="search" value="${search}"></lable>
                        <input type="hidden" name="action" value="submited" />
                        <input type="submit" value="Search" />
                    </form>
                    <table border="1">
                        <thead>
                            <tr>
                                <th>Customer ID</th>
                                <th>Fullname</th>
                                <th>Address</th>
                                <th>Phone</th>
                                <th>Username</th>
                                <th>Password</th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listgetAllCustomer}" var="c">
                                <tr>
                                    <td>${c.cid}</td>
                                    <td>${c.name}</td>
                                    <td>${c.address}</td>
                                    <td>${c.phone}</td>
                                    <td>${c.username}</td>
                                    <td>${c.pass}</td>
                                   
                                    <td><a href="ControllerCustomer?action=preUpdate&cid=${c.cid}">Update</a></td>
                                    <td><a href="ControllerCustomer?action=delete&cid=${c.cid}" 
                                           onclick="return confirm('Do you want to delete')">Delete</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div id="bottom_pagger" style="text-align: center; margin-top: 50px"></div>
                    <script>
                        renderPaggerCu("bottom_pagger",${requestScope.pageIndexCu}, ${requestScope.totalPageCu}, 2);
                    </script>
                </div>
            </div>
        </div>
        <div id="addEmployeeModal" class="modal fade">
            <form action="billControl" method="post">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">						
                            <h4 class="modal-title">Information</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Phone</label>
                                <input name="phone" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Address</label>
                                <input name="address" type="text" class="form-control" required>
                            </div>

                            <div class="form-group">
                                <label>Description</label>
                                <textarea name="description" class="form-control" required></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Buy">
                        </div>
                    </div>
                </div>
            </form>
        </div>
        </c:if>
    </body>
</html>
