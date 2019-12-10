<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
  <title>상품 상세</title>
  <link rel="stylesheet" href="/css/member/style-header.css">
  <link rel='stylesheet' href='/css/product/style.css'>
  <link rel='stylesheet' href='/css/member/style_footer.css'>
  <link rel='stylesheet' href='/css/member/style-header.css'>
  <link rel='stylesheet' href='/node_modules/bootstrap/dist/css/bootstrap.min.css'>
  <link rel="icon" href="img/core-img/favicon.ico">
  <link rel="stylesheet" href="/node_modules/blueimp-file-upload/css/jquery.fileupload.css">

  <style>
    #jumbotron.jumbotron-fluid {
      background-color: white;

    }

    #header {
      width: 1100px;
      margin: 0 auto;
    }

    #productBody {
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

  <jsp:include page="../header.jsp" />
<body>


  <div>
    <div id="productBody">
      <div class="row">
        <div class="col-md-7">
          <!-- Blog Thumbnail -->
          <div class="blog-thumbnail">
            <c:forEach items="${product.files}" var="file" end="0">
              <img src="/upload/product/${file.filePath}" style="width: 600px; height: 600px; object-fit: cover;">
            </c:forEach>
          </div>
        </div>
        <div class="col-md-5">
          <!-- Blog Content -->
          <div class="blog-content">
            <!-- <a class="post-tag">${product.category}</a> -->
            <a style="font-size: 30px;">${product.title}</a>
            <hr>

            <div class="row">
              <div class="col-md-4">
                <label for="exampleInput">상품금액</label>
              </div>
              <div class="col-md-8">
                <span style=" text-decoration:line-through">
                  <fmt:formatNumber value="${product.price}" pattern="#,###" /> 원</span>
              </div>
            </div>

            <div class="row">
              <div class="col-md-4">
                <label for="exampleInput">할인율</label>
              </div>
              <div class="col-md-8">
                <span>${product.discount} %</span>
              </div>
            </div>

            <div class="row">
              <div class="col-md-4">
                <label for="exampleInput">할인적용금액</label>
              </div>
              <div class="col-md-8">
                <span>
                  <span id='product-price'><fmt:formatNumber value="${product.price * (100 - product.discount) / 100}" pattern="#,###" /></span>
                  원</span>
              </div>
            </div>

            <hr>

            <div class="row">
              <div class="col-md-4">
                <label for="exampleInput">조회수</label>
              </div>
              <div class="col-md-8">
                <span>${product.viewCount} 회</span>
              </div>
            </div>

            <!-- <form action="../order/form" method="post"> -->
              <input type='hidden' name='no' value='${product.productNo}'>
              <div class="row">
                <div class="col-md-4">
                  <label for="exampleInput">옵션</label>
                </div>
                <div class="col-md-8">

                  <div class="form-group">
                    <select id="product-option" class="form-control optionselect" id="optionNo" name='optionNo'>
                      <option id="default-select" selected disabled>옵션을 선택해주세요.</option>

                      <c:forEach items="${product.options}" var="productOption">
                        <option value="${productOption.optionNo}" 
                          id="${productOption.title}">${productOption.title}
                          (+${productOption.price}원)
                        </option>
                      </c:forEach>
                    </select>
                  </div>
                </div>
                <div id="selected-option-div" class="block-content">
                  <!-- 상품옵션 들어가는 Div -->
                </div>
              </div>
              <hr>
              <div class="row">
                <div class="col-md-4">
                  <label for="exampleInput">주문금액</label>
                </div>
                <div class="col-md-8" style="text-align: right;">
                  <span id="total-check-price" style="color: red; margin: 10px; font-size: 20px;">0</span><span style="font-size: 20px;">원</span>
                </div>
              </div>
              <hr>
            <form id="order-form" method="post">
              <div id="order-option">
              <!-- 옵션정보 넣는 div -->
              </div>
              <input type="hidden" name="productNo" value="${product.productNo}">
              <button id="cart-btn" type="button" class="btn bueno-btn" style="margin-top:10px; width:215px;">장바구니</button>
              <button id="order-btn" type="button" class="btn bueno-btn" style="margin-top:10px; width:215px;">구매하기</button>
            </form>
          </div>
        </div>
      </div>

      <hr class="my-4">
      <span style="font-size: 30px;">${product.title}</span>
      <p class="lead">${product.detail}</p>
      <hr class="my-4">
      <p>
        <c:forEach items="${product.files}" var="file" begin="1">
          <img src="/upload/product/${file.filePath}" class="rounded mx-auto d-block" alt="...">
        </c:forEach>
      </p>
       <hr class="my-4">
       <jsp:include page="../productreview/list.jsp" /> 

      <hr class="my-4">
      <jsp:include page="../comment/productCommentList.jsp" />
    <br><br>
    <form action="updateform" method="post">
      <input type="hidden" name="no" value="${product.productNo}">
      <button id="update-product" class="btn btn-success" style="display:none;">수정</button>
    </form>
    </div>
  </div>

  <!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">댓글 수정</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <input type='hidden' class="modal-commentNo" name='commentNo' value='' >
        <label>제목</label>
        <input type="text" id="modal-comment-title" class="form-control modal-comment-title" name="title" value=""><hr>
        <label>내용</label>
        <textarea id="modal-comment-content" class="form-control modal-comment-content" name='content' rows='3' cols='55'></textarea><br>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary modal-closeBtn" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-danger modal-delBtn">Delete</button>
        <button type="button" class="btn btn-primary modal-saveBtn">Save</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal -->
