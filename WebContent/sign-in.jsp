<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<link rel="icon" href="images/favicon.png">
	<title>Nutri Paradise</title>

	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/semantic.css">
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">
	<link rel="stylesheet" href="css/style.css">

</head>
<body>
	
	<!-- sidebar left -->
		<!-- sidebar left -->
		<div class="ui sidebar sidebar-left inverted vertical menu">
		<div class="user-profile">
			<img src="images/profile.png" alt="">
			<h4>User</h4>
		</div>
		<div class="ui styled accordion">
			<div class="title">
				<i class="fa fa-home"></i>
				<a href="index.jsp">Home</a>
			</div>
			<div class="title">
				<i class="fa fa-list-alt"></i>
			<a href="cart.jsp">Buy</a>
				
			</div>
			
			<div class="title">
				<i class="fa fa-shopping-basket"></i>
				<a href="product-details.jsp">Product Details</a>
				
			</div>
			<div class="title">
				<i class="fa fa-cart-plus"></i>
				<a href="cart.jsp" >Cart</a>
				
			</div>
			<div class="title">
				<i class="fa fa-car"></i>
				Order
				<span><i class="dropdown icon"></i></span>
			</div>
			<div class="content">
				<a href="tracking-order.jsp" class="item">Tracking Order</a>
				<a href="order-history.jsp" class="item">Order History</a>
			</div>
			<div class="title">
				<i class="fa fa-user"></i>
				<a href="profile-buyer.jsp" >Profile</a>
				
			</div>
				<div class="title">
				<i class="fa fa-file-text-o"></i>
				<a href="favourite.jsp">Favourite</a>
				
			</div>
		
			<div class="title">
				<i class="fa fa-file-text-o"></i>
				<a href="about.jsp">About</a>
				
			</div>
			
			<div class="title">
				<i class="fa fa-file-text-o"></i>
				<a href="#">Agreement</a>
				
			</div>
			
		</div>
		<a href="contact.jsp" class="item"><i class="fa fa-envelope-o"></i>Contact us</a>
		<a href="sign-in.jsp" class="item"><i class="fa fa-sign-in"></i>Sign in</a>
		<a href="#" class="item"><i class="fa fa-user-plus"></i>Sign up</a>
		<a href="index.jsp" class="item"><i class="fa fa-share"></i>Log out</a>
	</div>
	<!-- end sidebar left -->

	<!-- sidebar search -->
	<div class="ui sidebar search inverted right vertical menu">
		<div class="ui form">
			<input type="search"><button class="button"><i class="fa fa-search"></i></button>
		</div>
		<h5>Popular Search</h5>
		<ul>
			<li><a href="">Nutri Top Product1</a></li>
			<li><a href="">Nutri Top Product2</a></li>
			<li><a href="">Nutri Top Product3</a></li>
			
		</ul>
	</div>
	<!-- end sidebar search -->
	<!-- sidebar cart -->
	<div class="ui sidebar cart inverted right vertical menu">
		<div class="content">
			<div class="cart-img">
				<img src="images/product1.png" alt="">
			</div>
			<div class="cart-title">
				<a href="">Watch Modern for Men & Women</a>
				<h5>$69</h5>
			</div>
			<div class="cart-remove">
				<i class="fa fa-remove"></i>
			</div>
			<div class="clear"></div>
		</div>
		<div class="content">
			<div class="cart-img">
				<img src="images/product2.png" alt="">
			</div>
			<div class="cart-title">
				<a href="">Women Bags Trending for Girls</a>
				<h5>$94</h5>
			</div>
			<div class="cart-remove">
				<i class="fa fa-remove"></i>
			</div>
			<div class="clear"></div>
		</div>
		<div class="content">
			<div class="cart-img">
				<img src="images/product3.png" alt="">
			</div>
			<div class="cart-title">
				<a href="">Hat Blue Trending for Men & Women</a>
				<h5>$79</h5>
			</div>
			<div class="cart-remove">
				<i class="fa fa-remove"></i>
			</div>
			<div class="clear"></div>
		</div>
		<div class="cart-button">
			<ul>
				<li><button class="button"><i class="fa fa-shopping-cart"></i>View Cart</button></li>
				<li><button class="button"><i class="fa fa-send"></i>Checkout</button></li>
			</ul>
		</div>
	</div>
	<!-- end sidebar cart -->

	<!-- wrap content -->
	<div class="wrap-content pusher">

		<!-- navbar -->
		<div class="navbar">
			<div class="ui container">
				<div class="ui grid">
					<!-- navbar toggle left -->
					<div class="five wide column">
						<div class="navbar-toggle-left navbar-icon">
							<i class="fa fa-navicon"></i>
						</div>
					</div>
					<!-- navbar logo -->
					<div class="six wide column">
						<div class="navbar-logo">
							<a href="index.html"><img src="images/logo2.png" alt=""></a>
						</div>
					</div>
					<!-- navbar toggle right -->
					<div class="five wide column">
						<div class="navbar-toggle-right">
							<div class="navbar-toggle-search">
								<i class="fa fa-search"></i>
							</div>
							<div class="navbar-toggle-cart">
								<i class="fa fa-shopping-cart"><sup>3</sup></i>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end navbar -->
		
		<!-- sign in -->
		<div class="sign-in segments-page">
			<div class="ui container">
				<div class="pages-title">
					<h3>Sign In</h3>
				</div>
				<form class="ui form" method="post" action="LoginServlet">
					<div class="field">
						<input type="text" name="user" placeholder="Username">
					</div>
					
					<div class="field">
						<input type="password" name="pwd"placeholder="Password">
					</div>
					<p><a href="">Lost Password ?</a></p>
					<button class="button">Sign In</button>
				</form>
				<div class="social-login">
					<h5>Sign In with</h5>
					<div class="ui grid">
						<div class="eight wide column pr">
							<button class="button-full button-facebook">Facebook</button>
						</div>
						<div class="eight wide column pl">
							<button class="button-full button-twitter">Twitter</button>
						</div>
						<div class="eight wide column pr">
							<button class="button-full button-linkedin">Linkedin</button>
						</div>
						<div class="eight wide column pl">
							<button class="button-full button-google">Google+</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end sign in -->

		<!-- footer -->
		<footer>
			<div class="ui container">
				<div class="content">
					<img src="images/logo2.png" alt="" class="logo">
					<p>Address: #729, 10th Main, Jayanagar 4th Block, Behind BSNL Telephone Exchange, Opp MES School, Bengaluru-560 011</p>
					<p>Email: contact@nutri.com</p>
					<p>Phone: +919876543210</p>
					<div class="social-link">
						<a href=""><i class="fa fa-facebook"></i></a>
						<a href=""><i class="fa fa-twitter"></i></a>
						<a href=""><i class="fa fa-instagram"></i></a>
						<a href=""><i class="fa fa-google"></i></a>
					</div>
					<div class="payment-logo">
						<ul>
							<li><img src="images/payment1.png" alt=""></li>
							<li><img src="images/payment2.png" alt=""></li>
							<li><img src="images/payment3.png" alt=""></li>
							<li><img src="images/payment4.png" alt=""></li>
							<li><img src="images/payment5.png" alt=""></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="reserved">
				<p>Copyright © All Right Reserved</p>
			</div>
		</footer>
		<!-- end footer -->

	</div>
	<!-- end wrap content -->

	

	<script src="js/jquery.min.js"></script>
	<script src="js/semantic.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>

</body>
</html>