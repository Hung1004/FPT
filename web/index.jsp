<%-- 
    Document   : index
    Created on : Mar 17, 2021, 8:58:34 AM
    Author     : Hùng
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <title>Home Shoppe Website</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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

            <div class="header_slide">
                <div class="header_bottom_left">
                    <div class="categories">
                        <ul>
                            <form action="detailControl" method="post">
                                <h3>Categories</h3>
                                <li ><a href="detailControl?cid=0">TẤT CẢ SẢN PHẨM</a></li>
                                    <c:forEach items="${listgetAllCategory}" var="o">
                                    <li ><a href="detailControl?cid=${o.id}">${o.name}</a></li>
                                    </c:forEach>
                            </form>
                        </ul>
                    </div>
                </div>
                <div class="header_bottom_right">
                    <div class="slider">
                        <div id="slider">
                            <div id="mover">
                                <div id="slide-1" class="slide">
                                    <div class="slider-img">
                                        <img src="images/hodu_banner.png" style="padding-top: 50px" height="250px"
                                             alt="learn more" />
                                    </div>
                                    <div class="slider-text">
                                        <h1>Clearance<br><span>SALE</span></h1>
                                        <h2>UPTo 50% OFF</h2>
                                        <div class="features_list">
                                            <h4>Get to Know More About Our Memorable Services Lorem Ipsum is simply
                                                dummy text</h4>
                                        </div>
                                        <a href="#" class="button">Shop Now</a>
                                    </div>
                                    <div class="clear"></div>
                                </div>
                                <c:forEach items="${listgetTopProduct1}" var="o">
                                    <div class="slide">
                                        <div class="slider-text">
                                            <h1>${o.name}<br><span>SALE</span></h1>
                                                <c:if test="${o.sale==0}">
                                                <h2>Super New</h2>
                                            </c:if>
                                            <c:if test="${o.sale!=0}">
                                                <h2>UPTo ${o.sale} OFF</h2>
                                            </c:if>

                                            <div class="features_list">
                                                <h4>Get to Know More About Our Memorable Services</h4>
                                            </div>
                                            <a href="#" class="button">Shop Now</a>
                                        </div>
                                        <div class="slider-img">
                                            <a href="previewControl?cid=${o.cid}&id=${o.id}"><img src="images/${o.image}" style="padding-top: 30px"
                                                                                                  alt="learn more" /></a>
                                        </div>
                                        <div class="clear"></div>
                                    </div>
                                </c:forEach>

                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <div class="main">

            <div class="content">
                <div class="content_top">
                    <div class="heading">
                        <h3>New Products</h3>
                    </div>
                    <div class="see">
                        <p><a href="detailControl?cid=0">See all Products</a></p>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="section group">
                    <c:forEach items="${listgetTopProduct}" var="o">
                        <c:if test="${o.quantity==0}">
                            <div class="grid_1_of_4 images_1_of_4" >
                                <span style="-webkit-box-align: center;
                                      position: absolute;
                                      left: 0;
                                      top: 0;
                                      line-height: 1;
                                      border-bottom-right-radius: 1px;
                                      border-bottom-left-radius: 1px;
                                      width: 50px;
                                      height: 40px;
                                      align-items: center;
                                      -webkit-box-pack: center;
                                      justify-content: center;
                                      opacity: .9; 
                                      box-sizing: border-box;
                                      right:  5px ;
                                      background: #b11f24;
                                      bottom: -5px;
                                      ">
                                    <p style="margin-bottom: 5px;  font-size: 20px; top: 20px;color: #fff;">
                                        New
                                    </p>
                                </span>
                                <img src="images/${o.image}" alt="${o.image}" height="150px" width="250px" />
                                <h2>${o.name} </h2>
                                <div class="price-details">
                                    <div class="price-number">
                                        <p><span class="rupees">$${o.price}</span></p>
                                    </div>
                                    <div class="add-cart">
                                        <h4 style="padding-top: 0px; height: 38px; width: 50px; background: red;">Hết Hàng</h4>
                                    </div>
                                    <div class="clear"></div>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${o.quantity!=0}">
                            <div class="grid_1_of_4 images_1_of_4">
                                <span style="-webkit-box-align: center;
                                      position: absolute;
                                      left: 0;
                                      top: 0;
                                      line-height: 1;
                                      border-bottom-right-radius: 1px;
                                      border-bottom-left-radius: 1px;
                                      width: 50px;
                                      height: 40px;
                                      align-items: center;
                                      -webkit-box-pack: center;
                                      justify-content: center;
                                      opacity: .9; 
                                      box-sizing: border-box;
                                      right:  5px ;
                                      background: #b11f24;
                                      bottom: -5px;
                                      ">
                                    <p style="margin-bottom: 5px;  font-size: 20px; top: 20px;color: #fff;">
                                        New
                                    </p>
                                </span>
                                <a href="previewControl?cid=${o.cid}&id=${o.id}"><img src="images/${o.image}" alt="${o.image}" height="150px" width="250px" /></a>
                                <h2>${o.name} </h2>
                                <div class="price-details">
                                    <c:if test="${o.sale!=0}">
                                        <div class="price-number">
                                            <p><span class="rupees"><strike>$${o.price} </strike></span></p>
                                        </div>
                                        <div>
                                            <p style="margin-top: 5px; right: 0px;"><span style="height:50px;font-size: 25px;  width: 50px; background-color: yellow; text-align: right">$${o.price-o.sale*o.price/100}</span></p>
                                        </div>
                                    </c:if>
                                    <c:if test="${o.sale==0}">
                                        <div class="price-number">
                                            <p><span class="rupees" >$${o.price}</span></p>
                                        </div>
                                        <div class="add-cart">
                                            <h4 style="padding-top: 0px; height: 38px; width: 50px; background: yellow;">Còn Hàng</h4>
                                        </div>
                                    </c:if>
                                    <div class="clear"></div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="content_bottom">
                    <div class="heading">
                        <h3>Feature Products</h3>
                    </div>
                    <div class="see">
                        <p><a href="detailControl?cid=0">See all Products</a></p>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="section group">
                    <c:forEach items="${listgetTopSoldProduct}" var="o">
                        <c:if test="${o.quantity==0}">
                            <div class="grid_1_of_4 images_1_of_4" >
                                <span style="-webkit-box-align: center;
                                      position: absolute;
                                      left: 0;
                                      top: 0;
                                      line-height: 1;
                                      border-bottom-right-radius: 1px;
                                      border-bottom-left-radius: 1px;
                                      width: 50px;
                                      height: 40px;
                                      align-items: center;
                                      -webkit-box-pack: center;
                                      justify-content: center;
                                      opacity: .9; 
                                      box-sizing: border-box;
                                      right:  5px ;
                                      background: #b11f24;
                                      bottom: -5px;
                                      ">
                                    <p style="margin-bottom: 5px;  font-size: 20px; top: 20px;color: #fff;">
                                        New
                                    </p>
                                </span>
                                <img src="images/${o.image}" alt="${o.image}" height="150px" width="250px" />
                                <h2>${o.name} </h2>
                                <div class="price-details">
                                    <div class="price-number">
                                        <p><span class="rupees">$${o.price}</span></p>
                                    </div>
                                    <div class="add-cart">
                                        <h4 style="padding-top: 0px; height: 38px; width: 50px; background: red;">Hết Hàng</h4>
                                    </div>
                                    <div class="clear"></div>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${o.quantity!=0}">
                            <div class="grid_1_of_4 images_1_of_4">
                                                                <span style="-webkit-box-align: center;
                                      position: absolute;
                                      left: 0;
                                      top: 0;
                                      line-height: 1;
                                      border-bottom-right-radius: 1px;
                                      border-bottom-left-radius: 1px;
                                      width: 50px;
                                      height: 40px;
                                      align-items: center;
                                      -webkit-box-pack: center;
                                      justify-content: center;
                                      opacity: .9; 
                                      box-sizing: border-box;
                                      right:  5px ;
                                      background: #b11f24;
                                      bottom: -5px;
                                      ">
                                    <p style="margin-bottom: 5px;  font-size: 20px; top: 20px;color: #fff;">
                                        New
                                    </p>
                                </span>
                                <a href="previewControl?cid=${o.cid}&id=${o.id}"><img src="images/${o.image}" alt="${o.image}" height="150px" width="250px" /></a>
                                <h2>${o.name} </h2>
                                <div class="price-details">
                                    <c:if test="${o.sale!=0}">
                                        <div class="price-number">
                                            <p><span class="rupees"><strike>$${o.price}</strike></span></p>
                                        </div>
                                        <div>
                                            <p style="margin-top: 5px; right: 0px;"><span style="height:50px;font-size: 25px;  width: 50px; background-color: yellow; text-align: right">$${o.price-o.sale*o.price/100}</span></p>
                                        </div>
                                    </c:if>
                                    <c:if test="${o.sale==0}">
                                        <div class="price-number">
                                            <p><span class="rupees" >$${o.price}</span></p>
                                        </div>
                                        <div class="add-cart">
                                            <h4 style="padding-top: 0px; height: 38px; width: 50px; background: yellow;">Còn Hàng</h4>
                                        </div>
                                    </c:if>
                                    <div class="clear"></div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach> 
                </div>
            </div>




        </div>
    </div>
    <div class="footer">
        <div class="wrap">
            <div class="section group">
                <div class="col_1_of_4 span_1_of_4">
                    <h4>Information</h4>
                    <ul>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Customer Service</a></li>
                        <li><a href="#">Advanced Search</a></li>
                        <li><a href="#">Orders and Returns</a></li>
                        <li><a href="#">Contact Us</a></li>
                    </ul>
                </div>
                <div class="col_1_of_4 span_1_of_4">
                    <h4>Why buy from us</h4>
                    <ul>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Customer Service</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Site Map</a></li>
                        <li><a href="#">Search Terms</a></li>
                    </ul>
                </div>
                <div class="col_1_of_4 span_1_of_4">
                    <h4>My account</h4>
                    <ul>
                        <li><a href="#">Sign In</a></li>
                        <li><a href="#">View Cart</a></li>
                        <li><a href="#">My Wishlist</a></li>
                        <li><a href="#">Track My Order</a></li>
                        <li><a href="#">Help</a></li>
                    </ul>
                </div>
                <div class="col_1_of_4 span_1_of_4">
                    <h4>Contact</h4>
                    <ul>
                        <li><span>098989898</span></li>
                    </ul>
                    <div class="social-icons">
                        <h4>Follow Us</h4>
                        <ul>
                            <li><a href="#" target="_blank"><img src="images/facebook.png" alt="" /></a></li>
                            <li><a href="#" target="_blank"><img src="images/twitter.png" alt="" /></a></li>
                            <li><a href="#" target="_blank"><img src="images/skype.png" alt="" /> </a></li>
                            <li><a href="#" target="_blank"> <img src="images/dribbble.png" alt="" /></a></li>
                            <li><a href="#" target="_blank"> <img src="images/linkedin.png" alt="" /></a></li>
                            <div class="clear"></div>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="copy_right">
            <p>&copy; 2013 home_shoppe. All rights reserved
            </p>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $().UItoTop({easingType: 'easeOutQuart'});

        });
    </script>
    <a href="#" id="toTop"><span id="toTopHover"> </span></a>
</body>

</html>
