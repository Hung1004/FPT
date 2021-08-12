<%-- 
    Document   : adminUpdateProduct
    Created on : Mar 27, 2021, 9:39:42 PM
    Author     : Hùng
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        
        <div class="modal-dialog">
            <div class="modal-content">


                <c:forEach items="${listgetProductById}" var="o">
                    <form action="updateProduct?pid=${o.id}&img=${o.image}" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Update Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" class="form-control" value="${o.name}" required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input name="image" type="file" class="form-control">
                                <p >
                                Old image:   <img src="images/${o.image}" height="50px"  width="100px" alt="${o.image}"/>
                                </p>

                            </div>
                            <div class="form-group">
                                <label>Quantity</label>
                                <input name="quantity" type="text" class="form-control" value="${o.quantity}" required>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input name="price" type="text" class="form-control" value="${o.price}" required>
                            </div>
                            <div class="form-group">
                                <label>Sale</label>
                                <input name="sale" type="text" class="form-control" value="${o.sale}" required>
                            </div>
                            <div class="form-group">
                                <label>Sold</label>
                                <input name="sold" type="text" class="form-control" value="${o.sold}" required>
                            </div>
                            <div class="form-group">
                                <label>Size</label>
                                <input name="size" type="text" class="form-control" value="${o.size}" required>
                            </div>
                            <div class="form-group">
                                <label>Color</label>
                                <input name="color" type="text" class="form-control" value="${o.color}" required>
                            </div>
                            <div class="form-group">
                                <label>Title</label>
                                <input name="title" type="text" class="form-control" value="${o.title}" required>
                            </div>

                            <div class="form-group">
                                <label>Description</label>
                                <input name="description" class="form-control"  value="${o.description}" required>
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <select name="category" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${listgetAllCategory}" var="d">
                                        <option ${o.cid == d.id?"selected":""} value="${d.id}">${d.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <a href="managerProduct" class="btn btn-success"><span>Back</span></a>
                            <input type="submit" class="btn btn-success" value="Update">
                        </div>
                    </form>
                </c:forEach>
            </div>
        </div>
        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>
