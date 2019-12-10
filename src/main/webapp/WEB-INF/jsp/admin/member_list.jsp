<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>전체 회원 목록</title>

<style>
#admin-content {
  width: 1100px !important;
  margin: 0 auto;
}

.mInfo {
  border-bottom: 2px solid #404040;
  padding-bottom: 5px;
}

.admin-tagA {
  font-size: inherit;
  color:#404040;
}
  
.mInfo-span {
  float: right;
  font-size: 14px;
  font-weight: 600;
}

.m-tagA {
  outline: 0 solid transparent;
  color: #404040 !important;
  font-size: 18px;
}

.member-h3 {
  font-family: 'Oswald' !important; 
  text-transform: uppercase;
  font-size: 37px !important;
  font-weight: 500 !important;
  line-height: 1.2 !important;
  margin: 0 0 8px !important;
}

.tableList {
  text-align: center;
}
</style>
</head>
<jsp:include page="../header.jsp" />
<jsp:include page="admin_sidebar.jsp"/>
<body>
  <div id="admin-content">
    <div
      class="d-flex justify-content-between align-items-center py-0 mb-3 mInfo">
      <h3 class="member-h3">All Member</h3>
      <span class="mInfo-span">관리자페이지&nbsp;>&nbsp;전체회원목록</span>
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
      <tr>
        <th>회원 번호</th>
        <th>이메일</th>
        <th>닉네임</th>
        <th>핸드폰 번호</th>
        <th>상태</th>
      </tr>
      <c:forEach items="${members}" var="member">
        <tr>
          <td>${member.memberNo}</td>
          <td>${member.email}</td>
          <td>${member.nickname}</td>
          <td>${member.tel}</td>
          <td>활동중</td>
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
</body>
<jsp:include page="../footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script>
	(function() {
	  $('#pageSize').val('${pageSize}')
	})();
	$('#pageSize').change((e) => {
	  location.href = "member_list?pageSize=" + $(e.target).val();
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
	    location.href = "member_list?pageNo=" + (currentPage - 1) + "&pageSize=" + ${pageSize};
	    
	  } else if (page == "next") {
	    if (currentPage >= ${totalPage})
	      return;
	    location.href = "member_list?pageNo=" + (currentPage + 1) + "&pageSize=" + ${pageSize};
	  
	  } else {
	    location.href = "member_list?pageNo=" + page + "&pageSize=" + ${pageSize};
	  }
	});
</script>
</html>