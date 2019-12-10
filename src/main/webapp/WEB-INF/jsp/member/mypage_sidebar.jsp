<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Main content -->
<section class="content">
	<!-- Small boxes (Stat box) -->
	<div class="row" style="width: 1100px; margin: auto auto 50px auto;">
		<div class="col-lg-3 col-6 src-recipe">
			<!-- small box -->
			<div class="small-box">
				<div class="inner">
					<h4 class="myprofile-h4">Recipe</h4>
					<p>All my recipes</p>
				</div>
				<div class="icon">
					<i class="ion ion-ios-paw"></i>
				</div>
				<a href="/app/recipe/myrecipe" class="small-box-footer">More
					info <i class="fas fa-arrow-circle-right"></i>
				</a>
			</div>
		</div>
		<!-- ./col -->
		<div class="col-lg-3 col-6 src-review">
			<!-- small box -->
			<div class="small-box">
				<div class="inner">
					<h4 class="myprofile-h4">Review</h4>
					<p>All my reviews</p>
				</div>
				<div class="icon">
					<i class="ion ion-ios-book"></i>
				</div>
				<a href="/app/mypage/myreview" class="small-box-footer">More
					info <i class="fas fa-arrow-circle-right"></i>
				</a>
			</div>
		</div>
		<!-- ./col -->
		<div class="col-lg-3 col-6">
			<!-- small box -->
			<div class="small-box ">
				<div class="inner">
					<h4 class="myprofile-h4">Order</h4>
					<p>All my orders</p>
				</div>
				<div class="icon">
					<i class="ion ion-ios-list"></i>
				</div>
				<a href="/app/order/searchbymember" class="small-box-footer">More
					info <i class="fas fa-arrow-circle-right"></i>
				</a>
			</div>
		</div>
		<div class="col-lg-3 col-6">
			<!-- small box -->
			<div class="small-box">
				<div class="inner">
					<h4 class="myprofile-h4">Bookmark</h4>
					<p>All my bookmarks</p>
				</div>
				<div class="icon">
					<i class="ion ion-bookmark"></i>
				</div>
				<a href="/app/recipe/myscrap" class="small-box-footer">More info
					<i class="fas fa-arrow-circle-right"></i>
				</a>
			</div>
		</div>
		<!-- ./col -->
	</div>
	<!-- /.row -->
</section>