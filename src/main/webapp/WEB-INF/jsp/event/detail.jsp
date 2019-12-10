<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
  <title>이벤트 상세</title>
  <link rel='stylesheet' href='/node_modules/bootstrap/dist/css/bootstrap.min.css'>
  <link rel="stylesheet" href="/node_modules/blueimp-file-upload/css/jquery.fileupload.css">

  <style>
    #jumbotron.jumbotron-fluid {
      background-color: white;

    }

    #header {
      width: 1100px;
      margin: 0 auto;
    }

    #eventBody {
      width: 1100px;
      padding-top: 10px;
      margin: auto auto;
      /*
      text-align: center;
      vertical-align: middle;
      */
    }

    #footer {
      background-color: #524845;
      color: #ffffff;
      height: 40px;
      width: 1100px;
      text-align: center;
      vertical-align: middle;
      padding-top: 10px;
      margin: auto auto;
      clear: left;
    }

    .closeIcon {
      float: right;
      /* display: inline-block; */
      font-weight: 500;
      text-shadow: 0 1px 0 #fff;
      font-size: 25px;
      /* vertical-align: top; */
    }

    .closeIcon:hover {
      border: 0;
      cursor: pointer;
      opacity: .75;
    }

    #qt {
      width: 162px;
      float: left;
      margin-right: 10px;
    }
  </style>
</head>

<body>

  <jsp:include page="../header.jsp" />

  <div>
    <div id="eventBody">
          <div class="blog-thumbnail">
            <c:forEach items="${event.files}" var="file" end="0">
              <img src="/upload/event/${file.filePath}" style="width: 1100px; object-fit: cover;">
            </c:forEach>
          </div>

      <hr class="my-4">
      <p>
        <c:forEach items="${event.files}" var="file" begin="1">
          <img src="/upload/event/${file.filePath}" style="width: 1100px;">
        </c:forEach>
      </p>
       <hr class="my-4">
       <form action="updateform" method="post">
         <input type="hidden" name="no" value="${event.eventNo}">
         <button type="submit" id="update-event" class="btn btn-success" style="display:none;">수정</button>
         <button type="button" class="btn btn-secondary" onclick="location.href='list'">목록</button>
    </form>
    </div>
  </div>

<jsp:include page="../footer.jsp" />

<script>
  
  // 관리자 기능
  var adminCheck = ${loginUser.grade};
  if(adminCheck == 0) {
    console.log(adminCheck);
    $('#update-event').attr('style', 'display:inline');
  }
  
  </script>

</body>
</html>


































