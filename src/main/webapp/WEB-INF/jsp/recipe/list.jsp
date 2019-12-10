<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet' href='/node_modules/bootstrap/dist/css/bootstrap.min.css'>
<link rel="stylesheet" href="/css/recipe/w3.css">
<link rel="stylesheet" href="/css/recipe/list.css">
<style>

 img.thumbnail {
  width: 280px;
  height: 250px;
  object-fit: cover;
 }

 .my-list a {
  color: #000000;
 }
   /* :: 3.7.0 bueno Button */
.bueno-btn {
    background-color: #b0c364;
    -webkit-transition-duration: 500ms;
    transition-duration: 500ms;
    position: relative;
    z-index: 1;
    display: inline-block;
    min-width: 160px;
    height: 50px;
    color: #ffffff;
    border-radius: 0;
    padding: 0 30px;
    font-size: 14px;
    line-height: 50px;
    font-weight: 500;
    text-transform: capitalize;
}

.bueno-btn:hover,
.bueno-btn:focus {
    font-size: 14px;
    font-weight: 500;
    background-color: #000000;
    color: #ffffff;
}
    </style>
    <title>RECIPE LIST</title>
</head>
<jsp:include page="../header.jsp" /> 
<body>
<jsp:include page="findRecipe.jsp"/>


<!-- ##### Search Area Start ##### -->
    <div class="bueno-search-area pb-70 bg-img" style="height: 40px;">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <form action="#" method="post">
                        <div class="row">
                            <div class="col-12 col-sm-6 col-lg-3">
                                <div class="form-group mb-30" style="display: none">
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-lg-3">
                                <div class="form-group mb-30">
                                    <select id="selectCategory" name='category' class="form-control my-category">
                                      <option value="0" selected="selected">카테고리 보기</option>
                                      <option value="1">강아지</option>
                                      <option value="2">고양이</option>
                                      <option value="3">작은동물</option>
                                      <option value="4">기타</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-lg-3">
                                <div class="form-group mb-30">
                                    <select id="selectColumn" name='column' class="form-control my-sort">
                                      <option value="recipe_id" selected="selected">리스트 보기</option>
                                      <option value="view_count">조회순</option>
                                      <option value="scrap">좋아요순</option>
                                      <option value="created_date">최신순</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-lg-3">
                              <button id="add" class="btn bueno-btn w-100" type="button" onclick="location='form.jsp'">레시피등록</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

 <div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px">
         <!-- First Photo Grid-->
        <div class="w3-row-padding w3-padding-16 w3-center" id="food">
        </div>
 <button type="button" class="btn btn-outline-secondary btn-lg btn-block view-more">더보기</button>
 </div>
 
<script src="/js/jquery/jquery-2.2.4.min.js"></script>
<script src="/js/plugins/plugins.js"></script>
<script src="/js/active.js"></script>
<script src="/node_modules/handlebars/dist/handlebars.min.js"></script>

<script id="t1bak" type="listHtml">
<div class='w3-quarter my-list'>
  <a href='detail?no={{recipeNo}}' style='text-decoration:none;'>
  <img class='thumbnail' src='/upload/recipe/{{thumbnail}}' alt=''>
  <h3>{{title}}</a></h3>
    <p>{{otherInfo}}</p>
</div>
</script>

<script id="t1" type="listHtml">
<div class='w3-quarter my-list'>
  <a href='#' class='detail' style='text-decoration:none;'>
  <input class='recipeNo' type='hidden' value='{{recipeNo}}'>
  <img class='thumbnail' src='/upload/recipe/{{thumbnail}}' alt=''>
  <h3>{{title}}</h3></a>
    <p>{{otherInfo}}</p>
</div>
</script>

<script>
"use strict";
var dbody = $('#food');
var templateSrc = $('#t1').html();
var template = Handlebars.compile(templateSrc);

loadList();
function loadList() {
  $.get("/app/json/recipe/list", function(data) {
    console.log(data.result);
    for (var b of data.result.recipes) {
      $(template(b)).appendTo(dbody);
    }
    
    window.currentPage = data.result.pageNo;
    window.pageSize = data.result.pageSize;
    window.totalPage = data.result.totalPage;
  });
}

$('.my-sort').on('change', function() {
  var selectOption = $('.my-sort').val();
  $.get("/app/json/recipe/listSort?column=" + selectOption, function(data) {  
  $('.my-list').remove();
  $('.view-more').remove();
    for (var b of data.result) {
      $(template(b)).appendTo(dbody);
    }
  });
}); 
  
$('.my-category').on('change', function() {
  var selectOption = $('.my-category').val();
  
  console.log(selectOption);
  $.get("/app/json/recipe/listCategory?category=" + selectOption, function(data) {
    console.log(data);
    $('.my-list').remove();
    $('.view-more').remove();
    for (var b of data.result) {
      $(template(b)).appendTo(dbody);
    }
  });
});

$('.view-more').click((e) => {
  if (currentPage >= totalPage)
    return;
  next(currentPage, pageSize, totalPage);
});

function next(currentPage, pageSize, totalPage) {
  $.get("/app/json/recipe/list?pageNo=" + (currentPage + 1), function(data) {
    console.log(data.result);
    for (var b of data.result.recipes) {
      $(template(b)).appendTo(dbody);
    }
    window.currentPage = data.result.pageNo;
    window.pageSize = data.result.pageSize;
    window.totalPage = data.result.totalPage;
  });
};


$(document).on('click', '.detail', function(e) {
  e.preventDefault();
  console.log("클릭");
  var no = $(this.parentNode).find('.recipeNo').val();
  var loginCheck = '${loginUser.memberNo}';
  if (loginCheck == '') {
    alert("로그인이 필요한 서비스입니다.");
  } else {
    location.href = '/app/recipe/detail?no=' + no;
  }
});
</script>
<jsp:include page="../footer.jsp" />
</body>
</html>