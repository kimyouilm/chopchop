<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Font Awesome -->
<!-- <link rel="stylesheet"
  href="/js/plugins/fontawesome-free/css/all.min.css">
Ionicons
<link rel="stylesheet"
  href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
Theme style
<link rel="stylesheet" href="/css/member/adminlte.min.css">
<!-- </head> -->

<div class="hold-transition sidebar-mini layout-fixed">
	<!-- /.navbar -->

	<!-- Main Sidebar Container -->
	<aside class="main-sidebar sidebar-dark-primary elevation-4">

		<!-- Sidebar -->
		<div class="sidebar" style="padding-left: 0px; padding-right: 0px;">
			<!-- Sidebar user panel (optional) -->
			<div class="user-panel mt-3 pb-3 mb-3 d-flex">
				<div class="info">
					<!-- user name받기~ -->
					<a style="font-size: large; padding-left: 5px;" class='nav-user'>${member.nickname}</a>
				</div>
			</div>

			<!-- Sidebar Menu -->
			<nav class="mt-2">
				<ul class="nav nav-pills nav-sidebar flex-column"
					data-widget="treeview" role="menu" data-accordion="false">
					<li class="nav-item"><a href="/app/admin/member_list"
						class="nav-link" style="font-size: large;"> <i
							class="nav-icon fa fa-users"></i>
							<p>All Members</p>
					</a></li>
					<li class="nav-item"><a href="/app/admin/recipe_list"
						class="nav-link" style="font-size: large;"> <i
							class="nav-icon fa fa-book"></i>
							<p>All Recipes</p>
					</a></li>
					<li class="nav-item"><a href="/app/admin/order_list"
						class="nav-link" style="font-size: large;"> <i
							class="nav-icon fa fa-credit-card"></i>
							<p>All Orders</p>
					</a></li>
					<li class="nav-item"><a href="/app/admin/product_list"
						class="nav-link" style="font-size: large;"> <i
							class="nav-icon fa fa-list"></i>
							<p>All Products</p>
					</a></li>
					<li class="nav-item"><a href="/app/admin/storeReview_list"
						class="nav-link" style="font-size: large;"> <i
							class="nav-icon fa fa-edit"></i>
							<p>All Store Reviews</p>
					</a></li>
					         <li class="nav-item"><a href="/app/admin/recipeComment_list"
            class="nav-link" style="font-size: large;"> <i
              class="nav-icon fa fa-comments-o"></i>
              <p>All Recipe Comments</p>
          </a></li>
				</ul>
			</nav>
			<!-- /.sidebar-menu -->
		</div>
		<!-- /.sidebar -->
	</aside>
</div>

<!-- jQuery -->
<!--   <script src="/node_modules/jquery/dist/jquery.min.js"></script>
  <script src="/js/jquery-ui/jquery-ui.min.js"></script>
  
  <script>
    function formLoad() {
      if ($("#userphoto").val() == null || $("#userphoto").val() == "") {
        $("#userThumb").attr("src", "/upload/member/info_photo.jpg");
      } else {
        $("#userThumb").attr("src",
            "/upload/member/" + $("#userphoto").val());
      }
    }
  </script>  -->