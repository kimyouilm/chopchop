<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<title>상품문의</title>
<link rel='stylesheet'
  href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'
  integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T'
  crossorigin='anonymous'>
<link rel='stylesheet' href='/css/common.css'>
<link rel="stylesheet" href="/css/style.css">
</head>
<body>
  <div id='comment'>
    <h6>상품문의</h6>
    <table class='table table-hover'>
      <tr>
        <th>문의번호</th>
        <th>제목</th>
        <th>작성일</th>
      </tr>
      <c:forEach items="${product.comments}" var="comment">
        <tr>
          <td>${comment.commentNo}</td>
          <td><span id='title'>${comment.title}</span></td>
          <td>${comment.createdDate}</td>
          <td>${comment.content}</td>
        </tr>
      </c:forEach>
    </table>
  </div>
  <script type="text/javascript">
    var title = document.getElementById('title');
    var content = document.getElementById('content');
    for(var e of content) {
      e.style['display']=hidden;
    }
//     title.click(content.hidden=true);
  </script>
</body>
</html>