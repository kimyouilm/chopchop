<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="/css/recipe/findRecipe.css">
<style>
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
  margin-left: 50px;
  font-size: 14px;
  line-height: 50px;
  font-weight: 500;
  text-transform: capitalize; }
.bueno-btn:hover, .bueno-btn:focus {
  font-size: 14px;
  font-weight: 500;
  background-color: #000000;
  color: #ffffff; }
</style>
<title>Find Recipe</title>
</head>
<body>

<span class="page-wrap" id="page-mount-point"><span class="page">
                    <div class="search-utility-hero" data-photo-lightness="dark" data-track-location="above-the-fold" data-track-source="page-region"><strong class="find-a-recipe">Find a Recipe</strong>
                        <form action="search" autocomplete="off" class="search-utility-hero-form" method="get" data-reactid="62">
                            <div><input type='text' name='keyword' placeholder="태그를 입력해주세요.">
                       </div>
                       <input type='submit' class="advanced-search" value='Search by Tag'>
                        </form>
                            <div class="photo-wrap">
                                <picture class="component-responsive-image photo-wrap">
                                    <source media="(min-width: 1400px)" srcset="https://assets.epicurious.com/photos/5b158b8e2d124719c33e5a45/4:1/w_1944,h_486,c_limit/61-bread_16042018.jpg, https://assets.epicurious.com/photos/5b158b8e2d124719c33e5a45/4:1/w_3888,h_972,c_limit/61-bread_16042018.jpg 2x" />
                                    <source media="(min-width: 1024px)" srcset="https://assets.epicurious.com/photos/5b158b8e2d124719c33e5a45/3:1/w_1458,h_486,c_limit/61-bread_16042018.jpg, https://assets.epicurious.com/photos/5b158b8e2d124719c33e5a45/3:1/w_2916,h_972,c_limit/61-bread_16042018.jpg 2x" />
                                    <source media="(min-width: 768px)" srcset="https://assets.epicurious.com/photos/5b158b8e2d124719c33e5a45/9:4/w_1094,h_486,c_limit/61-bread_16042018.jpg, https://assets.epicurious.com/photos/5b158b8e2d124719c33e5a45/9:4/w_2188,h_972,c_limit/61-bread_16042018.jpg 2x" />
                                    <source media="(min-width: 0px)" srcset="https://assets.epicurious.com/photos/5b158b8e2d124719c33e5a45/6:4/w_618,h_412,c_limit/61-bread_16042018.jpg, https://assets.epicurious.com/photos/5b158b8e2d124719c33e5a45/6:4/w_1236,h_824,c_limit/61-bread_16042018.jpg 2x" /><img alt="61-bread_16042018.jpg" src="https://assets.epicurious.com/photos/5b158b8e2d124719c33e5a45/6:4/w_618,h_412,c_limit/61-bread_16042018.jpg" title="" /></picture>
                            </div>
                    </div>
                </span>
            </div>
            </div>
        </span></span>

<div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px">
<!-- First Photo Grid-->
<div class="w3-row-padding w3-padding-16 w3-center" id="food">
 <c:forEach items="${recipes}" var="recipe">
  <div class="w3-quarter">
    <img src='/upload/recipe/${recipe.thumbnail}' alt="Sandwich" style="width:280px; height:250px">
    <h3><a href='detail?no=${recipe.recipeNo}'>${recipe.title}</a></h3>
    <p>${recipe.otherInfo}</p>
  </div>
</c:forEach>
</div>


</body>
</html>