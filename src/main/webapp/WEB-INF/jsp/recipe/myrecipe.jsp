<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY RECIPES</title>
<link rel="stylesheet" href="/css/recipe/myrecipe.css">
<!-- mypage_sidebar start-->
<!-- Font Awesome -->
<link rel="stylesheet"
	href="/js/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- mypage_sidebar  end -->
</head>
<jsp:include page="../header.jsp" />
<jsp:include page="../member/mypage_sidebar.jsp" />
<body>
	<div class="w2-main w2-content px-0"
		style="margin: 0 auto; margin-bottom: 200px;">
		<div
			class="d-flex justify-content-between align-items-center py-0 mb-3 rInfo">
			<h3 class="recipe-h3">My Recipe</h3>
			<span class="rInfo-span"> <a href="/app/member/myprofile"
				class="mypage-tagA">My Page</a>&nbsp>&nbspMy Recipe
			</span>
		</div>
		<div class="w2-row-padding w2-padding-16 w2-center" id="food"></div>
	</div>
	<div class="w3-main w3-content w3-padding"
		style="max-width: 1200px; margin: 0 auto;">
		<!-- First Photo Grid-->
		<div class="w3-row-padding w3-padding-16 w3-center" id="food"></div>
		<button type="button"
			class="btn btn-outline-secondary btn-lg btn-block view-more">더보기</button>
	</div>
<script src="/js/jquery/jquery-2.2.4.min.js"></script>
<script src="/js/plugins/plugins.js"></script>
<script src="/js/active.js"></script>
<script src="/node_modules/handlebars/dist/handlebars.min.js"></script>

	<script id="t1" type="listsHtml">
{{#each result}}
<div class='w2-quarter my-list'>
  <img src='/upload/recipe/{{thumbnail}}' alt='Sandwich' style='width:200px; height:215px;object-fit:cover;'>
  <div>
    <img src='/img/recipe/eye.png' style='height:15px; margin-top:-2.5px;'>&nbsp{{viewCount}}&nbsp&nbsp
    <img src='/img/recipe/like.png' style='height:15px; margin-top:-2px;'>&nbsp{{scrap}}
  </div>
    <h3><a href='detail?no={{recipeNo}}' class="r-tagA">{{title}}</a></h3>
    <p>{{otherInfo}}</p>
<button type="del-btn" class="btn btn-light" onclick="del({{recipeNo}});">DELETE</button>
</div>
{{/each}}
</script>
<script>
"use strict";
var dbody = $('#food');
var templateSrc = $('#t1').html();
var template = Handlebars.compile(templateSrc);
loadList();
function loadList() {
	$.get("/app/json/recipe/myrecipe", function(data) {
		console.log(data.result);
		dbody.html(template(data));
	});
}
function del(recipeNo) {
	$.get('/app/recipe/delete?no=' + recipeNo, function(data) {
		loadList();
	});
}
</script>

<script>
	function formLoad() {
		// hidden값을 이용해서 자바스크립트를 이용한 경우
		if ($("#userphoto").val() == null || $("#userphoto").val() == "") {
			$("#userThumb").attr("src", "/upload/member/info_photo.jpg");
		} else {
			$("#userThumb").attr("src",
					"/upload/member/" + $("#userphoto").val());
		}
	}
</script>

</body>
<jsp:include page="../footer.jsp" />
</html>