<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<title>장바구니</title>
<link rel='stylesheet' href='/node_modules/jquery/dist/jquery.min.js'>
<link rel='stylesheet' href='/css/common/bootstrap.min.css'>

<!--   <link rel='stylesheet' href='/node_modules/bootstrap/dist/css/bootstrap.min.css'> -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
#productBody {
	width: 1100px;
	padding-top: 10px;
	padding-bottom: 10px;
	margin: auto auto;
}

.input-number {
	float: none;
	width: 50px;
	border: 1px solid #DBE5E7;
	border-radius: 2px;
	margin-bottom: 0px;
	padding: 5px;
}
</style>

</head>
<jsp:include page="../header.jsp" />
<body>


	<div id='productBody'>

		<div style="margin-bottom: 5px;">
			<button type='button' class="btn btn-secondary btn-sm"
				onclick='check_all();'>모두 선택</button>
			<button type='button' class="btn btn-secondary btn-sm"
				onclick='uncheck_all();'>모두 해제</button>
		</div>

		<table class='table table-hover'>
			<tr style="text-align: center;">
				<th style="width: 80px">선택</th>
				<th style="width: 130px">상품사진</th>
				<th>상품/옵션정보</th>
				<th style="width: 80px">수량</th>
				<th>상품금액</th>
				<th style="width: 100px">옵션가</th>
				<th>총액</th>
				<th style="width: 100px">배송비</th>
				<th style="width: 50px">주문</th>

			</tr>
			<c:forEach items="${carts}" var="cart">
				<tr style="text-align: center;">
					<td class="check-td"><input class="myChkbox" type="checkbox"
						name="chkbox" value="${cart.cartNo}"></td>
					<td><c:forEach items="${cart.files}" var="file" end="0">
							<img src='/upload/product/${file.filePath}'
								style="width: 100px; height: 100px; object-fit: cover">
						</c:forEach></td>
					<td class="selected-products" style="text-align: left"><c:forEach
							items="${cart.products}" var="product">
							<input class="selected-product-productNo" data-name="productNo"
								data-no="" type="hidden" value="${product.productNo}">
              ${product.title}<br>
						</c:forEach>
						<hr> <c:forEach items="${cart.options}" var="productOption">
                  ${productOption.title} ( +<fmt:formatNumber
								value="${productOption.price}" pattern="#,###" />원 )<br>
							<input class="selected-product-optionNo" data-name="optionNo"
								data-no="" type="hidden" value="${productOption.optionNo}">
						</c:forEach></td>
					<td>
						<form action="update" method="POST">
							<div class="input-group input-number-group">
								<input class="input-number" name="quantity" type="number"
									style="text-align: center; width: 80px; margin-bottom: 5px;"
									value="${cart.quantity}" min="0" max="1000"> <input
									type="hidden" name="cartNo" value="${cart.cartNo}">
								<button class="btn btn-secondary btn-sm" style="width: 80px">변경</button>
							</div>
						</form>
					</td>
					<c:forEach items="${cart.products}" var="product">
						<c:forEach items="${cart.options}" var="productOption">
							<td><span style="text-decoration: line-through"><fmt:formatNumber
										value="${product.price * cart.quantity}" pattern="#,###" />원<br></span>
								<fmt:formatNumber
									value="${product.price * ((100-product.discount)/100) * cart.quantity}"
									pattern="#,###" />원</td>
						</c:forEach>
					</c:forEach>
					<td><c:forEach items="${cart.options}" var="option">
							<fmt:formatNumber value="${option.price * cart.quantity}"
								pattern="#,###" />원
            </c:forEach></td>
					<c:forEach items="${cart.products}" var="product">
						<c:forEach items="${cart.options}" var="productOption">
							<td>
								<%--                     <a style="text-decoration:line-through"><fmt:formatNumber value="${(product.price + productOption.price) * cart.quantity}" pattern="#,###"/>원</a><br> --%>
								<span style="color: red"><fmt:formatNumber
										value="${((product.price * (100 - product.discount) / 100) + productOption.price) * cart.quantity}"
										pattern="#,###" /></span>원<br> <input
								class="selected-product-price" type="hidden" name="chkprice"
								value="${((product.price * (100 - product.discount) / 100) + productOption.price) * cart.quantity}">
							</td>
						</c:forEach>
					</c:forEach>

					<td>
						<!-- <span class="tempShip" id="tempShipCheckPrice">[기본배송]<br>조건</span> -->
						<span data-toggle="tooltip" data-placement="top"
						title="주문금액이 50,000원 미만시 배송비 2,500원이 청구됩니다.">[기본배송]<br>조건
					</span>
					</td>

					<td>
						<button type="button" class="btn btn-secondary btn-sm"
							style="margin-bottom: 5px;">주문</button>
						<br>
						<button type="button" class="btn btn-danger btn-sm"
							onclick="location.href='delete?no=${cart.cartNo}' ">삭제</button>
					</td>
				</tr>
			</c:forEach>
		</table>

		<hr class="my-4" style="margin-top: 0px;">

		<div style="text-align: right;">
			<a>상품금액 </a><a id="sumCheckPrice">0</a> <a>원 + 배송비 </a><a
				id="shipCheckPrice">0</a> <a>원 = 합계금액 </a><a id="totalCheckPrice"
				style="color: red">0</a> <a>원</a>
		</div>


		<hr class="my-4">

		<div style="text-align: right">
			<form id="selected-product" method="post">

				<button type="button" class="btn bueno-btn" onclick='check_Del();'>선택삭제</button>
				<button type="submit" id="selectOrderBtn" class="btn bueno-btn"
					formaction="/app/order/cartorderform">선택구매</button>
				<button type="submit" id="allOrderBtn" class="btn bueno-btn"
					formaction="/app/order/cartorderform">전체구매</button>
			</form>

		</div>
	</div>

	<jsp:include page="../footer.jsp" />

	<script src="/node_modules/handlebars/dist/handlebars.min.js"></script>
	<script id="cart-template" type="text/x-handlebars-template">
    <input type="hidden" class="product-no" name="productNo">
    <input type="hidden" class="option-no" name="optionNo">
    <input type="hidden" class="cart-no" name="cartNo">
  </script>

	<script>
    var chkbox = $('.myChkbox');
    var cartTemplate = Handlebars.compile($('#cart-template').html());
    
    var noCheck = [];
    <c:forEach items="${carts}" var="cart">
      <c:forEach items="${cart.products}" var="product">
      <c:forEach items="${cart.options}" var="productOption">
        noCheck.push({'cartNo':${cart.cartNo}, 'productNo':${cart.productNo}, 'optionNo':${productOption.optionNo}})
      </c:forEach>
      </c:forEach>
    </c:forEach>
    
    var temp =0;
    $('#selectOrderBtn').on('click', (e) => {
      for(var i=0;i<$('.selected-products input[data-name="productNo"]').length;i++){
        if(chkbox[i].checked) {
          $('.selected-products input[data-name="productNo"]').attr('data-no', i);
          var selectedIndex = $('.selected-products input[data-name="productNo"]').attr('data-no');
          $('#selected-product').append(cartTemplate());
          console.log($('#selected-product').html());
          var proNo = $('#selected-product .product-no');
          console.log(i);
          document.getElementsByClassName('product-no')[temp].setAttribute('value', noCheck[selectedIndex].productNo);
          document.getElementsByClassName('option-no')[temp].setAttribute('value', noCheck[selectedIndex].optionNo);
          document.getElementsByClassName('cart-no')[temp].setAttribute('value', noCheck[selectedIndex].cartNo);
          temp++;
          console.log($('#selected-product').html());
        }
      }
    });
    
    $('#allOrderBtn').on('click', (e) => {
      var allOrderBtn = $('.myChkbox');
      for (i = 0; i < allOrderBtn.length; i++) {
        myCheckBoxes[i].checked = true;
      }
      
      if(!confirm('모두 구매하시겠습니까?')) {
        for(var i=0;i<allOrderBtn.length; i++) {
          myCheckBoxes[i].checked = false;
        }
        return;
      }
      
      for(var i=0;i<$('.selected-products input[data-name="productNo"]').length;i++){
        if(chkbox[i].checked) {
          $('.selected-products input[data-name="productNo"]').attr('data-no', i);
          var selectedIndex = $('.selected-products input[data-name="productNo"]').attr('data-no');
          $('#selected-product').append(cartTemplate());
          var proNo = $('#selected-product .product-no');
          document.getElementsByClassName('product-no')[temp].setAttribute('value', noCheck[selectedIndex].productNo);
          document.getElementsByClassName('option-no')[temp].setAttribute('value', noCheck[selectedIndex].optionNo);
          document.getElementsByClassName('cart-no')[temp].setAttribute('value', noCheck[selectedIndex].cartNo);
          temp++;
        }
      }
    });
    
