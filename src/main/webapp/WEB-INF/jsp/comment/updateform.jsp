<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<html>
<head>
  <title>문의 수정폼</title>
  <link rel='stylesheet' href='/css/product/style.css'>
  <link rel='stylesheet' href='/css/member/style_footer.css'>
  <link rel='stylesheet' href='/css/member/style-header.css'>
  <link rel="icon" href="img/core-img/favicon.ico">
</head>
<body>

  <div class="post-a-comment-area mb-30 clearfix">
    <h4 class="mb-50">Update a reply</h4>

    <!-- Reply Form -->
    <div class="contact-form-area">
      <form action="update" method="post">
        <div class="row">
          <input type='hidden' name='commentNo' id='commentNo' value='' readonly>
          <input type='hidden' name='memberNo' value=1 readonly>
          <input type='hidden' name='productNo' value='${comment.productNo}' readonly>
          <div class="col-12 col-lg-6">
            <input type="text" name='title' class="form-control" id="title" placeholder="title" value='${comment.title}'>
          </div>
          <div class="col-12">
            <textarea name='content' class="form-control" id="message"
              cols="30" rows="10" placeholder="Message">${comment.content}</textarea>
          </div>
          <div class="col-12">
            <button class="btn bueno-btn mt-30" type="submit">Update Comment</button>
          </div>
        </div>
      </form>
      <form action='../comment/commentDelete'>
        <input type='hidden' name='no' value='${comment.commentNo}'>
        <input type='hidden' name='productNo' value='${comment.productNo}'>
        <button class="btn bueno-btn mt-30" type="submit">Delete Comment</button>
      </form>
    </div>
  </div>


  <script>
    function getParameterByName(name, url) {
      if (!url) url = window.location.href;
      name = name.replace(/[\[\]]/g, "\\$&");
      var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
          results = regex.exec(url);
      return results[2];
    }
  
    var productNo = getParameterByName('no');
    document.getElementById('commentNo').value=productNo;
  </script>
</body>
</html>