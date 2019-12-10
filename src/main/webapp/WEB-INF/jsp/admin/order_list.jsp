<%@page import="bitcamp.chopchop.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
  <title>전체 주문 목록</title>
  <style>
   
  #admin-content {
    width: 1100px;
    padding-top: 10px;
    margin: 0 auto;
  }

  #productBody {
    width: 1100px;
    margin: 0 auto;
    text-align: center;
    vertical-align: middle;
  }

  #productList {
    padding: 5px;
    margin: 5px;
    text-align: center;
    float: left;
  }

.oInfo {
  border-bottom: 2px solid #404040;
  padding-bottom: 5px;
}

.admin-tagA {
  font-size: inherit;
  color:#404040;
}
  
.oInfo-span {
  float: right;
  font-size: 14px;
  font-weight: 600;
}

.o-tagA {
  outline: 0 solid transparent;
  color: #404040 !important;
  font-size: 18px;
}

.order-h3 {
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
<body>
  <jsp:include page="../header.jsp" />
  <jsp:include page="admin_sidebar.jsp"/>
  <div id="admin-content">
  <div class="d-flex justify-content-between align-items-center py-0 mb-3 oInfo">
      <h3 class="order-h3">All Order</h3>
      <span class="oInfo-span"> 
      관리자페이지&nbsp;>&nbsp;전체주문목록</span>
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
          <th>주문번호</th>
          <th>결제일</th>
          <th>회원이름</th>
          <th>결제금액</th>
          <th>결제수단</th>
          <th>주문상태</th>
          <th>비고</th>
        </tr>
        <c:forEach items="${orders}" var="order">
          <tr>
            <td>${order.orderNo}
              <input type="hidden" class="tempOrderNum" value="${order.orderNo}">
            </td>
            <td>${order.paymentDate}</td>
            <td>${order.name}</td>
            <td>
              <c:forEach items="${order.orderProducts}" var="orderProduct">
                <fmt:formatNumber value="${orderProduct.discountPrice}" pattern="#,###" />원
              </c:forEach>
            </td>
            <td>${order.paymentMethod}</td>
            <td class="ship-status">${order.shipStatus}</td>
            <td>
              <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                주문상태변경
              </button>
            </td>
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
  <!-- Modal -->
  <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalCenterTitle">주문상태변경</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form action="../order/statusupdate" method='post'>
            <input type="hidden" id="tempOrderNo" name="no" value="0">
            <select class="form-control" name="shipStatus">
              <option class="ship-status" value="1">1</option>
              <option class="ship-status" value="2">2</option>
              <option class="ship-status" value="3">3</option>
              <option class="ship-status" value="4">4</option>
            </select>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
          <button type="submit" class="btn btn-primary">수정</button>
        </div>
        </form>
      </div>
    </div>
  </div>
  <jsp:include page="../footer.jsp" />
  <script src="/node_modules/bootstrap/dist/js/bootstrap.js"></script>
  <script>
  (function() {
    $('#pageSize').val('${pageSize}')
  })();
  $('#pageSize').change((e) => {
    location.href = "order_list?pageSize=" + $(e.target).val();
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
      location.href = "order_list?pageNo=" + (currentPage - 1) + "&pageSize=" + ${pageSize};
      
    } else if (page == "next") {
      if (currentPage >= ${totalPage})
        return;
      location.href = "order_list?pageNo=" + (currentPage + 1) + "&pageSize=" + ${pageSize};
    
    } else {
      location.href = "order_list?pageNo=" + page + "&pageSize=" + ${pageSize};
    }
  });
  
  
    $(document).on("click", ".btn-primary", function () {
      // console.log($(this)[0].parentNode.parentNode.cells[5].textContent);
      var tempSelectOption = $(this)[0].parentNode.parentNode.cells[5].textContent;
      // var tempSelectOptionNo = 0;
      if (tempSelectOption == "입금 전") {
        $("select option[value='1']").attr("selected", true);
      } else if (tempSelectOption == "입금 확인") {
        $("select option[value='2']").attr("selected", true);
      } else if (tempSelectOption == "발송") {
        $("select option[value='3']").attr("selected", true);
      } else if (tempSelectOption == "구매확정") {
        $("select option[value='4']").attr("selected", true);
      }
      // $("select option[value=tempSelectOptionNo]").attr("selected", true);
      tempOrderNo.value = $(this)[0].parentNode.parentNode.cells[0].firstElementChild.value;
      $('#exampleModalCenter').on('show.bs.modal', function (e) {
        changeStatus()
      });
    })
    function changeStatus() {
      var shipStatus = $('.ship-status');
      for (var i = 0; i < shipStatus.length; i++) {
        if (shipStatus[i].innerText == 1) {
          shipStatus[i].innerText = "입금 전";
        } else if (shipStatus[i].innerText == 2) {
          shipStatus[i].innerText = "입금 확인";
        } else if (shipStatus[i].innerText == 3) {
          shipStatus[i].innerText = "발송";
        } else if (shipStatus[i].innerText == 4) {
          shipStatus[i].innerText = "구매확정";
        }
      }
    }
    changeStatus()
  </script>
</body>
</html>