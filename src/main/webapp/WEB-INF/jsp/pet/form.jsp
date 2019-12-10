<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Register My Pet</title>
<link rel="stylesheet" href="/css/pet/form.css">
<link rel="stylesheet" href="/css/pet/input.css">

<style>
.add-form {
	position: relative;
	left: 38% !important;
	width: 800px;
}
</style>
</head>
<body>
	<h1>Register My Pet</h1>
	<hr>
	<div class="add-form">
		<div class="col-md-6 col-md-offset-3">
			<div class="form-area">
				<form action='add' method='post' enctype='multipart/form-data'
					name="addform" onsubmit="return checkAll();">
					<!-- <label for="filePath">대표사진</label> <input type="file" id="file"
						name="file" /><br>  -->

					<section class="photobtn">
						<img
							src="http://www.randomlengthsnews.com/wp-content/themes/gonzo/images/no-image-blog-one.png"
							id="img"> <a id="addphoto" href="" class="btn">+ Add</a> <a
							id="removephoto" href="" class="btn">- Remove</a>
					</section>

					<input type="file" name="file" id="file"
						accept="image/*;capture=camera" />
					<div id="photo_chk" class="vali_check"></div>

					<input type="hidden" id="memberNo" name="memberNo"
						value="${memberNo}" readonly /><br>

					<div class="group form-group">
						<input type="text" class="form-contro" id="registerNo"
							name="registerNo" onblur="registerNo_check();" required>
						<span class="highlight"></span> <span class="bar"></span> <label
							class="mylabel">Register Number</label>
					</div>

					<div class="group form-group">
						<input type="text" class="form-contro" id="name" name="name"
							onblur="name_check();" required> <span class="highlight"></span>
						<span class="bar"></span> <label class="mylabel">Pet's
							Name</label>
						<div id="name_chk" class="vali_check"></div>
					</div>

					<div class="group form-group">
						<input type="text" class="form-contro" id="age" name="age"
							onblur="age_check();" required> <span class="highlight"></span>
						<span class="bar"></span> <label class="mylabel">Pet's Age</label>
						<div id="age_chk" class="vali_check"></div>
					</div>

					<div class="group form-group">
						<input type="text" class="form-contro" id="Breed" name="Breed"
							onblur="breed_check();" required> <span class="highlight"></span>
						<span class="bar"></span> <label class="mylabel">Breed</label>
					</div>

					<div class="radio-box">
						<input id="male" type="radio" name="gender" value="0"
							checked="checked" /> <label for="male">Male</label> <input
							id="female" type="radio" name="gender" value="1" /> <label
							for="female">Female</label>
					</div>
					<hr>
					<button class="sub-btn" type="submit">Register</button>
					<button class="sub-btn" style="margin-top: -10px;"
            onclick="window.history.go(-1);">Back</button>
				</form>
			</div>
		</div>
	</div>

	<script>
		/* upload img script */
		var img = document.getElementById('img');
		var noimage = img.src;

		function handleFileSelect(evt) {
			var file = evt.target.files[0]; // FileList object, files[0] is your file
			console.log(file);
			img.src = window.URL.createObjectURL(file);
		}

		document.getElementById('file').addEventListener('change',
				handleFileSelect, false);

		document.querySelector('#removephoto').addEventListener('click',
				function(e) {
					document.getElementById('file').value = "";
					img.src = noimage;
					e.preventDefault();
				});
		document.querySelector('#img').addEventListener('click', function(e) {
			performClick(document.getElementById('file'));
			e.preventDefault();
		});
		document.querySelector('#addphoto').addEventListener('click',
				function(e) {
					performClick(document.getElementById('file'));
					e.preventDefault();
				});

		function performClick(node) {
			var evt = document.createEvent("MouseEvents");
			evt.initEvent("click", true, false);
			node.dispatchEvent(evt);
		}

		/* check required */
		/*     function photo_check() {
		  console.log("photo_check");
		  if (addform.name.value == "") { // 빈 값 검사
		    document.getElementById("photo_chk").innerHTML = "required";
		    $("#photo_chk").css('color', 'red');
		  } else {
		    document.getElementById("photo_chk").innerHTML = "";
		  }
		}
		
		function name_check() {
		  var eCheckFlag = false;
		  console.log("name_check");
		  if (addform.name.value == "") { // 빈 값 검사
		    document.getElementById("name_chk").innerHTML = "required";
		    $("#name_chk").css('color', 'red');
		  } else {
		    document.getElementById("name_chk").innerHTML = "";
		    eCheckFlag = true;
		  }
		  return eCheckFlag;
		}

		function age_check() {
		  var pCheckFlag = false;
		  console.log("age_check");
		  if (addform.age.value == "") {
		    document.getElementById("age_chk").innerHTML = "required.";
		    $("#age_chk").css('color', 'red');
		  } else {
		    document.getElementById("age_chk").innerHTML = "";
		    pCheckFlag = true;
		  }

		  return pCheckFlag;
		}
		 */
		/* requied */
		/*         
		 function checkAll() {
		 var checkCnt = 0;
		 if (name_check()) {
		 checkCnt++;
		 }
		 if (age_check()) {
		 checkCnt++;
		 }

		 return checkCnt == 2 ? true : false;
		 } */
	</script>
</body>
<jsp:include page="../footer.jsp" />
</html>