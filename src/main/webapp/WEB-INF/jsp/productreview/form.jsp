<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>

<head>
  <title>상품후기등록</title>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
  <link rel='stylesheet' href='/css/common/bootstrap.min.css'>
  <link rel="stylesheet" href="/node_modules/blueimp-file-upload/css/jquery.fileupload.css">
  
</head>

<body onload="formLoad()">

  <div id='productReview' class='border' style='width: 500px; margin: auto;'>
    <form action='add' enctype='multipart/form-data' method='post'>
      <input type='hidden' name='productNo' id='productNo' value='1'><br>
      <div>
        <div>
          <input type="text" class="form-control" name="content">
        </div>
      </div>

      <select class="custom-select" name='rating'>
        <option value="1">★☆☆☆☆</option>
        <option value="2">★★☆☆☆</option>
        <option value="3">★★★☆☆</option>
        <option value="4">★★★★☆</option>
        <option selected value="5">★★★★★</option>
      </select>

      <div>
        <input type="hidden" id="photo" value="${productReview.filePath}" />
        <img id="imgThumb" class="imgThumb" style="width: 200px; height: 200px; object-fit: cover">
      </div>
      <input type='file' id='fileupload' name='file' /><br>

      <div class="form-group row">
        <div class="col-sm-10">
          <button type="submit" class="btn btn-primary">등록하기</button>
        </div>
      </div>
    </form>
  </div>

  <script>

    function formLoad() {
      // hidden값을 이용해서 자바스크립트를 이용한 경우
      if (document.getElementById("photo").value == null
        || document.getElementById("photo").value == "") {
        document.getElementById("imgThumb").src = "/upload/productreview/info_photo.jpg";
      } else {
        document.getElementById("imgThumb").src = "/upload/productreview/"
          + document.getElementById("photo").value;
      }
    }

    document.getElementById("fileupload").onchange = function () {
      var reader = new FileReader();
      reader.onload = function (e) {
        document.getElementById("imgThumb").src = e.target.result;
      };
      reader.readAsDataURL(this.files[0]);
    };
  </script>
</body>

</html>