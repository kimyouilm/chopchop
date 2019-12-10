<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/img/core-img/favicon.ico">
<link rel="stylesheet" href="/css/member/style-header.css">

<link rel="stylesheet" href="/css/recipe/form.css">
<link rel="stylesheet" href="/node_modules/blueimp-file-upload/css/jquery.fileupload.css">
<style>
 img {
  border: none;
 }
 
 img.preview-cooking-image {
  height: 150px;
  object-fit: cover;
 }
 
 #image {
  height: 150px;
  object-fit: cover;
 }
 
 .my-label {
  display: inline-block;
  padding: .5em .75em;
  margin-left: 32px;
  color: #fff;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #b0c364;
  cursor: pointer;
  border: 1px solid #b0c364;
  border-radius: .25em;
  -webkit-transition: background-color 0.2s;
  transition: background-color 0.2s;
 }

</style>
<title>레시피 등록폼</title>
</head>
<header class="header-area">
<body>

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
              aria-hidden="true"></i></a> <a href="https://www.facebook.com/" data-toggle="tooltip"
              data-placement="bottom" title="Facebook"><i
              class="fa fa-facebook" aria-hidden="true"></i></a> <a href="https://twitter.com/"
              data-toggle="tooltip" data-placement="bottom" title="Twitter"><i
              class="fa fa-twitter" aria-hidden="true"></i></a> <a href="#"
              data-toggle="tooltip" data-placement="bottom" title="Dribbble"><i
              class="fa fa-dribbble" aria-hidden="true"></i></a> <a href="#"
              data-toggle="tooltip" data-placement="bottom" title="Behance"><i
              class="fa fa-behance" aria-hidden="true"></i></a> <a href="#"
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
                <li><a class="nav-items" href=""
                  style="padding-left: 25px !important; font-size: 18px;">ChopEvent</a></li>
                <li><a class="nav-items" href="/app/recipe/rank"
                  style="padding-left: 25px !important; font-size: 18px;">ChopRank</a></li>

                <!-- Login/Register -->
                <c:if test="${not empty loginUser}">
                  <li><a href="/app/recipe/form" class="nav-link nav-item">
                      <i class="fa fa-cutlery fa-lg" title="Add Recipe"></i>
                  </a></li>
                  <li><a href="/app/cart/search" class="nav-link nav-item"
                    title="View Cart"> <i class="fa fa-shopping-cart fa-lg"></i>
                  </a></li>
                </c:if>
                <c:if test="${empty loginUser}">
                  <li><a class='classy-btn login-area'
                    href='/app/auth/signin' style="font-size: 15px; margin-left: 167px;">Sign in</a></li>
                </c:if>
                <c:if test="${not empty loginUser}">
                  <li><a href="/app/member/myprofile" class='nav-user'
                    style="font-size: 15px;">Hello! ${member.nickname}</a></li>
                </c:if>
                <c:if test="${not empty loginUser}">
                  <li><a class='classy-btn c' href='/app/auth/logout'
                    style="font-size: 15px;  margin-left: 100px;">Sign out</a></li>
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
<div style="height: 30px;"></div>




<%-- <jsp:include page="../header.jsp" />  --%>
<div id="app">
  <div>
    <div class="wrapper">
      <div class="site-main">
          <div class="container">
            <div class="block-gird-item">
              <div>
                  <form name="frmRecipe" action='add' method='post' enctype='multipart/form-data'>
                  <input type="hidden" name="user_id" value="1">
                      <div class="toobar"><strong class="title pull-left">레시피 등록 </strong></div>
                      <div class="block-write">
                          <div class="block-content">
                              <div class="row form-group">
                                  <div class="col-xs-2"><label class="label">작성자</label></div>
