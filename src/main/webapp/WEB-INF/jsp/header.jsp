<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Favicon -->
<link rel="icon" href="/img/core-img/favicon.ico">
<!-- Stylesheet -->
<link rel="stylesheet" href="/css/member/style-header.css">

<header class="header-area">
	<!-- Top Header Area -->
	<div class="top-header-area bg-img bg-overlay"
		style="background-image: url(/img/bg-img/header.jpg);">
		<div class="container h-100">
			<div class="row h-100 align-items-center justify-content-between">
				<div class="col-12 col-sm-6">
					<!-- Top Social Info -->
					<div class="top-social-info">
						<a href="#" data-toggle="tooltip" data-placement="bottom"
							title="Pinterest"><i class="fa fa-pinterest"
							aria-hidden="true"></i></a> 
							
							<a href="https://github.com/Hecklebot/bitcamp-chopchop" data-toggle="tooltip" data-placement="bottom"
              title="GitHub"><i class="fa fa-github"
              aria-hidden="true"></i></a>
							<a href="https://www.facebook.com/"
							data-toggle="tooltip" data-placement="bottom" title="Facebook"><i
							class="fa fa-facebook" aria-hidden="true"></i></a> <a
							href="https://twitter.com/" data-toggle="tooltip"
							data-placement="bottom" title="Twitter"><i
							class="fa fa-twitter" aria-hidden="true"></i></a> <a href="#"
							data-toggle="tooltip" data-placement="bottom" title="Dribbble"><i
							class="fa fa-dribbble" aria-hidden="true"></i></a> <a href="https://www.instagram.com/chop0527/"
							data-toggle="tooltip" data-placement="bottom" title="instagram"><i
							class="fa fa-instagram" aria-hidden="true"></i></a> <a href="#"
							data-toggle="tooltip" data-placement="bottom" title="Linkedin"><i
							class="fa fa-linkedin" aria-hidden="true"></i></a>
						<div>
							<a href="/app/index" class="chop-logo">ChopChop</a>
						</div>
					</div>
				</div>
				<div class="col-12 col-sm-6 col-lg-5 col-xl-4">
					<!-- Top Search Area -->
					<div class="top-search-area">
						<form action="#" method="post">
							<input type="search" name="top-search" id="topSearch"
								placeholder="Search">
							<button type="submit" class="btn">
								<i class="fa fa-search"></i>
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Navbar Area -->
	<div class="bueno-main-menu" id="sticker">
		<div class="classy-nav-container breakpoint-off"
			style="height: 100px;">
			<div class="container">
				<!-- Menu -->
				<nav class="classy-navbar justify-content-between" id="buenoNav">
					<!-- Logo Area -->
					<!--            <a style="padding-top: 30px;" href="/app/member/list"><img
              src="/img/core-img/choplogo.png" style="width: 80px;" alt=""></a> -->
					<!-- Menu -->
					<div class="classy-menu"
						style="padding-top: 37px; padding-left: 30px;">
						<!-- Nav Start -->
						<div class="classynav">
							<ul>
								<li><a class="nav-items" href="/app/index"
									style="padding-left: 25px !important; font-size: 18px;">Home</a></li>
								<li><a class="nav-items" href="/app/recipe/list"
									style="padding-left: 25px !important; font-size: 18px;">ChopRecipe</a>
								<li><a class="nav-items" href="/app/product/list"
									style="padding-left: 25px !important; font-size: 18px;">ChopStore</a></li>
								<li><a class="nav-items" href="/app/event/list"
									style="padding-left: 25px !important; font-size: 18px;">ChopEvent</a></li>
								<li><a class="nav-items" href="/app/recipe/rank"
									style="padding-left: 25px !important; font-size: 18px;">ChopRank</a></li>

								<!-- Login/Register -->
								<c:if test="${empty loginUser}">
									<li><a class='classy-btn login-area'
										href='/app/auth/signin'
										style="font-size: 15px; margin-left: 167px;">Sign in</a></li>
								</c:if>
								<c:if test="${not empty loginUser}">
									<c:if test="${member.grade  eq 1}">
									<li><a href="/app/recipe/form" class="nav-link nav-item">
                      <i class="fa fa-cutlery fa-lg" title="Add Recipe"></i>
                  </a></li>
                  <li><a href="/app/cart/search" class="nav-link nav-item"
                    title="View Cart"> <i class="fa fa-shopping-cart fa-lg"></i>
                  </a></li>
										<li><a href="/app/member/myprofile" class='nav-user'
											style="font-size: 15px;">Hello! ${member.nickname}</a></li>
									</c:if>
									<c:if test="${member.grade  eq 0}">
                    <li><a href="/app/admin/member_list" class='nav-user'
                      style="font-size: 15px;">Administrator</a></li>
                  </c:if>
								</c:if>
								<c:if test="${not empty loginUser}">
									<li><a class='classy-btn c' href='/app/auth/logout'
										style="font-size: 15px; margin-left: 100px;">Sign out</a></li>
								</c:if>
							</ul>
						</div>
						<!-- Nav End -->
					</div>
				</nav>
			</div>
		</div>
	</div>
</header>
<!-- ##### Header Area End ##### -->
<div style="height: 30px;"></div>

<!-- should add to all pages -->
<!-- ##### All Javascript Script ##### -->
<!-- jQuery-2.2.4 js -->
<script src="/js/jquery/jquery-2.2.4.min.js"></script>
<!-- handlebars js -->
<script src="/node_modules/handlebars/dist/handlebars.min.js"></script>
<!-- jQuery -->
<script src="/node_modules/jquery/dist/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="/node_modules/jquery-ui-dist/jquery-ui.min.js"></script>
<!-- AdminLTE App -->
<script src="/js/dist/adminlte.js"></script>