<jsp:include page="../footer.jsp" />

<script src="/node_modules/handlebars/dist/handlebars.min.js"></script>
<script id="option-template" type="text/x-handlebars-template">
<div class='selected-option' data-index='' style='width: 440px; border-style: solid; border-color: rgba(0, 0, 0, 0.1); border-width: 1px; margin: 5px 15px; padding: 0px 15px 10px 15px;'>
  <div>
    <span class='closeIcon'>&times;</span>
  </div>
  <div style='padding: 10px 22px 10px 0;'>
    <input type='hidden' class='option-no' value="{{no}}">
    {{title}}
  </div>
  <input class='option-quantity' data-no='' type='number' style='text-align:center; width: 60px; vertical-align: top;' value='1' min='1' max='1000'>
  <input class='option-price' type='hidden' type='number' value="{{price}}">
  <span style='float: right; padding-top: 5px;' class=''><span class='option-price-sum'>{{price}}</span>원</span>
</div>
</script>

<script id="order-template" type="text/x-handlebars-template">
<div class='selected-order-option' data-index=''>
  <div><input type='hidden' class='order-no' name='optNo' value="{{no}}"></div>
  <div><input class='order-quantity' name='optQuantity' type='hidden' value='1'></div>
  <div><input class='order-price' name='optPrice' type='hidden' type='number' value="{{price}}"></div>
</div>
</script>

<script id="comment-template" type="text/x-handlebars-template">
<div class='append-comment-div'>
<ol>
  <li class="single_comment_area" id="isComment">
    <div class="comment-content d-flex">
      <div class="comment-author">
        <p><span id="memberName" style="font-size:14px;">{{nickname}}</span></p>
      </div>
      <div class="comment-meta">
        <div class="d-flex" style="height:60px";>
          <a class="update-title" style="font-weight:bold;">{{title}}&nbsp;&nbsp;</a>
          <a class="post-date">{{createdDate}}</a>
          &nbsp;<a style="" id="" class="reply-btn">수정</a>&nbsp;
          &nbsp;<a style="" class="comment-delete-btn">삭제</a>&nbsp;
        </div>
        <p class="update-content">{{content}}</p>
      </div>
    </div><hr style="width:1100px;">
  </li>
</ol>
</div>
</script>

<script>

  var dataNo = 0;
  var productPrice = parseInt(${product.price * (100 - product.discount) / 100});
  
  // 제품 옵션 데이터 준비
  var options = [];
<c:forEach items="${product.options}" var="productOption">
  options.push({'no': ${productOption.optionNo}, 'title': '${productOption.title}', 'price': productPrice + ${productOption.price}});