<%--                                   <div class="col-xs-10"><input type="text" name="nickname" class="form-control" placeholder="${loginUser.nickname}" readonly></div> --%>
                                  <div class="col-xs-10"><label class="label">&nbsp${member.nickname}</label></div>
                              </div>
                              <div class="row form-group">
                                  <div class="col-xs-2"><label class="label">제목</label></div>
                                  <div class="col-xs-10"><input type="text" name="title" class="form-control" required placeholder="레시피 제목을 입력해주세요" value=""></div>
                              </div>
                              <div class="row form-group">
                                  <div class="col-xs-2"><label class="label">분류</label></div>
                                  <div class="col-xs-10">
                                  <select class="form-control" name="category" required>
                                          <option value="">분류</option>
                                          <option value="1">강아지</option>
                                          <option value="2">고양이</option>
                                          <option value="3">작은동물</option>
                                          <option value="4">기타</option>
                                  </select>
                                  </div>
                              </div>
                              <div class="row form-group">
                                  <div class="col-xs-2"><label class="label">태그</label></div>
                                  <div class="col-xs-10"><input type="text" name="tag" class="form-control" placeholder="1개 이상의 정보는 #로 구분해주세요." value=""></div>
                              </div>
                              <div class="row form-group">
                                  <div class="col-xs-2"><label class="label">기타정보</label></div>
                                  <div class="col-xs-10"><input type="text" name="otherInfo" class="form-control" placeholder="기타정보를 입력해주세요." value="" required></div>
                              </div>
                          </div>
                          <div class="block-title"><span class="title">재료 정보</span></div>
                          <div id="ingredient-block" class="block-content">
                          <!-- 재료 용량 들어가는 Div -->
                          </div>
                          
                          <div id="block_3" class="block-content">
                              <div class="row form-group">
                                  <div class="col-xs-12 text-right"><button class="btn btn-default btn-sm" type="button" onclick="addIngredient()">추가입력</button></div>
                              </div>
                          </div>
                          
                          <div class="step-list"> 
                              <div id="cookingDiv222">
                                  <div class="block-title _gray">
                                  <span class="title">STEP</span></div>
                                  
                                  <div id="cookingDiv" class="block-content">
                                  <!-- 순서 박스 들어갈 Div -->
                                  </div>
                              </div>
                          </div>
                          <!-- 순서추가버튼 -->
                          <div class="block-content">
                              <div class="row form-group">
                                  <div class="col-xs-12"><button class="btn btn-default btn-block" type="button" onclick="addCooking()">+ 순서 추가</button></div>
                              </div>
                          </div>
                          <!-- 순서추가버튼 -->
                          <div class="block-title _gray"><span class="title">요리 완성</span></div>
                          <div class="block-content">
                              <div>
                                  <!-- 썸네일사진추가아아아아아ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ -->
                                  <div class="box-photo">
                                          <div class="photo">
                                              <div class="img">
                                              <img id="image"/></div> <!-- 미리보기사진  -->
                                              <div style='display: none;'><input type="file" id='my-thumbnail' name='filePath' class="my-thumbnail" style="width:100px;"/></div>
                                              <label id='my-label' class="my-label" for="my-thumbnail">+ 완성 사진 </label>
                                          </div>
                                          <div class="des"><textarea class="form-control" name="content" placeholder="간단한 설명 입력해주세요"></textarea></div>
                                      </div>
                              </div><br><br>
                              <div class="row form-group">
                                  <div class="col-xs-12 text-center"><button class="btn btn-default" style="height: auto;">등록</button></div>
                              </div>
                          </div>
                      </div>
                  </form>
              </div>
            </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="/node_modules/jquery-ui-dist/jquery-ui.min.js"></script>
<!-- AdminLTE App -->
<script src="/js/dist/adminlte.js"></script>


<script src="/node_modules/handlebars/dist/handlebars.min.js"></script>
<script src="/node_modules/jquery/dist/jquery.min.js"></script>

<script id="t1" type="ingredientHtml">
<div class='group-flex my-ingredient'>
<div class='form-group'><label class='label'>재료 </label><input type='text' name='ingredientNames' class='form-control' value=''></div>
<div class='form-group'><label class='label'>용량 </label><input type='text' name='quantity' class='form-control' value=''></div>
<div class='form-group'><button class='btn btn-outline btn-sm' type='button' name='delIngredientBtn' onclick='delIngredient(event)'>삭제</button></div>
</div>
</script>

<script>
"use strict";
  function addIngredient() {
    var html = $('#t1').html();
    $('#ingredient-block').append(html);
  };

  function delIngredient(event) {
    $(event.target.parentNode.parentNode).remove();
  };
</script>
<script id="t2" type="cookingHtml"> 
<div class='row form-group my-cooking'>
  <div class='row form-group'>
    <input type='text' class='form-control' name='processNo' style='padding-left:13px; width:50px; margin-left:15px; font-size:12px;' value='' placeholder='순서' required>
  </div>
  <div class='box-photo'>
    <div class='photo'>
      <div class='img' style="margin-bottom:3px;">
       <img class='preview-cooking-image'>
      </div>
      <span class="fileinput-button my-label" style="margin-left:27px;">
        <i class="glyphicon glyphicon-plus"></i>
        <span>파일 선택</span>
        <input class='my-cooking-image' type='file' name='filePath2' value='' >
      </span>
      <button class='btn btn-outline btn-block btn-sm' style='boarder:none; margin-top:3px;' type='button' name='delCookingBtn' onclick='delCooking(event)'>순서 삭제</button>
    </div>
    <div class='des'><textarea class='form-control' name='cookingContent'></textarea></div>
  </div>
</div>
</script>

<script>
function addCooking() {
  var html = $('#t2').html();
  $('#cookingDiv').append(html);
};

function delCooking(event) {
  $(event.target.parentNode.parentNode.parentNode).remove();
};

function readURL(input) {
  var reader = new FileReader();
  reader.onload = function(e) {
    console.log("----------------------");
    $('#image').attr('src', e.target.result);
  }
  reader.readAsDataURL(input.files[0]);
};

$('.my-thumbnail').change(function() {
  readURL(this);
});

// cooking image 미리보기
function readURL2(input) {
  var reader2 = new FileReader();
  reader2.onload = function(e) {
    $(input.parentNode.parentNode).find('.preview-cooking-image').attr('src', e.target.result);
  }
  reader2.readAsDataURL(input.files[0]);
};

$(document).on('change', '.my-cooking-image', function() {
  readURL2(this);
});
</script>
<%-- <jsp:include page="../footer.jsp" /> --%>
</body>
</html>