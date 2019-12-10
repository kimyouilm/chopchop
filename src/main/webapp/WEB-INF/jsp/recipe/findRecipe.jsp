<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/css/recipe/findRecipe.css">
<span class="page-wrap" id="page-mount-point">
  <span class="page">
  <div class="search-utility-hero" data-photo-lightness="dark" data-track-location="above-the-fold" data-track-source="page-region">
    <strong class="find-a-recipe">Find a Recipe</strong>
    <form action="search" autocomplete="off" class="search-utility-hero-form" method="get" data-reactid="62">
      <div>
        <input type='text' name='keyword' placeholder="태그를 입력해주세요. 예)고양이">
      </div>
      <input type='submit' class="advanced-search" value='Search by Tag'>
    </form>
    <div class="photo-wrap">
      <picture class="component-responsive-image photo-wrap">
      <source media="(min-width: 1400px)" srcset="https://assets.epicurious.com/photos/5b158b8e2d124719c33e5a45/4:1/w_1944,h_486,c_limit/61-bread_16042018.jpg, https://assets.epicurious.com/photos/5b158b8e2d124719c33e5a45/4:1/w_3888,h_972,c_limit/61-bread_16042018.jpg 2x" />
      <source media="(min-width: 1024px)" srcset="https://assets.epicurious.com/photos/5b158b8e2d124719c33e5a45/3:1/w_1458,h_486,c_limit/61-bread_16042018.jpg, https://assets.epicurious.com/photos/5b158b8e2d124719c33e5a45/3:1/w_2916,h_972,c_limit/61-bread_16042018.jpg 2x" />
      <source media="(min-width: 768px)" srcset="https://assets.epicurious.com/photos/5b158b8e2d124719c33e5a45/9:4/w_1094,h_486,c_limit/61-bread_16042018.jpg, https://assets.epicurious.com/photos/5b158b8e2d124719c33e5a45/9:4/w_2188,h_972,c_limit/61-bread_16042018.jpg 2x" />
      <source media="(min-width: 0px)" srcset="https://assets.epicurious.com/photos/5b158b8e2d124719c33e5a45/6:4/w_618,h_412,c_limit/61-bread_16042018.jpg, https://assets.epicurious.com/photos/5b158b8e2d124719c33e5a45/6:4/w_1236,h_824,c_limit/61-bread_16042018.jpg 2x" />
      <img alt="61-bread_16042018.jpg" src="https://assets.epicurious.com/photos/5b158b8e2d124719c33e5a45/6:4/w_618,h_412,c_limit/61-bread_16042018.jpg" title="" />
      </picture>
    </div>
  </div>
  </span>
</span>