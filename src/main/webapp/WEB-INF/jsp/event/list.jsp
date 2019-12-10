<%@page import="bitcamp.chopchop.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
  <title>이벤트</title>
  <link rel="stylesheet" href="/css/main/main_style.css">
  <link rel='stylesheet' href='/node_modules/bootstrap/dist/css/bootstrap.min.css'>

  <style>
    img {
      max-width: 100%;
    }

    .container,
    .row {
      width: 1100px !important;
      padding: 0 !important;
    }

    .event-title {
      overflow: hidden;
      text-overflow: ellipsis;
      display: -webkit-box;
      -webkit-line-clamp: 1;
      -webkit-box-orient: vertical;
      word-wrap: break-word;
      width: 1000px;
      line-height: 2em;
      height: 2.0em;
    }

    #prod_columns {
      width: 1100px;
      column-width: 1100px;
      column-gap: 10px;
      /*   height: 950px !important; */
    }

    #prod_columns figure {
      height: 300px;
      display: inline-block;
      margin: 0;
      margin-bottom: 10px;
      padding: 10px;
    }

    #prod_columns figure:hover {
      box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
    }

    #prod_columns figure img {
      object-fit: cover;
      width: 1060px;
      height: 200px;
    }

    #prod_columns figure figcaption {
      border-top: 1px solid rgba(0, 0, 0, 0.1);
      margin-top: 5px;
      padding: 10px;
    }

    span {
      color: #7a7a7a;
      font-size: 16px;
      line-height: 2;
      font-weight: 1000;
    }
  </style>

</head>

<body>

  <jsp:include page="../header.jsp" />

  <h3>chop Event</h3>

  <div class="bueno-post-area mb-70">
    <div class="container">
      <div class="row ml-0">
        <div id="prod_columns" style="align-content: center;">
          <c:forEach items="${events}" var="event">
            <figure>
              <a href="/app/event/detail?no=${event.eventNo}"><img src="/upload/event/${event.files[0].filePath}"></a>
              <figcaption>
                <div class="evnet-info">
                  <div class="event-title tagA">
                    <a href="/app/event/detail?no=${event.eventNo}"><strong
                        style="font-size: 22px;">${event.title}</strong></a>
                  </div>
                  <div class="event-detail">
                      <span style="color:#35c5f0;">${event.content}&nbsp</span>
                    <span>
                      <fmt:parseDate value="${event.startDate}" var="startDateFmt" pattern="yyyyMMdd" />
                      <fmt:formatDate value="${startDateFmt}" pattern="yyyy-MM-dd" />
                    </span>
                    <span> ~ </span>
                    <span>
                      <fmt:parseDate value="${event.endDate}" var="endDateFmt" pattern="yyyyMMdd" />
                      <fmt:formatDate value="${endDateFmt}" pattern="yyyy-MM-dd" />
                    </span>
                  </div>
                </div>
              </figcaption>
            </figure>
          </c:forEach>
        </div>
      </div>
      <br><button type="button" id="new-event" class="btn btn-success" onclick="location.href='form'"
        style="display:none;">이벤트 등록</button>
    </div>
  </div>

  <jsp:include page="../footer.jsp" />

  <script src="../js/jquery/jquery-2.2.4.min.js"></script>
  <!-- Popper js -->
  <script src="../js/bootstrap/popper.min.js"></script>
  <!-- Bootstrap js -->
  <script src="../js/bootstrap/bootstrap.min.js"></script>
  <!-- All Plugins js -->
  <script src="../js/plugins/plugins.js"></script>
  <!-- Active js -->
  <script src="../js/active.js"></script>

  <script>

    var adminCheck = ${ loginUser.grade };
    if (adminCheck == 0) {
      $('#new-event').attr('style', 'inline');
    }

  </script>



</body>

</html>