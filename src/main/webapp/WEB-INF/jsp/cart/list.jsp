<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>

<head>
  <title>장바구니 리스트</title>
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'>

</head>

<body>
  <div id='cart'>

    <table class='table table-hover'>
      <tr>
        <th>장바구니 번호</th>
        <th>회원번호</th>
        <th>상품번호</th>
        <th>옵션번호</th>
        <th>수량</th>
        <th>등록일</th>
      </tr>
      <c:forEach items="${carts}" var="cart">
        <tr>
          <td>${cart.cartNo}</td>
          <td>${cart.memberNo}</td>
          <td>${cart.productNo}</td>
          <td>${cart.optionNo}</td>
          <td>${cart.quantity}</td>
          <td>${cart.createdDate}</td>
        </tr>
      </c:forEach>
    </table>
  </div>

</body>

</html>