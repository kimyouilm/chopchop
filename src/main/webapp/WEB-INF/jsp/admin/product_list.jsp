<%@page import="bitcamp.chopchop.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
  <title>전체 상품 목록</title>
  <link rel='stylesheet' href='/node_modules/bootstrap/dist/css/bootstrap.min.css'>
  <style>

#admin-content {
  width: 1100px;
  margin: 0 auto;
}

.pInfo {
  border-bottom: 2px solid #404040;
  padding-bottom: 5px;
}

.admin-tagA {
  font-size: inherit;
  color:#404040;
}
  
.pInfo-span {
  float: right;
  font-size: 14px;
  font-weight: 600;
}

.product-h3 {
  font-family: 'Oswald' !important; 
  text-transform: uppercase;
  font-size: 37px !important;
  font-weight: 500 !important;
  line-height: 1.2 !important;
  margin: 0 0 8px !important;
}

.r-tagA {
  outline: 0 solid transparent;
  color: #404040 !important;
  font-size: 17px;
  font-weight: 600;
}

.tableList {
  text-align: center;
  margin-top: 5px;
}
  </style>

</head>

<jsp:include page="../header.jsp"/>
<jsp:include page="admin_sidebar.jsp"/>
<body>

  <div id="admin-content">
    <div class="d-flex justify-content-between align-items-center py-0 mb-3 pInfo">
      <h3 class="product-h3">All Product</h3>
      <span class="pInfo-span">관리자페이지&nbsp;>&nbsp;전체상품목록</span>
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
    <button class="btn btn-secondary btn-sm" type="button" 
    onclick="location.href='/app/product/form'" 
    style="float:right;">새 상품</button>
    </div>
    <table class='table table-hover tableList'>
      <tr>
        <th>상품번호</th>
        <th>상품명</th>
        <th>상품금액</th>
        <th>할인율</th>
        <th>할인적용금액</th>
        <th>조회수</th>
      </tr>
      <c:forEach items="${products}" var="product">
        <tr>
          <td>${product.productNo}</td>
          <td><a href='/app/product/detail?no=${product.productNo}' target="_blank" class="r-tagA">
          <div>
                <p style="float: left;">
                <img src="/upload/product/${product.files[0].filePath}" style="width: 100px; margin-right: 22px;"></p>
                <div>
                  <p>${product.title}</p>
                </div>
              </div></a><br>
          </td>
          <td>
            <span style=" text-decoration:line-through">
            <fmt:formatNumber value="${product.price}" pattern="#,###" /> 원</span>
          </td>
          <td>${product.discount}</td>
          <td><span>
            <span id='product-price'><fmt:formatNumber value="${product.price * (100 - product.discount) / 100}" pattern="#,###" /></span>
            원</span>
            </td>
          <td>${product.viewCount}</td>
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
  <jsp:include page="../footer.jsp"/>
  <script src="/node_modules/jquery/dist/jquery.min.js"></script>
  <script src="/node_modules/bootstrap/dist/js/bootstrap.js"></script>

 <script>
 
 (function() {
	    $('#pageSize').val('${pageSize}')
	  })();
	  $('#pageSize').change((e) => {
	    location.href = "product_list?pageSize=" + $(e.target).val();
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
	      location.href = "product_list?pageNo=" + (currentPage - 1) + "&pageSize=" + ${pageSize};
	      
	    } else if (page == "next") {
	      if (currentPage >= ${totalPage})
	        return;
	      location.href = "product_list?pageNo=" + (currentPage + 1) + "&pageSize=" + ${pageSize};
	    
	    } else {
	      location.href = "product_list?pageNo=" + page + "&pageSize=" + ${pageSize};
	    }
	  });
</script>
</body>
</html>
