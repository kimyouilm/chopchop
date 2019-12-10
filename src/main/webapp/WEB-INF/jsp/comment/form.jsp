<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
  <title>문의 등록폼</title>
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
  <link rel='stylesheet' href='/css/common.css'>
  <link rel="stylesheet" href="/css/style.css">
</head>
<body>
  <div id='content'>
    <h1>문의 등록폼</h1>
    <form action='add' method='post'>
      <input type='hidden' name='productNo' id='productNo' value=''><br>
      제목: <input type='text' name='title'/><br>
      내용: <input type='text' name='content'/><br>
      <input type='hidden' name='memberNo' value=1 readonly><br>
      <button>등록</button>
    </form>
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
    document.getElementById('productNo').value=productNo;
  </script>
</body>
</html>