//     function getProductNo(no) {
//       for (var checkProduct of noCheck) {
//         if(no == checkProduct.productNo) {
//           return checkProduct;
//         }
//       }
//       return null;
//     }
  
//     function getOptionNo(no) {
//       for (var checkOption of noCheck) {
//         if(no == checkOption.optionNo) {
//           return checkOption;
//         }
//       }
//       return null;
//     }
    
//     var tempProductNo = $('.selected-products input[data-name="productNo"]');
//     var tempOptionNo = $('.selected-products input[data-name="optionNo"]');
    
//     $('#testBtn').on('click', (e) => {
//       for(var i=0; i<$('.myChkbox').length; i++){
//         var check = $('.myChkbox');
//         if($('.check-td  > input[type="checkbox"]').checked) {
//           var selectedProductNo = getProductNo(tempProductNo[i].value);
//           var selectedOptionNo = getOptionNo(tempOptionNo[i].value);
//           var selectedOptionNo = getProductNo(tempOptionNo[i].value);
//           $('#selected-product').append(cartTemplate(selectedProductNo));
//           console.log("상품번호 " + selectedProductNo);
//           console.log("옵션번호 " + selectedOptionNo);
//         }
        
//       }
//     })
  </script>
	<script>
      var myCheckBoxes = document.getElementsByClassName('myChkbox');
      
      for (var i = 0; i < myCheckBoxes.length; i++) {
        myCheckBoxes[i].addEventListener('change', function () {
          reprice()
        });
      }
    </script>

	<script>
      myCheckBoxes = document.getElementsByClassName('myChkbox');
      function check_all() {
        for (i = 0; i < myCheckBoxes.length; i++) {
          myCheckBoxes[i].checked = true;
          reprice()
        }
      }
      function uncheck_all() {
        for (i = 0; i < myCheckBoxes.length; i++) {
          myCheckBoxes[i].checked = false;
          reprice()
        }
      }
    </script>

	<script>
      function reprice() {
        // 중복코드 제거용
        var myCheckPrice = document.getElementsByName('chkprice');
        var myCheckQuantity = document.getElementsByName('quantity');
        var checkPrice = 0;
        for (j = 0; j < myCheckBoxes.length; j++) {
          if (myCheckBoxes[j].checked) {
            checkPrice += parseInt(myCheckPrice[j].value);
          }
        }
        sumCheckPrice.innerHTML = Number(checkPrice).toLocaleString('en'); // 상품합계
        shipCheckPrice.innerHTML = Number(checkPrice >= 50000 || checkPrice == 0 ? 0 : 2500).toLocaleString('en'); // 배송비
        totalCheckPrice.innerHTML = Number(checkPrice + parseInt(checkPrice >= 50000 || checkPrice == 0 ? 0 : 2500)).toLocaleString('en'); // 합계
      }
    </script>

	<script>
  // 상품 전체구매
