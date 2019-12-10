<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>레시피 수정</title>
</head>

<body>

<div id="app">
  <div>
      <div class="wrapper">
          <div class="site-main">
              <div class="container">
                  <div class="block-gird-item">
                      <div>
                          <form name="frmRecipe" action='update' method='post' enctype='multipart/form-data'>
                           <input type='hidden' name='recipeNo' value='${recipe.recipeNo}' readonly><br>
                              <div class="toobar"><strong class="title pull-left">레시피 수정 </strong></div>
                              <div class="block-write">
                                  <div class="block-content">
                                      <div class="row form-group">
                                          <div class="col-xs-2"><label class="label">작성자</label></div>
                                          <div class="col-xs-10"><label class="label">&nbsp${member.nickname}</label></div>
                                          <div class="col-xs-10"><input type="hidden" name="memberNo" class="form-control" value="${loginUser.memberNo}" readonly></div>
                                      </div>
                                      <div class="row form-group">
                                          <div class="col-xs-2"><label class="label">제목</label></div>
                                          <div class="col-xs-10"><input type="text" name="title" class="form-control" placeholder="레시피 제목을 입력해주세요" value="${recipe.title}"></div>
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
                                          <div class="col-xs-10"><input type="text" name="tag" class="form-control" placeholder="1개 이상의 정보는 #로 구분해주세요." value="${recipe.tag}"></div>
                                      </div>
                                      <div class="row form-group">
                                          <div class="col-xs-2"><label class="label">기타정보</label></div>
                                          <div class="col-xs-10"><input type="text" name="otherInfo" class="form-control" placeholder="기타정보" value="${recipe.otherInfo}"></div>
                                      </div>
                                  </div>
                                  <div class="block-title"><span class="title">재료 정보</span></div>
                                  
                                  <div id="ingredient-block" class="block-content">
                                  <c:forEach items="${recipe.ingredients}" var="ingredients">
                                  <!-- 재료 용량 들어가는 Div -->
                                  <div class='group-flex my-ingredient'>
                                  <div class='form-group'><label class='label'>재료 </label><input type='text' name='ingredientNames' class='form-control' value='${ingredients.name}'></div>
                                  <div class='form-group'><label class='label'>용량 </label><input type='text' name='quantity' class='form-control' value='${ingredients.quantity}'></div>
                                  <div class='form-group'><button class='btn btn-outline btn-sm' type='button' name="delIngredientBtn" onclick="delIngredient(event)">삭제</button></div>
                                  </div>
                                  </c:forEach>
                                  </div>
                                  
                                  <div id="block_3" class="block-content">
                                      <div class="row form-group">
                                          <div class="col-xs-12 text-right"><button class="btn btn-default btn-sm" type="button" onclick="addIngredient()">추가입력</button></div>
                                      </div>
                                  </div>
                                  
                                  
                                  <div class="step-list"> 
                                          <div class="block-title _gray">
                                          <span class="title">STEP</span></div>
                                          
                                          <div id="cookingDiv" class="block-content">
                                          <c:forEach items="${recipe.cookings}" var="cooking">
                                          <!-- 순서 박스 들어갈 Div -->
                                          <div class='row form-group my-cooking'>
                                          <div class='row form-group'>
                                            <input type='text' class='form-control' name='processNo' style='width:50px; margin-left:15px; font-size:12px; padding-left:13px;' value='${cooking.processNo}'>
                                          </div>
                                          <div class='box-photo'>
                                            <div class='photo'>
                                              <div class='img' style="margin-bottom:3px;">
                                               <img class='preview-cooking-image' src='/upload/recipe/${cooking.filePath}'>
                                              </div>
                                              <span class="fileinput-button my-label" style="margin-left:27px;">
                                                <i class="glyphicon glyphicon-plus"></i>
                                                <span>파일 선택</span>
                                                <input class='btn btn-outline btn-images my-cooking-image' type='file' name='filePath2' value='${cooking.filePath}'>
                                                <input class='cooking-check' type='hidden' name='fileNo' value='${cooking.cookingNo}'>
                                              </span>
                                          <button class='btn btn-outline btn-block btn-sm' style='margin:2px;' name='delCookingBtn' type='button' onclick='delCooking(event)'>순서 삭제</button>
                                            </div>
                                          <div class='des'><textarea class='form-control' name='cookingContent'>${cooking.content}</textarea></div>
                                          </div>
                                        </div>
                                          </c:forEach>
                                      <!-- 순서 박스 들어갈 Div -->
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
                                          <!-- 썸네일사진-->
                                          <div class="box-photo">
                                                  <div class="photo">
                                                      <div class="img">
                                                      <img id="image" src='/upload/recipe/${recipe.thumbnail}'></div>
                                                      <div style='display: none;'>
                                                      <input class="btn btn-outline btn-images my-thumbnail" id="my-thumbnail" type="file" name='filePath'></div>
                                                      <label id='my-label' class='my-label' for="my-thumbnail">+ 사진 수정</label>
                                                      
                                                  </div>
                                                  <div class="des"><textarea class="form-control" name="content">${recipe.content}</textarea></div>
                                              </div>
                                      </div><br><br>
                                      <div class="row form-group">
                                          <div class="col-xs-12 text-center"><button class="btn btn-default" style="height: auto; border: none;">수정하기</button>
                                          <input id="delBtn"class="btn btn-danger" type="button" value='삭제하기' style="height: auto; border:none;"></div>
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

<script src="/node_modules/handlebars/dist/handlebars.min.js"></script>
<script src="/node_modules/jquery/dist/jquery.min.js"></script>

<script>
inputOption();

function inputOption() {
  console.log(${recipe.category});
  $('select').val(${recipe.category}).trigger('change');
}
</script>

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
  console.log("추가버튼누름");
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
        <input class='btn btn-outline btn-images my-cooking-image' type='file' name='filePath2' value=''>
        <input class='cooking-check' type='hidden' name='fileNo' value='${cooking.cookingNo}'>
      </span>
      <button class='btn btn-outline btn-block btn-sm' style='margin:2px;' type='button' name='delCookingBtn' onclick='delCooking(event)'>순서 삭제</button>
    </div>
    <div class='des'><textarea class='form-control' name='cookingContent'></textarea></div>
  </div>
</div>
</script>

<script>
"use strict";
function addCooking() {
  console.log("추가버튼누름");
  var html = $('#t2').html();
  $('#cookingDiv').append(html);
};

function delCooking(event) {
  $(event.target.parentNode.parentNode.parentNode).remove();
};

function readURL(input) {
  var reader = new FileReader();
  reader.onload = function(e) {
    $('#image').attr('src', e.target.result);
  }
  reader.readAsDataURL(input.files[0]);
};

$('.my-thumbnail').change(function() {
  readURL(this);
});

function readURL2(input) {
  var reader2 = new FileReader();
  reader2.onload = function(e) {
    $(input.parentNode.parentNode).find('.preview-cooking-image').attr('src', e.target.result);
  }
  reader2.readAsDataURL(input.files[0]);
};

$(document).on('change', '.my-cooking-image', function() {
  var check = $(this.parentNode).find('.cooking-check');
  check.val(0);
  console.log(check.val());
  readURL2(this);
});

$('#delBtn').on('click', function(){
  location.href = '/app/recipe/delete?no=' + ${recipe.recipeNo};
});
</script>

</body>
</html>