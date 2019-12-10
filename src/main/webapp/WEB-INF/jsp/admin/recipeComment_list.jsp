<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet'
	href='/node_modules/bootstrap/dist/css/bootstrap.min.css'>
<link rel="icon" href="/img/core-img/favicon.ico">
<link rel="stylesheet"
	href="/node_modules/blueimp-file-upload/css/jquery.fileupload.css">
<title>All Comments</title>

<style>
#orderBody {
	width: 1100px;
}

.rInfo {
  border-bottom: 2px solid #404040;
  padding-bottom: 5px;
}

.mypage-tagA {
  font-size: inherit;
  color:#404040;
}
  
.rInfo-span {
  float: right;
  font-size: 14px;
  font-weight: 600;
}

.review-tagP {
  text-align: left;
   overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  word-wrap: break-word;
  width: 275px;
  line-height: 2em;
  height: 4.0em;
}

.r-tagA {
  outline: 0 solid transparent;
  color: #404040 !important;
  font-size: 17px;
  font-weight: 600;
}

.recipe-h3 {
	font-family: 'Oswald' !important;
	text-transform: uppercase;
	font-size: 37px !important;
	font-weight: 500 !important;
	line-height: 1.2 !important;
	margin: 0 0 8px !important;
}

.tableList {
	text-align: center;
  margin-top: 5px;
}
</style>

</head>
<!-- mypage_sidebar start-->
<!-- Font Awesome -->
<link rel="stylesheet"
	href="/js/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- mypage_sidebar  end -->
<jsp:include page="../header.jsp" />
<jsp:include page="admin_sidebar.jsp" />
<body>
	<div id="orderBody" style="margin: 0 auto; margin-bottom: 200px;">
		<div
			class="d-flex justify-content-between align-items-center py-0 mb-3 rInfo">
			<h3 class="recipe-h3">All Recipe Comments</h3>
			<span class="rInfo-span">관리자페이지&nbsp;>&nbsp;전체댓글목록</span>
		</div>
		    <div class="btn-toolbar justify-content-between" role="toolbar">
      <div class="input-group">
        <select id="pageSize">
          <option value="3">3</option>
          <option value="8">8</option>
          <option value="10">10</option>
          <option value="20">20</option>
        </select>
      </div>
    </div>
		<table class='table table-hover tableList'>
			<tr class="review-tr">
				<th style="width: 60px">레시피번호</th>
				<th style="width: 60px">맴버번호</th>
				<th style="width: 100px">내용</th>
				<th style="width: 60px">작성일</th>
			</tr>
			<c:forEach items="${recipeCommentList}" var="recipeCommentList"
				varStatus="status">
				<tr class="tempTr" style="text-align: center;">
				<tr class="tr-test">
					<td>${recipeCommentList.recipeNo}</td>
					<td>${recipeCommentList.memberNo}</td>
					<td>
						<div>
							<a href="/app/recipe/detail?no=${recipeCommentList.recipeNo}"
								target="_blank" class="r-tagA">
								${recipeCommentList.content}</a><br>
						</div>
					</td>

					<td>${recipeCommentList.createdDate}</td>
				</tr>
			</c:forEach>
		</table>
		    <nav aria-label="Page navigation example">
      <ul class="pagination">
        <li class="page-item" data-page="prev">
          <a class="page-link" href="#">
            <span aria-hidden="true">&laquo;</span> 
          </a>
        </li>
        <c:forEach begin="${beginPage}" end="${endPage}" var="page">
        <li class="page-item" data-page="${page}">
          <a class="page-link" ${page != pageNo ? "href=#" : ""}>${page}</a>
        </li>
        </c:forEach>
        <li class="page-item" data-page="next">
          <a class="page-link" href="#">
            <span aria-hidden="true">&raquo;</span>
          </a>
        </li>
      </ul>
     </nav>
	</div>

	<jsp:include page="../footer.jsp" />

	<script src="/node_modules/jquery/dist/jquery.min.js"></script>
	<script src="/node_modules/bootstrap/dist/js/bootstrap.js"></script>
  <script>
  (function() {
    $('#pageSize').val('${pageSize}')
  })();
  $('#pageSize').change((e) => {
    location.href = "recipeComment_list?pageSize=" + $(e.target).val();
  });
  var currentPage = ${pageNo};
  $('.page-item').click((e) => {
    e.preventDefault();
    // e.currentTarget? 리스너가 호출될 때, 그 리스너가 등록된 태그를 가르킨다.
    // e.target? 이벤트가 발생된 원천 태그이다. 
    //var page = e.currentTarget.getAttribute('data-page');
    var page = $(e.currentTarget).attr('data-page');
    if (page == "prev") {
      if (currentPage == 1)
        return;
      location.href = "recipeComment_list?pageNo=" + (currentPage - 1) + "&pageSize=" + ${pageSize};
      
    } else if (page == "next") {
      if (currentPage >= ${totalPage})
        return;
      location.href = "recipeComment_list?pageNo=" + (currentPage + 1) + "&pageSize=" + ${pageSize};
    
    } else {
      location.href = "recipeComment_list?pageNo=" + page + "&pageSize=" + ${pageSize};
    }
  });
  </script>

</body>
</html>

























