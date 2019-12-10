<%@page import="bitcamp.chopchop.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <link rel='stylesheet' href='/css/member/style_footer.css'>
  <link rel='stylesheet' href='/css/member/style-header.css'>
  <link rel='stylesheet' href='/node_modules/bootstrap/dist/css/bootstrap.min.css'>
  <link rel="icon" href="img/core-img/favicon.ico">
  <link rel="stylesheet" href="/node_modules/blueimp-file-upload/css/jquery.fileupload.css">
  <title>주문 목록</title>

  <style>
   #orderBody { 
     width: 1100px; 
   } 

/*   #productBody { */
/*     width: 1100px; */
/*     margin: auto auto; */
/*     text-align: center; */
/*     vertical-align: middle; */
/*   } */

/*   #productList { */
/*     padding: 5px; */
/*     margin: 5px; */
/*     text-align: center; */
/*     float: left; */
/*   } */
  
  
  #orderBody {
    width:1100px;
    margin-left:auto;
    margin-right:auto;
  }
  
  .mInfo {
    border-bottom: 2px solid #404040;
  }
  
  .mypage-tagA {
    font-size: inherit;
    color:#404040;
  }
  
  .recipe-h3 {
  font-family: 'Oswald' !important;
  text-transform: uppercase;
  font-size: 37px !important;
  font-weight: 500 !important;
  line-height: 1.2 !important;
  margin: 0 0 8px !important;
}