//     function all_Order() {

//       $('#allOrderBtn').attr('type', 'submit');
//       $('#allOrderBtn').attr('formaction', '/app/order/cartorderform');
//       check_Order();
//     }
  </script>




	<script>
  // 선택 상품삭제
    function check_Del() {
      var chkbox = "";
      $("input[name='chkbox']:checked").each(function () {
        chkbox = chkbox + $(this).val() + ",";
      });
      chkbox = chkbox.substring(0, chkbox.lastIndexOf(",")); //맨끝 콤마 지우기
  
      if (chkbox == '') {
        alert("삭제할 상품을 선택하세요.");
        return false;
      }
      console.log("### chkbox => {}" + chkbox);
  
      if (confirm("삭제 하시겠습니까?")) {
  
        location.href = "chkdelete?chkbox=" + chkbox;
      }
    }
  </script>

	<script>
  // 선택 상품구매
    function check_Order() {
      var chkbox = "";
      $("input[name='chkbox']:checked").each(function () {
        chkbox = chkbox + $(this).val() + ",";
      });
      chkbox = chkbox.substring(0, chkbox.lastIndexOf(",")); //맨끝 콤마 지우기
  
      if (chkbox == '') {
        alert("구매할 상품을 선택하세요.");
        return false;
      }
      console.log("### chkbox => {}" + chkbox);
  
      if (confirm("구매 하시겠습니까?")) {
  
        // 상품구매 href?
        location.href = "chkoption?chkbox=" + chkbox;
      }
    }
  </script>


	<script>
    $('#test').on('click',(e) => {
      var data = {
        'no': [],
        'optionNo':[],
        'quantity': [],
        'redirect':'/app/order/cartorderform'
      }
      
      var checkBox = $('.myChkBox');
      var selectedProduct = $('.selected-product-productNo');
      for(var i=0;i<selectedProduct.length;i++){
        var selectedNo = $('.selected-product-productNo')[i];
        var selectedOptionNo = $('.selected-product-optionNo')[i];
        var selectedQuantity = $('.input-number')[i];
        data.no.push($(selectedNo).val());
        data.optionNo.push($(selectedOptionNo).val());
        data.quantity.push($(selectedQuantity).val());
      }
      
      $.ajax({
        url: '/app/order/cartorderform', 
        method: 'post',
        data: JSON.stringify(data), 
        dataType: 'json',
        contentType: 'application/json',
        complete: function(data) {
          window.location = '/app/order/cartorderform';
        }
      });
    });
  </script>

	<script>
    // 선택 상품금액
    function check_Price(){
      var myCheckBoxes = document.getElementsByClassName('myChkbox');
      for (var i = 0; i < myCheckBoxes.length; i++){
        if (myCheckBoxes[i].checked) {
          alert(parseInt(myCheckBoxes[i].value)); //
        }
      }
    }
  </script>

	<script>
    if($('#chkbox').checked) {
      $('#chkbox').val('true');
    } else {
      $('#chkbox').val()
    }
  </script>





</body>

</html>