<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<title>상품 목록</title>
<link rel='stylesheet'
  href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'
  integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T'
  crossorigin='anonymous'>
  <link rel='stylesheet' href='/css/style.css'>
  <link rel="stylesheet" href="/css/style_contact.css">
  <link rel="stylesheet" href="/css/style_footer.css">
</head>
  <jsp:include page="../header.jsp" />
<body>
  <div id='content'>
    <h1>상품 목록</h1>
    <a href='form'>상품 등록</a><br>
    <form action='search'>
      <select name='species' id='species' onchange=''>
        <option id='1' value='강아지'>강아지</option>
        <option id='2' value='고양이'>고양이</option>
        <option id='3' value='새'>새</option>
        <option id='4' value='물고기'>물고기</option>
        <option id='5' value='작은'>작은 동물</option>
        <option id='6' value='파충류'>파충류</option>
      </select><br>
      <input type='text' id='inputValue' value=''></input>
      <button>검색</button>
    </form>
    <table class='table table-hover' id='table1'>
      <tr>
        <th>번호</th>
        <th>상품명</th>
        <th>가격</th>
        <th>할인율</th>
        <th>카테고리</th>
        <th>동물분류</th>
        <th>사진</th>
      </tr>
      <c:forEach items="${products}" var="product">
        <tr>
          <td>${product.productNo}</td>
          <td><a href='detail?no=${product.productNo}'>${product.title}</a></td>
          <td>${product.price}</td>
          <td>${product.discount}</td>
          <td>${product.category}</td>
          <td>${product.species}</td>
          <td>
            <p>
              <c:forEach items="${product.files}" var="file" end="0">
                <img src='/upload/product/${file.filePath}' class='photo2' width=200>
              </c:forEach>
            </p>
          </td>
        </tr>
      </c:forEach>
    </table>
    
  </div>
  <jsp:include page="../footer.jsp" />
  
  <script>
    var selectedOption = document.getElementById("species");
    var species = selectedOption.options[selectedOption.selectedIndex].value;
    var inputValue = document.getElementById("inputValue");
    inputValue.value=species;
  </script>
  
</body>
</html>
