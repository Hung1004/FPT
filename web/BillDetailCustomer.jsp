<%-- 
    Document   : index
    Created on : Mar 17, 2021, 8:58:34 AM
    Author     : Hùng
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/slider.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
        <script type="text/javascript" src="js/move-top.js"></script>
        <script type="text/javascript" src="js/easing.js"></script>
        <script type="text/javascript" src="js/startstop-slider.js"></script>
    </head>

    <body>
        <div class="wrap">
            <div class="header">
                <div class="headertop_desc">
                    <div class="call">
                        <p><span>Need help?</span> call us <span class="number">098989898</span></span></p>
                    </div>
                    <div class="account_desc">
                        <ul>
                            <c:if test="${sessionScope.listC==null}">
                                <li><a href="customerRegister.jsp">Register</a></li>
                                <li><a href="customerLogin.jsp">Login</a></li>
                                </c:if>
                                <c:if test="${sessionScope.listC!=null}">
                                <li style="color: #9C9C9C;font-size: 15px;">${sessionScope.listC.name}</li>
                                <li><a href="logout">Checkout</a></li>
                                <li><a href="Cart.jsp">My Account</a></li>
                                </c:if>
                        </ul>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="header_top">
                    <div class="logo">
                        <a href="homeControl"><img src="images/logo.png" alt="" /></a>
                    </div>
                    <div class="cart">
                        <p>Welcome to our Online Store!
                             <span><a href="Cart.jsp">Cart:</a></span>
                            <c:if test="${sessionScope.numProduct==0}" var="o">
                            <div id="dd" class="wrapper-dropdown-2"> 0 item(s) - $0.00
                                <ul class="dropdown">
                                    <li>you have 0 items in your Shopping cart</li>
                                </ul>
                            </div> 
                        </c:if>
                        <c:if test="${sessionScope.numProduct!=0}" var="o">
                            <div id="dd" class="wrapper-dropdown-2"> ${numProduct} item(s) - $${total}
                                <ul class="dropdown">
                                    <li>you have ${numProduct} items in your Shopping cart</li>
                                </ul>
                            </div> 
                        </c:if>
                        </p>
                    </div>
                    <script type="text/javascript">
                        function DropDown(el) {
                            this.dd = el;
                            this.initEvents();
                        }
                        DropDown.prototype = {
                            initEvents: function () {
                                var obj = this;

                                obj.dd.on('click', function (event) {
                                    $(this).toggleClass('active');
                                    event.stopPropagation();
                                });
                            }
                        }

                        $(function () {

                            var dd = new DropDown($('#dd'));

                            $(document).click(function () {
                                // all dropdowns
                                $('.wrapper-dropdown-2').removeClass('active');
                            });

                        });

                    </script>
                    <div class="clear"></div>
                </div>
                <div class="header_bottom">
                    <div class="menu">
                        <ul>
                            <li class="active"><a href="homeControl">Home</a></li>
                            <li><a href="detailControl?cid=0">Detail</a></li>
                            <div class="clear"></div>
                        </ul>
                    </div>

                    <div class="search_box">
                        <form action="searchControl" method="post">
                            <input name="txt" type="text" value="Search" onfocus="this.value = '';"
                                   onblur="if (this.value == '') {
                                               this.value = 'Search';
                                           }"><input type="submit" value="">
                        </form>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>

        <a href="Cart.jsp"  class="btn btn-success" style="background-color: #2A5C86; margin-left: 10%; margin-top: 20px;"> <span>Giỏ hàng</span></a>
        <a href="billDetailCustomer"  class="btn btn-success" style="background-color: #B81D22;margin-top: 20px;"> <span>Đơn mua</span></a>

            <div class="shopping-cart">
                <div class="px-4 px-lg-0">

                    <div class="pb-5">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">

                                    <!-- Shopping cart table -->
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col" class="border-0 bg-light">
                                                        <div class="p-2 px-3 text-uppercase">Hình ảnh</div>
                                                    </th>
                                                    <th scope="col" class="border-0 bg-light">
                                                        <div class="py-2 text-uppercase">Tên sản phẩm</div>
                                                    </th>
                                                    <th scope="col" class="border-0 bg-light">
                                                        <div class="py-2 text-uppercase">Ngày mua</div>
                                                    </th>
                                                    <th scope="col" class="border-0 bg-light">
                                                        <div class="py-2 text-uppercase">Số lương</div>
                                                    </th>
                                                    <th scope="col" class="border-0 bg-light">
                                                        <div class="py-2 text-uppercase">Đơn Giá</div>
                                                    </th>
                                                    <th scope="col" class="border-0 bg-light">
                                                        <div class="py-2 text-uppercase">Tổng tiền</div>
                                                    </th>
                                                    <th scope="col" class="border-0 bg-light">
                                                        <div class="py-2 text-uppercase">Status</div>
                                                    </th>
                                                    <th scope="col" class="border-0 bg-light">
                                                        <div class="py-2 text-uppercase">Action</div>
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${listgetAllDB}" var="o">
                                                    <tr>
                                                        <th scope="row">
                                                            <div class="p-2">
                                                                <img src="images/${o.image}" alt="${o.image}" width="70px" height="34px" class="img-fluid rounded shadow-sm">
                                                            </div>
                                                        </th>
                                                        <td class="align-middle"><strong>${o.name}</strong></td>
                                                        <td class="align-middle"><strong>${o.date}</strong></td>
                                                        <td class="align-middle"><strong>${o.quantity}</strong></td>
                                                        <td class="align-middle"><strong>$${o.price}</strong></td>
                                                        <td class="align-middle"><strong>$${o.subtotal}</strong></td>
                                                        <c:if test="${o.status==0}">
                                                            <td class="align-middle"><strong>Wait</strong></td>
                                                            <td class="align-middle"><strong><a href="deleteBillDetailCustomer?hid=${o.hid}&pid=${o.pid}&quan=${o.quantity}&totalB=${o.subtotal}" onclick="return confirm('Do you want to delete')">Delete</a></strong></td>
                                                        </c:if>
                                                        <c:if test="${o.status==1}">
                                                            <td class="align-middle"><strong>Process</strong></td>
                                                        </c:if>
                                                        <c:if test="${o.status==2}">
                                                            <td class="align-middle"><strong>Done</strong></td>
                                                        </c:if>
                                                    </tr> 
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- End -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <script src="js/manager.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>

</html>
</html>
