<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>ChopChop-MyPage</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/member/myProfile.css">

<!-- mypage_sidebar start-->
<!-- Font Awesome -->
<link rel="stylesheet"
	href="/js/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- </head> -->
<!-- mypage_sidebar  end -->
</head>
<jsp:include page="../header.jsp" />
<%-- <jsp:include page="../member/mypage_sidebar.jsp" /> --%>
<body class="hold-transition sidebar-mini layout-fixed">
<!-- 	<div class="wrapper"> -->
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper" style="width: 1100px;margin: 0 auto;height: 700px; min-height: 700px;">
      <div class="d-flex justify-content-between align-items-center py-0 mb-3 mInfo">
        <h3>My profile</h3>
         <span class="mInfo-span">
         <a href="/app/member/myprofile" class="mypage-tagA">My Page</a>&nbsp>&nbspMy Profile</span> 
      </div>
      
			<figure class="snip1559" style="margin-left: 25%;">
      <a href="detail?no=${member.memberNo}">
				<div class="profile-image">
					<input type="hidden" id="photo2" value="${member.photo}" /> <img
						src='/upload/member/${member.photo}' id="imgThumb"
						class="my-thumb profile-img">
				</div>
				<figcaption>
					<h4 class="myprofile-h4 mypage-tagA" >${member.nickname}</h4>
				</figcaption>
        </a>
			</figure>

			<jsp:include page="../member/mypage_sidebar.jsp" />
		</div>
<!-- 	</div> -->
	<!-- ./wrapper -->

	<!--  mypage_sidebar script  start -->
	<!-- jQuery -->
	<script src="/node_modules/jquery/dist/jquery.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="/node_modules/jquery-ui-dist/jquery-ui.min.js"></script>
	<!-- AdminLTE App -->
	<script src="/js/dist/adminlte.js"></script>

	<script>
		function formLoad() {
			// hidden값을 이용해서 자바스크립트를 이용한 경우
			if ($("#userphoto").val() == null || $("#userphoto").val() == "") {
				$("#userThumb").attr("src", "/upload/member/info_photo.jpg");
			} else {
				$("#userThumb").attr("src",
						"/upload/member/" + $("#userphoto").val());
			}
		}
	</script>
	<script>
		/* Demo purposes only */
		$(".hover").mouseleave(function() {
			$(this).removeClass("hover");
		});
	</script>

	<script>
		function sidebar_form() {
			// hidden값을 이용해서 자바스크립트를 이용한 경우
			if ($("#userphoto").val() == null || $("#userphoto").val() == "") {
				$("#userThumb").attr("src", "/upload/member/info_photo.jpg");
			} else {
				$("#userThumb").attr("src",
						"/upload/member/" + $("#userphoto").val());
			}
		}
	</script>

	<!--  mypage_sidebar script  end -->
</body>
<jsp:include page="../footer.jsp" />
</html>