</c:forEach>
    
  function getOption(no) {
    for (var option of options) {
      if (no == option.no) {
        return option;
      }
    }
    return null;
  }
    
  var optionTemplate = Handlebars.compile($('#option-template').html());
  var orderTemplate = Handlebars.compile($('#order-template').html());
  calculatePrice();
  
  // 선택한 옵션 등록하기
  $('#product-option').change(function(e) {
    var selectedOption = getOption($(this).val());
    if ($('#selected-option-div .option-no[value=' + selectedOption.no +']').length > 0) {
      alert('이미 선택한 옵션입니다.');
      return;
    }
    $('#selected-option-div').append(optionTemplate(selectedOption));
    $('#order-option').append(orderTemplate(selectedOption));
    calculatePrice();
  })
  
  // 옵션 변경
  $('#selected-option-div').on('change', '.option-quantity', function (e) {
    var productPrice = parseInt(${product.price * (100 - product.discount) / 100});
    var optionQuantity = parseInt($(this).val());
    var optionPrice = parseInt($(this.parentNode).find('.option-price').val());
    $(this.parentNode).find('.option-price-sum').html(optionPrice * optionQuantity);
    $('.order-quantity').val(optionQuantity);
    var optQuantity = $('#selected-option-div .option-quantity');
    var optOrder = $('#order-option .order-quantity');
    for(var i=0; i<optQuantity.length; i++) {
      optOrder[i].value = optQuantity[i].value;
    }
    calculatePrice();
  });

  $('#selected-option-div').on('click', '.closeIcon', function (e) {
    var OrderOption = $('.selected-order-option');
    var delOption = $(this.parentNode.parentNode);
    
    var selectedOption = $('.selected-option');
    var selectedOrderOption = $('.selected-order-option');
    for(var i=0;i<$('.selected-option').length; i++) {
      selectedOption[i].setAttribute('data-index', i);
      selectedOrderOption[i].setAttribute('data-index', i);
      if($(this.parentNode.parentNode).attr('data-index') == selectedOrderOption[i].getAttribute('data-index')) {
        $(this.parentNode.parentNode).remove();
        selectedOrderOption[i].remove();
      }
    }
    calculatePrice();
  });
  
  // 주문 가격 재계산
  function calculatePrice() {
    var optionPrices = $('#selected-option-div .option-price-sum');
    var checkPrice = 0;
    for (i = 0; i < optionPrices.length; i++) {
      checkPrice += parseInt(optionPrices[i].innerText);
    }
    $('#total-check-price').html(Number(checkPrice).toLocaleString('en'));
  }
  
  // 장바구니 담기
  $('#cart-btn').click(function(e) {
    
    if(loginCheck == '') {
      if(!confirm('로그인이 필요합니다. 로그인하시겠습니까?')) {
        return false;
      } else {
        location.href = '/app/auth/signin';
      }

    } else {
      if (!confirm("장바구니에 담겠습니까?"))
        return;
      
      var data = {
        'no': ${product.productNo},
        'options': []
      };
      
      var selectedOptions = $('#selected-option-div .selected-option');
      for (var i = 0; i < selectedOptions.length; i++) {
        var selectedOption = selectedOptions[i];
        data['options'].push({
          'no': $(selectedOption).find('.option-no').val(),
          'quantity': $(selectedOption).find('.option-quantity').val()
        });
      }
      
      console.log(data);
      $.ajax({
        url: '/app/cart/add', 
        method: 'post',
        data: JSON.stringify(data), 
        dataType: 'json',
        contentType: 'application/json',
        success: function(response) {
          alert("장바구니에 상품을 담았습니다.");
        },
        error: function(response) {
          alert('해당 상품이 장바구니에 있습니다.');
        }
      });
    }
  });
  
  var loginCheck = '${loginUser.memberNo}';

  //주문 할 때 로그인 체크
  $('#order-btn').on('click', (e) => {
    if(loginCheck == '') {
      if(!confirm('로그인이 필요합니다. 로그인하시겠습니까?')) {
        return false;
      } else {
        location.href = '/app/auth/signin';
      }
    } else {
      alert('주문하시겠습니까?');
      $('#order-btn').attr('type', 'submit');
      $('#order-btn').attr('formaction', '/app/order/form');
    }
  })
  
  
  // 자기 댓글만 수정 삭제
  var commentNo = $('.comment-no');
  $(document).on('click', '.reply-btn', function(e) {
    console.log($(this.parentNode).find('span[class="comment-no"]').text());
    $('#exampleModal').modal('show');
    $('.modal-commentNo').val($(this.parentNode).find('a[class="comment-no"]').text());
  })
  
  $('#exampleModal').on('show.bs.modal', function () {
    $('#modal-comment-title').val('');
    $('#modal-comment-content').val('');
  })
  
  var memberGrade = ${loginUser.grade};
  var commentMember = $('.member-no');
  var updateButton = $('.reply-btn');
  var deleteButton = $('.comment-delete-btn');
  for(var i=0; i<commentMember.length; i++) {
    console.log("updateButton " + updateButton[i]);
    if(commentMember[i].innerText == loginCheck || memberGrade == 0) {
      $(updateButton[i]).attr("style", 'display:inline; height:30px;');
      $(deleteButton[i]).attr("style", 'display:inline; height:30px;');
    }
  }

  
  // 댓글 입력
  var commentTemplate = Handlebars.compile($('#comment-template').html());

  $('#comment-submit').on('click', function (e) {
    var submitComment = {
      'productNo':$('#productNo').val(),
      'memberNo':$('#memberNo').val(),
      'title':$('#title').val(),
      'content':$('#message').val()
    }
  
    var commentTitle=submitComment.title;
    var commentContent=submitComment.content;
    var commentAppend = $('#append-comment');

    $.ajax({
      url:'/app/comment/add',
      method:'post',
      data:JSON.stringify(submitComment),
      dataType:'json',
      contentType:'application/json',
      success: function (result, data) {
        console.log(result);
        console.log(data);
        var commentJson = {
          'commentNo': 1,
          'nickname': '${loginUser.nickname}',
          'title': $('#title').val(),
          'createdDate': '2019-11-20',
          'content': $('#message').val()
        };
        console.log(commentJson);
        $('#fuck').append(commentTemplate(commentJson));
        $('#title').val("");
        $('#message').val("");
      }
    })
  });
  
  
  // 댓글 수정
  $(document).on('click', '.modal-saveBtn', function(e) {
    var commentData = 
    {
      'commentNo':$('.modal-commentNo').val(), 
      'title':$('#modal-comment-title').val(),
      'content':$('#modal-comment-content').val()
    };
    
    $.ajax({
      url:'/app/comment/update',
      method:'post',
      data: JSON.stringify(commentData),
      dataType: 'json',
      contentType: 'application/json',
      success: function(result) {
        var updateCommentNo = $('.comment-no');
        var updateTitle = $('.update-title');
        var updateContent = $('.update-content');
        console.log(updateCommentNo);
        console.log(updateTitle);
        console.log(updateContent);
        for(var i=0; i<updateCommentNo.length; i++) {
          if(updateCommentNo[i].innerText == commentData.commentNo) {
            console.log('if')
            updateTitle[i].innerText = commentData.title;
            updateContent[i].innerText = commentData.content;
          }
        }
        $('#exampleModal').modal('hide');
      }
    })
  });
  
  // 댓글 삭제
  $(document).on('click', '.comment-delete-btn', function (e) {
    if(confirm('삭제하시겠습니까?')) {
      var commentDiv = $(this.parentNode.parentNode.parentNode.parentNode);
      var commentNo = $(this.parentNode).find('a[class="comment-no"]').text();
      console.log(commentDiv);
      $.ajax({
        url:'/app/comment/commentDelete',
        method: 'post',
        data: {commentNo: commentNo, productNo: ${product.productNo}},
        success: function(result) {
          console.log('댓글 삭제');
          $(commentDiv).remove();
        }
      });
    };
  });
  
  // 관리자 기능
  var adminCheck = ${loginUser.grade};
  var commentAnswer = $('.comment-answer-btn');
