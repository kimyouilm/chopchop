<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update My Pet's Information</title>
<link rel="stylesheet" href="/css/pet/form.css">
<link rel="stylesheet" href="/css/pet/input.css">
<style>
.update-form {
	position: relative;
	left: 25% !important;
	width: 800px;
}
</style>
</head>
<h1>Update My Pet</h1>
<hr>
<div class="content-wrapper" style="width: 1100px; margin: 0 auto;">
	<div class="update-form">
		<div class="col-md-6 col-md-offset-3">
			<div class="form-area">
				<form action='/app/pet/update' method='post'
					enctype='multipart/form-data' name="addform">
					<!-- <label for="filePath">대표사진</label> <input type="file" id="file"
            name="file" /><br>  -->

					<input type='hidden' id='petNo' name='petNo' value='${pet.petNo}'
						readonly>
					<section class="photobtn">
						<img src="/upload/pet/${pet.filePath}" id="img"> <a
							id="addphoto" href="" class="btn">+ Add</a> <a id="removephoto"
							href="" class="btn">- Remove</a>
					</section>

					<input type="file" name="file" id="file"
						accept="image/*;capture=camera" />
					<div id="photo_chk" class="vali_check"></div>

					<div class="group form-group">
						<input type="text" class="form-contro" id="registerNo"
							name="registerNo" value="${pet.registerNo}" required> <span
							class="highlight"></span> <span class="bar"></span> <label
							class="mylabel">Register Number</label>
					</div>

					<div class="group form-group">
						<input type="text" class="form-contro" id="name" name="name"
							onblur="name_check();" value="${pet.name}" required> <span
							class="highlight"></span> <span class="bar"></span> <label
							class="mylabel">Pet's Name</label>
						<div id="name_chk" class="vali_check"></div>
					</div>

					<div class="group form-group">
						<input type="text" class="form-contro" id="age" name="age"
							value="${pet.age}" required> <span class="highlight"></span>
						<span class="bar"></span> <label class="mylabel">Pet's Age</label>
						<div id="age_chk" class="vali_check"></div>
					</div>

					<div class="group form-group">
						<input type="text" class="form-contro" id="Breed" name="Breed"
							value="${pet.breed}" required> <span class="highlight"></span>
						<span class="bar"></span> <label class="mylabel">Breed</label>
					</div>

					<div class="radio-box">

						<c:if test="${pet.gender eq 0}">
							<input id="male" type="radio" name="gender" value=0
								checked="checked" />
							<label for="male">Male</label>
							<input id="female" type="radio" name="gender" value=1 />
							<label for="female">Female</label>
						</c:if>

						<c:if test="${pet.gender eq 1}">
							<input id="male" type="radio" name="gender" value=0
								checked="checked" />
							<label for="male">Male</label>
							<input id="female" type="radio" name="gender" value=1
								checked="checked" />
							<label for="female">Female</label>
						</c:if>

					</div>


					<%-- 
					 						<input id="male" type="radio" name="gender" value="0"/> 
						<label for="male">Male</label>
						<c:if test="${pet.gender eq 0}">
						</c:if>
						<input id="female" type="radio" name="gender" value="1"/> <label
							for="female">Female</label>
						<c:if test="${pet.gender eq 1}">
						</c:if>  --%>

					<hr>
					<button class="sub-btn" type="submit">Update</button>
					<button class="sub-btn" style="margin-top: -10px;"
						onclick="window.history.go(-1);">Back</button>
				</form>
			</div>
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
	document.querySelector('#addphoto').addEventListener('click', function(e) {
		performClick(document.getElementById('file'));
		e.preventDefault();
	});

	function performClick(node) {
		var evt = document.createEvent("MouseEvents");
		evt.initEvent("click", true, false);
		node.dispatchEvent(evt);
	}
</script>
</body>

<jsp:include page="../footer.jsp" />
</html>