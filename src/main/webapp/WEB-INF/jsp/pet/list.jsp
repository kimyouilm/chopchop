<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<link rel='stylesheet' href='/node_modules/bootstrap/dist/css/bootstrap.min.css'>
<link rel="stylesheet" href="/css/member/style_contact.css">
<style type="text/css">
  .card-img {
    width: 200px;
    height: 200px;
  }
</style>
</head>
<body>
<div id='content'>
<h1>My Pet Infomation</h1>
<a href='form'>펫 등록</a><br>
<c:forEach items="${pets}" var="pet">
<div class="card mb-3" style="max-width: 540px;">
  <div class="row no-gutters">
    <div class="col-md-4">
      <img src="/upload/pet2/${pet.filePath}" class="card-img" alt="...">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title">${pet.name}(${pet.age}세, ${pet.gender})</h5>
        <p class="card-text">등록일 : ${pet.createdDate}<br>등록번호 : ${pet.registerNo}<br></p>
        <p class="card-text"><small class="text-muted"><a href="#">수정 </a><a href="#"> 삭제</a></small></p>
      </div>
    </div>
  </div>
</div>
</c:forEach>
</div>

</body>
</html>