//   var answerBtn = $('.comment-answer-btn');
  if(adminCheck == 0) {
    console.log("들어오지마");
    console.log(adminCheck);
    $('#update-product').attr('style', 'display:inline');
    for(var i=0; i<commentAnswer.length;i++){
      commentAnswer[i].setAttribute('style', 'display:inline; height:30px;')
//       answerBtn[i].style.display="inline";
    }
  }
  
  // 문의 답변(관리자)
  $(document).on('click', '.comment-answer-btn', function(e){
    var answerForm = $(this.parentNode.parentNode).find('textarea');
    var updateBtn = $(this.parentNode.parentNode).find('.reply-btn');
    var deleteBtn = $(this.parentNode.parentNode).find('.comment-delete-btnn');
    var answerBtn = $(this.parentNode.parentNode).find('.comment-answer-btn');
    var answerAddBtn = $(this.parentNode.parentNode).find('#answer-submit');
    var answerLabel = $(this.parentNode.parentNode).find('label');
    $(answerForm).attr('style', 'width:900px; height:300px; display:inline;');
    $(answerLabel).attr('style', 'display:inline; height:30px;');
    $(answerAddBtn).attr('style', 'display:inline; margin-bottom:30px; margin-left:10px;');
  })
  
  $(document).on('click', '#answer-submit', function(e) {
    var answerForm = $(this.parentNode).find('textarea');
    var commentNo = $(this.parentNode).find('.d-flex').find('.comment-no');
    var answer = $(this.parentNode).find('#answer-submit');
    console.log($(answer).attr('style'));
    $.ajax({
      url: '/app/comment/insertanswer',
      method: 'post',
      data: {commentNo : $(commentNo).text(), answer: $(answerForm).val()},
      success: function(result) {
        $(answerForm).val('');
        console.log($(answerForm));
        $(answerForm).attr('style', 'display:none;');
        $(answer).attr('style', 'display:none');
      }
    })
  })
  
  
  // 문의 내용 보기
  $(document).on('click', '.update-title', function(e) {
    if($(this.parentNode.parentNode).find('.update-content').attr('style') == 'display:none') {
      $(this.parentNode.parentNode).find('p').attr('style', 'display:inline');
      $(this.parentNode.parentNode).find('.content-answer-line').attr('style', 'display:block; width:950px;');
      $(this.parentNode.parentNode).find('.answer-label').attr('style', 'display:inline');
    } else {
      $(this.parentNode.parentNode).find('p').attr('style', 'display:none');
      $(this.parentNode.parentNode).find('.content-answer-line').attr('style', 'display:none');
    }
  })
  </script>
</body>
</html>


