.rInfo-span {
  float: right;
  font-size: 14px;
  font-weight: 600;
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
<jsp:include page="../member/mypage_sidebar.jsp" />
<body>
  <div id="orderBody" style="margin: 0 auto; margin-bottom: 200px;">
  <div class="d-flex justify-content-between align-items-center py-0 mb-3 mInfo">
      <h3 class="recipe-h3">My Order</h3>
       <span class="rInfo-span">
       <a href="/app/member/myprofile" class="mypage-tagA">My Page</a>&nbsp>&nbspMy Order</span> 
    </div>
    <div class="d-flex align-content-start flex-wrap">
      <table class='table table-hover' style="text-align:center;">
        <tr>
          <th>상품이름</th>
          <th>옵션번호</th>
          <th>수량</th>
          <th>최종가격</th>
          <th>주문일</th>
          <th>상태</th>
          <th> </th>
        </tr>
        <c:forEach items="${orderProducts}" var="orderProduct">
          <tr>
            <td>${orderProduct.product.title}</td>
            <td>${orderProduct.productOption.title}</td>
            <td>${orderProduct.quantity}</td>
            <td>${orderProduct.discountPrice}원</td>
            <td>${orderProduct.order.paymentDate}</td>
            <td class="ship"><span class="ship-status">${orderProduct.order.shipStatus}</span></td>
            <td>
              <span class="status" style="display:none">${orderProduct.order.shipStatus}</span>
              <span class="product-no" style="display:none">${orderProduct.product.productNo}</span>
              <span class="order-no" style="display:none">${orderProduct.order.orderNo}</span>
              <button id="updateBtn" class="btn btn-success" onclick="location.href='updateform?no=${orderProduct.order.orderNo}'">변경</button>
              <button type="button" class="recieveBtn btn btn-success">구매확정</button>
              <button type="button" class="reviewBtn btn btn-success" data-toggle="modal" style="display:none" data-target=".bd-example-modal-lg">후기작성</button>
              <button id="cancelBtn" class="btn btn-danger" onclick="location.href='delete?no=${orderProduct.orderNo}'">주문취소</button>
            </td>
          </tr>
        </c:forEach>
      </table>
    </div>
  </div>
  
  <div class="modal fade bd-example-modal-lg" id="myAddModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLongTitle">상품후기 등록</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
  
          <form action='../productreview/add' enctype='multipart/form-data' method='post'>
            <input type='hidden' name='productNo' id='productNo' value=''><br>
            <div class="row">
                  <div class="col-md-4">
                    <div>
              <input type="hidden" id="photo" value="${productReview.filePath}" />
              <img id="imgThumb" class="imgThumb" style="width: 250px; height: 250px; object-fit: cover">
            </div>
              <input type='file' id='fileupload' name='file' /><br>
            </div>
            <div class="col-md-8">
            <select class="custom-select" name='rating'>
                <option selected value="5">★★★★★ [아주좋아요]</option>
                <option value="4">★★★★☆ [맘에들어요]</option>
                <option value="3">★★★☆☆ [보통이에요]</option>
                <option value="2">★★☆☆☆ [그냥그래요]</option>
                <option value="1">★☆☆☆☆ [별로에요]</option>
              </select>
              <hr>
              <textarea class="form-control" id="message-text" name="content" style="overflow:auto; height: 200px; resize: none;"></textarea>
          </div>
        </div>
          <hr>
          <div style="text-align: right;">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
              <button type="submit" class="btn btn-primary">등록하기</button>
            </div>
          </form>
  
        </div>
      </div>
    </div>
  </div>
  
  
    
  <jsp:include page="../footer.jsp"/>
  
  <script src="/node_modules/jquery/dist/jquery.min.js"></script>
  <script src="/node_modules/bootstrap/dist/js/bootstrap.js"></script>
  
  <script>
  function changeStatus() {
    var shipStatus=$('.ship-status');
    var recieveButton=$('.recieveBtn');
    var reviewButton=$('.reviewBtn');
    for (var i=0; i<shipStatus.length; i++) {
      if (shipStatus[i].innerText == 1) {
        shipStatus[i].innerText="입금 전";
      } else if (shipStatus[i].innerText == 2) {
        shipStatus[i].innerText="입금 확인";
      } else if (shipStatus[i].innerText == 3) {
        shipStatus[i].innerText="발송";
      } else if (shipStatus[i].innerText == 4) {
        console.log('구매확정');
        shipStatus[i].innerText="구매확정";
        recieveButton[i].setAttribute('style', 'display:none');
        reviewButton[i].setAttribute('style', 'display:inline');
      }
    }
  }
  
  changeStatus();
  
  $('#myAddModal').on('show.bs.modal', function (e) {
    formLoad();
  })
  
    
    function formLoad() {
      if ($("#photo").val() == null || $("#photo").val() == "") {
        $("#imgThumb").attr("src", "/upload/productreview/info_photo.jpg");
      } else {
        $("#imgThumb").attr("src", "/upload/productreview/" + $("#photo").val());
      }
    }

    document.getElementById("fileupload").onchange = function () {
      var reader = new FileReader();
      reader.onload = function (e) {
        document.getElementById("imgThumb").src = e.target.result;
      };
      reader.readAsDataURL(this.files[0]);
    };
    
    
    
    $(document).on('click', '.reviewBtn', function(e) {
      var productNo = $(this.parentNode).find('.product-no').text();
      $('#myAddModal').on('shown.bs.modal', function (e) {
        $('#productNo').val(productNo);
      });
      console.log(productNo);
    });
    
    
    $(document).on('click', '.recieveBtn' , function(e){
      if(!confirm('구매확정하시겠습니까?')) {
        return false;
      }
      var ship = $(this.parentNode.parentNode).find('.ship').find('.ship-status');
      var orderNo = $(this.parentNode).find('.order-no').text();
      var recieveBtn = $(this);
      var reviewBtn = $(this.parentNode).find('.reviewBtn');
      console.log($(ship).text());
      
      $.ajax({
        url:'/app/order/statusupdate',
        method:'post',
        data:{no: orderNo, status: 4},
        success: function(e) {
          $(ship).text('구매확정');
          changeStatus();
          $(recieveBtn).attr('style', 'display:none');
          $(reviewBtn).attr('style', 'display:inline');
        }
      })
    })
    
  </script>
  
</body>



</html>

























