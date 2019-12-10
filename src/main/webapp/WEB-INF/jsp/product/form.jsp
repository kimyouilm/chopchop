<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html>
<head>
  <title>상품 등록폼</title>
  <link rel='stylesheet' href='/css/product/style.css'>
  <link rel='stylesheet' href='/css/member/style_footer.css'>
  <link rel='stylesheet' href='/css/member/style-header.css'>
  <link rel='stylesheet' href='/node_modules/bootstrap/dist/css/bootstrap.min.css'>
  <link rel='stylesheet' href='/node_modules/jquery/dist/jquery.min.js'>
  <link rel="icon" href="img/core-img/favicon.ico">
  
  <style>
  
    #content {
      width: 1100px;
      padding-top: 10px;
      margin: auto auto;
    }
    
    #content form {
      padding: 25px;
      border :1px solid #b0c364;
      background-color: #edebeb;
    }
    
    div .row {
      margin-bottom:10px;
    }
    
    .closeIcon {
      float: right;
      /* display: inline-block; */
      font-weight: 500;
      text-shadow: 0 1px 0 #fff;
      font-size: 25px;
      color:red;
      /* vertical-align: top; */
    }

    .closeIcon:hover {
      border: 0;
      cursor: pointer;
      opacity: .75;
    }
    
    label, div label, .col-md-6 {
      font-size:18px;
      font-weight:bold;
    }
    
  </style>
  
</head>
  <jsp:include page="../header.jsp"/>
