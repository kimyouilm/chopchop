<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/recipe/myrecipe.css">
<title>MY SCRAP RECIPES</title>
</head>
<!-- mypage_sidebar start-->
<!-- Font Awesome -->
<link rel="stylesheet"
  href="/js/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
  href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- mypage_sidebar  end -->

<jsp:include page="../header.jsp" />
<jsp:include page="../member/mypage_sidebar.jsp" />
<body>

  <div class="w2-main w2-content px-0" style="margin: 0 auto; margin-bottom: 200px;">
    <div class="d-flex justify-content-between align-items-center py-0 mb-3 rInfo">
      <h3 class="recipe-h3">My Bookmark</h3>
      <span class="rInfo-span">
      <a href="/app/member/myprofile" class="mypage-tagA">My Page</a>&nbsp>&nbspMy Bookmark</span> 
    </div>
    <div class="w2-row-padding w2-padding-16 w2-center" id="food">
    </div>
  </div>
    
    <script id="t1" type="listHtml">
{{#each result}}
<div class='w2-quarter my-list'>
    <img src='/upload/recipe/{{thumbnail}}' alt='Sandwich' style='width:200px; height:215px;object-fit:cover;'>
    <h3><a href='detail?no={{recipeNo}}' class="r-tagA">{{title}}</a></h3>
    <p>{{otherInfo}}</p>
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
    $.get("/app/json/recipe/myscrap", function(data) {
      console.log(data.result);
      dbody.html(template(data));
    });
  }
</script>

<script>
  function formLoad() {
    // hidden값을 이용해서 자바스크립트를 이용한 경우
    if ($("#userphoto").val() == null
        || $("#userphoto").val() == "") {
      $("#userThumb")
          .attr("src", "/upload/member/info_photo.jpg");
    } else {
      $("#userThumb").attr("src",
          "/upload/member/" + $("#userphoto").val());
    }
  }
</script>
</body>
<jsp:include page="../footer.jsp" />
</html>