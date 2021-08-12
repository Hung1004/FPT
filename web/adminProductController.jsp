<%-- 
    Document   : adminProductController
    Created on : Mar 17, 2021, 8:58:34 AM
    Author     : Hùng
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        <c:if test="${sessionScope.listAd !=null}">
            <div class="menu">
                <div class="top">
                    <h2>Welcome ${sessionScope.listAd.fullname}</h2>
                </div>
                <div class="bot">
                    <a href="logout">Logout</a>
                </div>
                <a href="adminController"><button type="button" class="btn btn-primary">home</button>

            </div>
            <div class="container">
                <div class="table-wrapper">

                    <table class="table table-striped table-hover">
                        <div class="table-title">
                            <div class="row">
                                <div class="col-sm-6">
                                    <h2>Manage Product</h2>
                                </div>
                                <div class="col-sm-6">
                                    <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>
                                </div>
                            </div>
                        </div>
                        <thead>
                            <tr>
                                <th>Product ID</th>
                                <th>Product Name</th>
                                <th>Image</th>
                                <th>Price</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${getAllProductPaging}" var="o">
                                <tr>
                                    <td>${o.id}</td>
                                    <td>${o.name}</td>
                                    <td>
                                        <img src="images/${o.image}">
                                    </td>
                                    <td>$${o.price}</td>
                                    <td>
                                        <a href="preupdate?pid=${o.id}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                        <a href="deleteProduct?options=${o.id}" class="delete" data-toggle="modal" onclick="return confirm('Do you want to delete')"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>

                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="clearfix">
                        <div class="hint-text">Showing <b>10</b> out of <b>${sumproduct}</b> entries</div>
                        <ul class="pagination">
                            <c:if test="${index==1}">
                                <li class="page-item disabled"><a href="#">Previous</a></li>
                                </c:if>
                                <c:if test="${index!=1}">
                                <li class="page-item "><a href="managerProduct?index=${index-1}">Previous</a></li>
                                </c:if>

                            <c:forEach  begin="1" end="${SumPage}" var="s">
                                <li class="page-item ${index == s?"active":""}"><a href="managerProduct?index=${s}" class="page-link">${s}</a></li>
                                </c:forEach>
                                <c:if test="${index==SumPage}">
                                <li class="page-item disabled"><a href="#">Next</a></li>
                                </c:if>
                                <c:if test="${index!=SumPage}">
                                <li class="page-item "><a href="managerProduct?index=${index+1}">Next</a></li>
                                </c:if>
                        </ul>
                    </div>
                </div>
                <a href="adminController"><button type="button" class="btn btn-primary">Back to home</button></a>
            </div>
            <!-- Edit Modal HTML -->
            <div id="addEmployeeModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="addProduct" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Add Product</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>Name</label>
                                    <input name="name" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Image</label>
                                    <input name="image" type="file" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Quantity</label>
                                    <input name="quantity" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Price</label>
                                    <input name="price" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Sale</label>
                                    <input name="sale" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Size</label>
                                    <input name="size" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Color</label>
                                    <input name="color" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Title</label>
                                    <input name="title" type="text" class="form-control" required>
                                </div>

                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea name="description" class="form-control" required></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Category</label>
                                    <select name="category" class="form-select" aria-label="Default select example">
                                        <c:forEach items="${listCategory}" var="o">
                                            <option value="${o.id}">${o.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Back">
                                <input type="submit" class="btn btn-success" value="Add">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <script src="js/manager.js" type="text/javascript"></script>
        </c:if>
    </body>
</html>