<body>
  <div id='content'>
    <form action='add' method='post' enctype='multipart/form-data'>
    <h1>상품 등록</h1>
      <div>
        <label for="exampleInput">상품명*</label>
        <input type='text' name='title' class="form-control" required><br>
      </div>
      <div>
        <label for="exampleInput">가격*</label>
        <input type='text' name='price' class="form-control" required><br>
      </div>
      <div>
        <label for="exampleInput">상품상세*</label>
        <textarea name='detail' class="form-control" required></textarea><br>
      </div>
      <div>
        <label for="exampleInput">재고*</label>
        <input type='text' name='stock' class="form-control" required><br>
      </div>
      <div>
        <label for="exampleInput">할인율*</label>
        <input type='text' name='discount' class="form-control" required><br>
      </div>
      <div id="option-add-form">
        <div class="row">
        <div class="col-md-6">
          <label for="exampleInput">옵션명</label>
          <input type="text" name="optionTitle" class="form-control" placeholder="입력하지 않으면 상품 제목이 입력됩니다.">
        </div>
        <div class="col-md-6">
          <label for="exampleInput">옵션가격</label>
          <input type="text" name="optionPrice" class="form-control" placeholder="입력하지 않으면 0원이 입력됩니다.">
        </div>
        </div>
      </div>
        <button type="button" id="addOption" class="btn btn-success" style="margin-bottom: 10px;">옵션추가</button>
      <div class="row">
      <div class="col-md-6">
        <label>동물분류</label> 
        <select name='species' class="form-control optionselect">
          <option id='1' value='dog'>강아지</option>
          <option id='2' value='cat'>고양이</option>
          <option id='3' value='others'>작은 친구들</option>
        </select><br>
      </div>
      <div class="col-md-6">
        <label>상품분류</label> 
        <select name='category' class="form-control optionselect">
          <option id='category1' value='food'>식품</option>
          <option id='category2' value='train'>훈련/장난감</option>
          <option id='category3' value='home'>식기/집/이동장</option>
          <option id='category4' value='sanitary'>목욕/미용/위생</option>
        </select><br>
      </div>
      </div>
      <div>
        <label for="exampleInput">대표 사진</label><br>
        <i class="glyphicon glyphicon-plus"></i><span>사진 선택</span>
        <input type='file' name='filePath' id="front-image" required><br>
        <img id="image_section" src="#" alt="" width="400px;" style="display:none;"/>
      </div>
      <div id="photo-add-form">
      <!-- 사진 추가되는 div -->
      </div>
      <div>
        <button type="button" id="addPhoto" class="btn btn-success" style="margin-top:10px;">사진추가</button><hr style="margin:30px auto;">
      </div>
      <div style="margin-top:10px; padding:0px 0px 0px 723px;">
        <button type="button" id="add-button" class="btn bueno-btn">등록</button>
        <button class="btn bueno-btn">취소</button>
      </div>
    </form>
  </div>
  <jsp:include page="../footer.jsp"/>
  <script src="../node_modules/blueimp-file-upload/js/vendor/jquery.ui.widget.js"></script>
  <script src="../node_modules/blueimp-file-upload/js/jquery.iframe-transport.js"></script>
  <script src="../node_modules/blueimp-file-upload/js/jquery.fileupload.js"></script>
  <script src="/node_modules/handlebars/dist/handlebars.min.js"></script>

  <script id="option-form-template" type="text/x-handlebars-template">
    <div>
      <div class="row">
        <div class="col-md-6">
          <label for="exampleInput">옵션명</label>
          <input type="text" name="optionTitle" class="form-control">
        </div>
        <div class="col-md-6">
          <label for="exampleInput">옵션가격</label>
          <input style="display:inline; location:absolute;" type="text" name="optionPrice" class="form-control">
          <span style="float:right;" id="deleteOption" class="closeIcon">&times;</span>
        </div>
      </div>
    </div>
  </script>
  
  <script id="photo-form-template" type="text/x-handlebars-template">
    <div>
      <label for="exampleInput">상품 사진</label><br>
      <input type='file' class='add-photo-file' name='filePath'>
      <img class="add-image-section" src="#" alt="" width="400px;" style="display:none;"/>
      <button type="button" id="deletePhoto" class="btn btn-danger">&times;</button>
    <div>
  </script>
  
  <script>
    var optionAddTemplate = Handlebars.compile($('#option-form-template').html());
    var photoAddTemplate = Handlebars.compile($('#photo-form-template').html());
    
    $('#addOption').on('click', (e) => {
      $('#option-add-form').append(optionAddTemplate);
    })
    
    $('#addPhoto').on('click', (e) => {
      $('#photo-add-form').append(photoAddTemplate);
    })
    
    $('#option-add-form').on('click', '#deleteOption', function(e) {
      $(this.parentNode.parentNode).remove();
    })

    $('#photo-add-form').on('click', '#deletePhoto', function(e) {
      $(this.parentNode).remove();
    })
    
    
    $('#add-button').on('click', () => {
      if($('.col-md-6 input[name="optionTitle"]').val().length == 0) {
        $('.col-md-6 input[name="optionTitle"]').val($('input[name="title"]').val());
      }
      
      if($('.col-md-6 input[name="optionPrice"]').val().length == 0) {
        $('.col-md-6 input[name="optionPrice"]').val(0);
      }
      
      
      console.log($('#add-button'));
      
//       if(!confirm('상품을 등록하시겠습니까?')) {
//         return;
//       }
      
      $('#add-button').attr('type', 'submit');
      $('#add-button').attr('formaction', 'add');
    })
    
    var addPhotoFile = $('.add-photo-file');
    var addImageSection = $('.add-image-section');
    function readURL(input) {
      if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
          $('#image_section').attr('style', 'block');
          $('#image_section').attr('src', e.target.result);  
        }
        reader.readAsDataURL(input.files[0]);
      }
    }
    
    function readURL2(input) {
      var reader2 = new FileReader();
      reader2.onload = function(e) {
        $(input.parentNode).find('.add-image-section').attr('style', 'block');
        $(input.parentNode).find('.add-image-section').attr('src', e.target.result);
        console.log($(input.parentNode).find('.add-image-section').attr('src', e.target.result));
      }
      reader2.readAsDataURL(input.files[0]);
    };
    
    $('#front-image').change(function(){
      readURL(this);
    });

    $(document).on('change', '.add-photo-file', function() {
      readURL2(this);
    });
    
  </script>
</body>
</html>



























