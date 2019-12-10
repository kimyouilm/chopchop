<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html>
<head>
  <title>상품 등록폼</title>
  <link rel='stylesheet' href='/node_modules/bootstrap/dist/css/bootstrap.min.css'>
  <link rel='stylesheet' href='/node_modules/jquery/dist/jquery.min.js'>
  
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
<body>
  <jsp:include page="../header.jsp"/>
  <div id='content'>
    <form action='update' method='post' enctype='multipart/form-data'>
    <h1>이벤트 수정</h1>
      <div>
        <label for="exampleInput">타이틀*</label>
        <input type='text' name='title' class="form-control"><br>
      </div>
      <div>
        <label for="exampleInput">진행상태*</label>
        <input type='text' name='content'' class="form-control"><br>
      </div>
 
        <div class="row">
        <div class="col-md-6">
          <label for="exampleInput">시작일*</label>
          <input type="text" name="startDate" class="form-control" placeholder="yyyymmdd 형식으로 입력하세요. (예:20191124)">
        </div>
        <div class="col-md-6">
          <label for="exampleInput">종료일</label>
          <input type="text" name="endDate" class="form-control" placeholder="yyyymmdd 형식으로 입력하세요. (예:20191124)">
        </div>
        </div>

      <div>
        <label for="exampleInput">타이틀 사진</label><br>
        <input type='file' name='filePath' id="front-image"><br>
        <img id="image_section" src="#" alt="" width="400px;" style="display:none;"/>
      </div>
      <label for="exampleInput">내용 사진</label><br>
      <input type='file' class='add-photo-file' name='filePath'><br>
      <img class="add-image-section" src="#" alt="" width="400px;" style="display:none;"/>
      <hr class="my-4">
      <div style="text-align: center;">
          <button class="btn btn-secondary">취소</button>
          <button type="submit"" id="add-button" class="btn btn-danger" formaction="delete">삭제</button>
          <button type="submit"" id="add-button" class="btn btn-success">수정</button>
        </div>
      </div>
      <input type="hidden" name="eventNo" value="${event.eventNo}">
    </form>
  </div>
  <jsp:include page="../footer.jsp"/>
  <script src="../node_modules/blueimp-file-upload/js/vendor/jquery.ui.widget.js"></script>
  <script src="../node_modules/blueimp-file-upload/js/jquery.iframe-transport.js"></script>
  <script src="../node_modules/blueimp-file-upload/js/jquery.fileupload.js"></script>
  <script src="/node_modules/handlebars/dist/handlebars.min.js"></script>

  <script>
    
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



























