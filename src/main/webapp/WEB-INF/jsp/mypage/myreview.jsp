<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='/node_modules/bootstrap/dist/css/bootstrap.min.css'>
<link rel="icon" href="/img/core-img/favicon.ico">
<link rel="stylesheet" href="/node_modules/blueimp-file-upload/css/jquery.fileupload.css">
<title>My Review</title>

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

.review-tr, .tr-test {
  text-align: center;
}

.review-tagP {
  text-align: left;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  width: 320px;
  display: block;
}

.r-tagA {
  outline: 0 solid transparent;
  color: #404040 !important;
  font-size: 20px;
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

span {
  color: #404040;
  font-size: 15px;
  line-height: 2;
  font-weight: 400;
}

.tableList {
  text-align: center;
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
    <div
      class="d-flex justify-content-between align-items-center py-0 mb-3 rInfo">
      <h3 class="recipe-h3">My Review</h3>
      <span class="rInfo-span"> <a href="/app/member/myprofile"
        class="mypage-tagA">My Page</a>&nbsp>&nbspMy Review
      </span>
    </div>
    <table class='table table-hover tableList'>
      <tr class="review-tr">
        <th style="width: 70px">번호</th>
        <th style="width: 270px">상품명</th>
        <th>내용</th>
        <th style="width: 140px">평점</th>
        <th style="width: 140px">작성일</th>
      </tr>
      <c:forEach items="${productReviews}" var="productReview" varStatus="status">
        <tr class="tempTr" style="text-align: center;" data-toggle="modal" data-target="#myModal">
          <tr class="tr-test">
            <td><div style="vertical-align: middle;">${status.count}</div></td>
            <td>
              <div>
                <a href="/app/product/detail?no=${productReview.products[0].productNo}" target="_blank" class="r-tagA"> 
                ${productReview.products[0].title}</a><br>
                <c:if test="${not empty productReview.options[0].title}">
                  <span style="color:#7a7a7a;">[옵션] ${productReview.options[0].title}</span>
                </c:if>
              </div>
            </td>
            
            <td>
              <div>
                <p style="float: left;">
                <img src="/upload/productreview/${productReview.filePath}" style="width: 100px; margin-right: 22px;"></p>
                <div>
                  <p class="review-tagP">
                    ${productReview.content}</p>
                </div>
              </div>
            </td>
            
            
            <td style="color: red;">
              <c:if test="${productReview.rating == 1}">★☆☆☆☆</c:if> 
              <c:if test="${productReview.rating == 2}">★★☆☆☆</c:if> 
              <c:if test="${productReview.rating == 3}">★★★☆☆</c:if> 
              <c:if test="${productReview.rating == 4}">★★★★☆</c:if> 
              <c:if test="${productReview.rating == 5}">★★★★★</c:if>
            </td>
            <td>${productReview.createdDate}</td>
          </tr>
        </tr>
      </c:forEach>
    </table>
  </div>

  <!--   <div class="modal fade bd-example-modal-lg" id="myAddModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" -->
  <!--     aria-hidden="true"> -->
  <!--     <div class="modal-dialog modal-lg"> -->
  <!--       <div class="modal-content"> -->
  <!--         <div class="modal-header"> -->
  <!--           <h5 class="modal-title" id="exampleModalLongTitle">상품후기 등록</h5> -->
  <!--           <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
  <!--             <span aria-hidden="true">&times;</span> -->
  <!--           </button> -->
  <!--         </div> -->
  <!--         <div class="modal-body"> -->

  <!--           <form action='../productreview/add' enctype='multipart/form-data' method='post'> -->
  <%--             <input type='text' name='productNo' id='productNo' value='${orderProduct.product.productNo}'><br> --%>
  <!--             <div class="row"> -->
  <!--                   <div class="col-md-4"> -->
  <!--                     <div> -->
  <%--               <input type="hidden" id="photo" value="${productReview.filePath}" /> --%>
  <!--               <img id="imgThumb" class="imgThumb" style="width: 250px; height: 250px; object-fit: cover"> -->
  <!--             </div> -->
  <!--               <input type='file' id='fileupload' name='file' /><br> -->
  <!--             </div> -->
  <!--             <div class="col-md-8"> -->
  <!--             <select class="custom-select" name='rating'> -->
  <!--                 <option selected value="5">★★★★★ [아주좋아요]</option> -->
  <!--                 <option value="4">★★★★☆ [맘에들어요]</option> -->
  <!--                 <option value="3">★★★☆☆ [보통이에요]</option> -->
  <!--                 <option value="2">★★☆☆☆ [그냥그래요]</option> -->
  <!--                 <option value="1">★☆☆☆☆ [별로에요]</option> -->
  <!--               </select> -->
  <!--               <hr> -->
  <!--               <textarea class="form-control" id="message-text" name="content" style="overflow:auto; height: 200px; resize: none;"></textarea> -->
  <!--           </div> -->
  <!--         </div> -->
  <!--           <hr> -->
  <!--           <div style="text-align: right;"> -->
  <!--               <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button> -->
  <!--               <button type="submit" class="btn btn-primary">등록하기</button> -->
  <!--             </div> -->
  <!--           </form> -->

  <!--         </div> -->
  <!--       </div> -->
  <!--     </div> -->
  <!--   </div> -->

  <jsp:include page="../footer.jsp" />

  <script src="/node_modules/jquery/dist/jquery.min.js"></script>
  <script src="/node_modules/bootstrap/dist/js/bootstrap.js"></script>

  <script>
      //   $('#myAddModal').on('show.bs.modal', function (e) {
      //     formLoad();
      //   })

      //     var shipStatus=$('.ship-status');
      //     var reviewButton=$('.reviewBtn');
      //     for (var i=0; i<shipStatus.length; i++) {
      //       if (shipStatus[i].innerText == 1) {
      //         shipStatus[i].innerText="입금 전";
      //       } else if (shipStatus[i].innerText == 2) {
      //         shipStatus[i].innerText="입금 확인";
      //       } else if (shipStatus[i].innerText == 3) {
      //         shipStatus[i].innerText="발송";
      //       } else if (shipStatus[i].innerText == 4) {
      //         shipStatus[i].innerText="구매확정";
      //       }
      //     }

      //     for (var  i=0; i<shipStatus.length; i++) {
      //       if (shipStatus[i].innerText == '구매확정') {
      //         reviewButton[i].setAttribute('style', 'inline');
      //       } 
      //     }

      //     function formLoad() {
      //       if ($("#photo").val() == null || $("#photo").val() == "") {
      //         $("#imgThumb").attr("src", "/upload/productreview/info_photo.jpg");
      //       } else {
      //         $("#imgThumb").attr("src", "/upload/productreview/" + $("#photo").val());
      //       }
      //     }

      //     document.getElementById("fileupload").onchange = function () {
      //       var reader = new FileReader();
      //       reader.onload = function (e) {
      //         document.getElementById("imgThumb").src = e.target.result;
      //       };
      //       reader.readAsDataURL(this.files[0]);
      //     };
    </script>
  <!-- <script>
    var tdTest = $('.tr-test td');
    
    for (var i = 0; i < tdTest.length; i++) {
      tdTest[i].setAttribute('style', 'vertical-align: middle');
      
    }
  </script> -->
</body>
</html>

























