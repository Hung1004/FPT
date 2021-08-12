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
        <c:if test="${sessionScope.listC==null}">
            <a href="Cart.jsp"  class="btn btn-success" style="background-color: #B81D22; margin-left: 10%; margin-top: 20px;"> <span>Giỏ hàng</span></a>
        </c:if>
        <c:if test="${sessionScope.listC!=null}">
            <a href="Cart.jsp"  class="btn btn-success" style="background-color: #B81D22; margin-left: 10%; margin-top: 20px;"> <span>Giỏ hàng</span></a>
            <a href="billDetailCustomer"  class="btn btn-success" style="background-color: #2A5C86;margin-top: 20px;"> <span>Đơn mua</span></a>
        </c:if>
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
                                                    <div class="p-2 px-3 text-uppercase">Sản Phẩm</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Tên Sản Phẩm</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Đơn Giá</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Tổng Giá</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Số Lượng</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Xóa</div>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${sessionScope.listProduct}" var="o">
                                                <tr>
                                                    <td class="align-middle"><strong><img src="images/${o.image}" alt="${o.image}" width="70px" height="34px" class="img-fluid rounded shadow-sm"></strong></td>
                                                    <td class="align-middle"><strong><a href="previewControl?id=${o.id}&cid=${o.cid}" class="text-dark d-inline-block">${o.name}</a></strong></td>

                                                    <c:if test="${o.sale==0}">
                                                        <td class="align-middle"><strong>$${o.price}</strong></td>
                                                    </c:if>
                                                    <c:if test="${o.sale!=0}">
                                                        <td class="align-middle"><strong>$${o.price-o.price*o.sale/100}</strong></td>
                                                    </c:if>
                                                    <c:if test="${o.sale==0}">
                                                        <td class="align-middle"><strong>$${(o.price)*o.quantity}</strong></td>
                                                    </c:if>

                                                    <c:if test="${o.sale!=0}">
                                                        <td class="align-middle"><strong>$${(o.price-o.price*o.sale/100)*o.quantity}</strong></td>
                                                    </c:if>

                                                        <td class="align-middle" style="display:flex; padding-top: 35px">
                                                        <a href="SubCartProduct?idCard=${o.id}"><button class="btnSub">-</button></a> 
                                                        <form action="OnchangeCartProduct?idCard=${o.id}" method="POST">
                                                            <input type="text" value="${o.quantity}" name="quantityIn" onchange="this.form.submit()" style="height: 25px;width: 70px;">
                                                        </form>
                                                        <a href="addCartProduct?idCard=${o.id}&action=0"><button class="btnAdd">+</button></a>
                                                    </td>
                                                    <td class="align-middle"><a href="deleteCartControl?idCard=${o.id}&numProduct=${o.quantity}" class="text-dark">
                                                            <button type="button" class="btn btn-danger">Delete</button>
                                                        </a> 
                                                    </td>
                                                </tr> 
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- End -->
                            </div>
                        </div>

                        <div class="row py-5 p-4 bg-white rounded shadow-sm">

                            <div class="col-lg-6">
                                <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Thành tiền</div>
                                <div class="p-4">
                                    <c:if test="${sessionScope.listProduct!=null}" var="o">
                                        <ul class="list-unstyled mb-4">
                                            <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Tổng tiền hàng</strong><strong>${sessionScope.total}$</strong></li>
                                            <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Phí vận chuyển</strong><strong>Free ship</strong></li>
                                            <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">VAT</strong><strong>${sessionScope.VAT}$</strong></li>
                                            <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Tổng thanh toán</strong>
                                                <h5 class="font-weight-bold">${sessionScope.total+sessionScope.VAT}$</h5>
                                            </li>
                                        </ul>
                                    </c:if>
                                    <c:if test="${sessionScope.listC==null}">
                                        <a href="customerLogin.jsp" class="btn btn-success"><span>Đăng nhập để mua hàng</span></a>
                                    </c:if>
                                    <c:if test="${sessionScope.listC!=null}">
                                        <c:if test="${sessionScope.listProduct==null}">
                                            <a href="detailControl?cid=0"  class="btn btn-success"><i class="material-icons">&#xE147;</i> <span>Tiếp tục mua hàng</span></a>
                                        </c:if>
                                        <c:if test="${sessionScope.listProduct!=null}">
                                            <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Mua hàng</span></a>
                                        </c:if>
                                    </c:if>
                                    <!--                                    <a href="#addEmployeeModal" class="btn btn-dark rounded-pill py-2 btn-block">Mua hàng</a>-->
                                </div>
                            </div>
                        </div>
                    </div>
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
        <a href="homeControl">Back</a>
        <script src="js/manager.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>

</html>
</html>
