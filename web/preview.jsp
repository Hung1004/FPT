<%-- 
    Document   : preview
    Created on : Mar 17, 2021, 8:56:40 AM
    Author     : Hùng
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Free Home Shoppe Website Template | Preview :: w3layouts</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
        <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script> 
        <script type="text/javascript" src="js/move-top.js"></script>
        <script type="text/javascript" src="js/easing.js"></script>
        <script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
        <link href="css/easy-responsive-tabs.css" rel="stylesheet" type="text/css" media="all"/>
        <link rel="stylesheet" href="css/global.css">
        <script src="js/slides.min.jquery.js"></script>
        <script>
            $(function () {
                $('#products').slides({
                    preload: true,
                    preloadImage: 'img/loading.gif',
                    effect: 'slide, fade',
                    crossfade: true,
                    slideSpeed: 350,
                    fadeSpeed: 500,
                    generateNextPrev: true,
                    generatePagination: false
                });
            });
        </script>
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
                        <form>
                            <input type="text" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {
                                        this.value = 'Search';
                                    }"><input type="submit" value="">
                        </form>
                    </div>
                    <div class="clear"></div>
                </div>	     	
            </div>
            <div class="main">
                <div class="content">
                    <div class="content_top">
                        <div class="back-links">
                            <p><a href="homeControl">Home</a> >>>> <a href="#">Shoes</a></p>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="section group">
                        <div class="cont-desc span_1_of_2">
                            <div class="product-details">
                                <c:forEach items="${listgetProductById}" var="o">
                                    <div class="grid images_3_of_2">
                                        <div id="container">
                                            <div id="products_example">
                                                <div id="products">
                                                    <div class="slides_container">
                                                        <img src="images/${o.image}" style="top: 50px" alt="${o.image}" />
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <form action="addCartProduct?idCard=${o.id}&action=1" method="post">
                                        <div class="desc span_3_of_2">
                                            <h2>${o.name}</h2>
                                            <p>${o.description}</p>
                                            <div class="price">
                                                <p>Price: <span>$${o.price-o.sale*o.price/100}</span></p>
                                            </div>
                                            <div class="available">
                                                <p>Available Options :</p>
                                                <ul>
                                                    <li>Color:
                                                        <select>
                                                            <option>${o.color}</option>
                                                        </select></li>
                                                    <li>Size:<select>
                                                            <option>${o.size}</option>
                                                        </select></li>
                                                    <li>Quality:<select  name="numquan">
                                                            <c:forEach begin="1" end="${sumQuantity}" var="c">
                                                                <option value="${c}">${c}</option>
                                                            </c:forEach>
                                                        </select></li>
                                                </ul>
                                            </div>
                                            <div class="share-desc">
                                                <div class="share">
                                                    <p>Share Product :</p>
                                                    <ul>
                                                        <li><a href="#"><img src="images/facebook.png" alt="" /></a></li>
                                                        <li><a href="#"><img src="images/twitter.png" alt="" /></a></li>					    
                                                    </ul>
                                                </div>
                                                <div class="button"><input style="height: 50px; width: 100px; background-color: tan;" type="submit" value="Add to Cart"></div>	
                                                <div class="clear"></div>
                                            </div>
                                            <div class="wish-list">
                                                <ul>
                                                    <li class="wish"><a href="#">Add to Wishlist</a></li>
                                                    <li class="compare"><a href="#">Add to Compare</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </form>
                                    <div class="clear"></div>
                                </c:forEach>
                            </div>

                            <div class="product_desc">	
                                <div id="horizontalTab">
                                    <ul class="resp-tabs-list">
                                        <li>Product Details</li>
                                        <li>product Tags</li>
                                        <li>Product Reviews</li>
                                        <div class="clear"></div>
                                    </ul>
                                    <div class="resp-tabs-container">
                                        <div class="product-desc">
                                            <p>Lorem Ipsum is simply dummy </p>
                                        </div>

                                        <div class="product-tags">
                                            <p>Lorem Ipsum isessentially unchanged.</p>
                                            <h4>Add Your Tags:</h4>
                                            <div class="input-box">
                                                <input type="text" value="">
                                            </div>
                                            <div class="button"><span><a href="#">Add Tags</a></span></div>
                                        </div>	

                                        <div class="review">
                                            <h4>Lorem ipsum Review by <a href="#">Finibus Bonorum</a></h4>
                                            <ul>
                                                <li>Price :<a href="#"><img src="images/price-rating.png" alt="" /></a></li>
                                                <li>Value :<a href="#"><img src="images/value-rating.png" alt="" /></a></li>
                                                <li>Quality :<a href="#"><img src="images/quality-rating.png" alt="" /></a></li>
                                            </ul>
                                            <p>Lorem Ipsum is simply dummy remaining essentially unchanged.</p>
                                            <div class="your-review">
                                                <h3>How Do You Rate This Product?</h3>
                                                <p>Write Your Own Review?</p>
                                                <form>
                                                    <div>
                                                        <span><label>Nickname<span class="red">*</span></label></span>
                                                        <span><input type="text" value=""></span>
                                                    </div>
                                                    <div><span><label>Summary of Your Review<span class="red">*</span></label></span>
                                                        <span><input type="text" value=""></span>
                                                    </div>						
                                                    <div>
                                                        <span><label>Review<span class="red">*</span></label></span>
                                                        <span><textarea> </textarea></span>
                                                    </div>
                                                    <div>
                                                        <span><input type="submit" value="SUBMIT REVIEW"></span>
                                                    </div>
                                                </form>
                                            </div>				
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <script type="text/javascript">
                                $(document).ready(function () {
                                    $('#horizontalTab').easyResponsiveTabs({
                                        type: 'default', //Types: default, vertical, accordion           
                                        width: 'auto', //auto or any width like 600px
                                        fit: true   // 100% fit in a container
                                    });
                                });
                            </script>		
                            <div class="content_bottom">
                                <c:forEach items="${listgetProductById}" var="o">
                                    <div class="heading">
                                        <h3>Related Products</h3>
                                    </div>
                                    <div class="see">
                                        <p><a href="detailControl?cid=${o.cid}">See all Products</a></p>
                                    </div>
                                    <div class="clear"></div>
                                </c:forEach>
                            </div>
                            <div class="section group">
                                <c:forEach items="${listgetTopProductByCid}" var="o" >
                                    <div class="grid_1_of_4 images_1_of_4">
                                        <a href="#"><img src="images/${o.image}" alt="${o.image}" height="90px" ></a>					
                                        <div class="price" style="border:none">
                                            <div class="add-cart" style="float:none">								
                                                <h4><a href="previewControl?cid=${o.cid}&id=${o.id}">View Shoe</a></h4>
                                            </div>
                                            <div class="clear"></div>
                                        </div>
                                    </div>
                                </c:forEach>

                            </div>
                        </div>
                        <div class="rightsidebar span_3_of_1">
                            <h2>CATEGORIES</h2>
                            <ul class="side-w3ls">
                                <form action="detailControl" method="post">
                                    <li ><a href="detailControl?cid=0">TẤT CẢ SẢN PHẨM</a></li>
                                        <c:forEach items="${listgetAllCategory}" var="o">
                                        <li ><a href="detailControl?cid=${o.id}">${o.name}</a></li>
                                        </c:forEach>
                                </form>
                            </ul>
                        </div>
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
                <p>&copy; 2013 home_shoppe. All rights reserved | Design by <a href="http://w3layouts.com/">W3layouts</a></p>
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
