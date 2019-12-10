<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/recipe/detail.css">
<link rel="stylesheet" href="/css/recipe/comment.css">
<style>

 .comment-author {
  width: 150px;
  height: 150px; 
  border-radius: 70%;
  overflow: hidden;
 }
 
 .author-img {
  width: 100%;
  height: 100%;
  object-fit: cover;
 }

 #likeBtn:focus {
  outline:none;
 }
 .cookingphoto {
  width: 280px;
  height: 250px;
  object-fit: cover;
 }
 }
 .bueno-btn {
    background-color: #b0c364;
    -webkit-transition-duration: 500ms;
    transition-duration: 500ms;
    position: relative;
    z-index: 1;
    display: inline-block;
    min-width: 100px;
    height: 50px;
    color: #ffffff;
    border-radius: 0;
    padding: 0 30px;
    margin-top: 5px;
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

<title>RECIPE</title>
</head>
<jsp:include page="../header.jsp" />
<body>
<section class="post-news-area section-padding-100-0 mb-70">
      <div class="container">
          <div class="justify-content-center">
              <!-- Post Details Content Area -->
            <div class="row">
              <div class="col-8">
                <div class="blog-thumbnail mb-50">
                <img src='/upload/recipe/${recipe.thumbnail}' alt="">
                </div>
              </div>
              <div class="col-4">
                  <div class="recipe-info">
                    <ul class="info-data">
                        <li><span>CATEGORY:${category}</span></li>
                        <li><span>${recipe.tag}</span></li>
                    </ul>
                  </div>
                  <!-- Ingredients -->
                  <div class="ingredients">
                    <h5>Ingredients</h5>
                    <c:forEach items="${recipe.ingredients}" var="ingredient">
                    <!-- Custom Checkbox -->
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="customCheck2">
                        <label class="custom-control-label" for="customCheck2">${ingredient.name} ${ingredient.quantity}</label>
                    </div>
                    </c:forEach>
                  </div>
               </div>
            </div>
           </div> <!-- div/justify-content -->
           
           <div class="row post-details-content mb-30">
             <div class="col-12 blog-content">
               <h4 class="post-title" style= "font-weight: 700; line-height: 1.2;">${recipe.title}</h4>
               <div class="post-meta mb-50">
                 <a class="post-date">${recipe.createdDate}</a>
                 <a class="post-author">By ${recipeMember.nickname}</a><br>
                 <a class="post-author">Views ${recipe.viewCount}</a>
<button style="border:none; background-color: #ffffff;" id="likeBtn" type="button" ><img id="likeimg" class="btn-img" style="margin-top:-4px; margin-left:10px; height:15px;" src="${isCheck ? '/img/recipe/like.png' : '/img/recipe/unlike.png'}"></button>
                 <input type="hidden" name='recipeNo' value="${recipe.recipeNo}">
                 <span id="scrap" style="margin-left:5px; margin-bottom:2px;font-size:15px;">${recipe.scrap}</span><br>
                 <button id="updateBtn" class="btn bueno-btn" style="display:none;">수정하기</button>
                </div>
                <div style="font-size:18px;">
                ${recipe.content}
                </div>
             </div>
           </div>
           
           <c:forEach items="${recipe.cookings}" var="cooking">
           <div class="cooking">
             <div class="row">
               <div class="col-12">
                 <h5 class="mb-30" style="font-weight: 800; margin-bottom:5px !important;">Step ${cooking.processNo} </h5>
               </div>
             </div>
             <div class="row">
               <div class="col-4">
                <img src='/upload/recipe/${cooking.filePath}' class='cookingphoto'>
              </div>
               <div class="col-8">
                 <p class="mb-30" style="font-size:16px;">${cooking.content}</p>
               </div>
             </div>
           </div><br>
           </c:forEach>
           
  </div>
</section>

<script src="/node_modules/jquery/dist/jquery.min.js"></script>
<script src="/node_modules/handlebars/dist/handlebars.min.js"></script>
<script src="/node_modules/bootstrap/dist/js/bootstrap.js"></script>
<jsp:include page="../recipecomment/list.jsp"/>

<script>
"use strict";
loadData();
function loadData() {
  var writerNo = ${recipeMember.memberNo};
  var viewerNo = ${member.memberNo};
  if (writerNo == viewerNo) {
    $('#updateBtn').css('display', '');
  }
};

$('#likeBtn').click(function() {
  $.get("/app/json/recipe/like?no=" + ${recipe.recipeNo}, function(data) {
    if(data.result.isLike) { 
      console.log("좋아요");
      console.log(data.result.scrap);
      $('#likeimg').attr('src', '/img/recipe/like.png');
      $('span#scrap').html(data.result.scrap);
    } else { 
      console.log("좋아요 취소");
      console.log(data.result.scrap);
      $('#likeimg').attr('src', '/img/recipe/unlike.png');
      $('span#scrap').html(data.result.scrap);
    }
  })
});

$('#updateBtn').click(function() {
  location.href='/app/recipe/updateform?no=' + ${recipe.recipeNo};
});
</script>









<%-- <jsp:include page="../footer.jsp"/> --%>

</body>
</html>