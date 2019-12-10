<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<style>
.find-password-page {
	width: 550px;
	text-align: center;
	overflow-x: hidden;
	margin: 11% auto;
	vertical-align: middle;
}

.find-password-header {
	text-align: left;
	margin: 60px 75px 0 75px;
	padding-bottom: 10px;
	font-size: 16pt;
	border-bottom: 3px solid #b0c364;
}

.find-password-content {
	margin: 30px 0 20px 85px;
	text-align: left;
}

.find-password-div {
	margin-bottom: 15px;
}

.find-password-div span {
	font-size: 14pt;
	color: #b0c364;
}

.find-password-content input[type=text] {
	width: 380px;
	margin-top: 5px;
	margin-bottom: 5px;
	font-size: 14pt;
	padding-left: 10px;
	color: #b0c364;
}

.find-password-button {
	padding-bottom: 50px;
}

.find-password-button button {
	height: 33px;
	background-color: #b0c364;
	border: none;
	color: white;
	padding-left: 15px;
	padding-right: 15px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	cursor: pointer;
}

.emailBox {
	width: 360px;
	height: 28px;
	position: center;
}
</style>
</head>
<body>
	<div class="find-password-page"
		ng-controller="FindIdCtrl as findIdCtrl">
		<div class="find-password-header">Find My Password</div>
		<form method='POST' action='/app/auth/getPassword' name="signinform"
			onsubmit="return checkAll();">
			<div class="find-password-content">
				<div class="find-password-div">
					등록하신 <span>E-Mail</span> 주소를 입력하세요.
				</div>
				<div>
					<input class="emailBox" type="email" name="email"
						placeholder="E-Mail" onblur="email_check();">
				</div>
				<div id="email_chk" class="vali_check"></div>
			</div>
			<div class="find-password-button">
				<button type="submit" onclick="find_email();" id="passwordRequest">Send</button>
			</div>
		</form>
	</div>

	<script src="/node_modules/jquery/dist/jquery.min.js"></script>
	<script type="text/javascript">
		function email_check() {
			var eCheckFlag = false;
			console.log("email_check");
			if (signinform.email.value == "") { // 빈 값 검사
				document.getElementById("email_chk").innerHTML = "이메일을 입력하세요.";
				$("#email_chk").css('color', 'red');
			} else {
				document.getElementById("email_chk").innerHTML = "";
				eCheckFlag = true;
			}
			return eCheckFlag;
		}
		function find_email() {
			var userEmail = $("input[name=email]").val();
			$.get("/app/json/auth/getMember?email=" + userEmail,
							function(data) {
								if (data.state == "success") {
									window.location.href = '/app/auth/getPassword?email='
											+ userEmail;
								} else {
									alert("없는 이메일 입니다. 다시 입력해 주세요")
									location.reload();
								}
							});
		}

		function checkAll() {
			var checkCnt = 0;
			if (email_check()) {
				checkCnt++;
			}

			console.log(checkCnt);
			return checkCnt == 2 ? true : false;
		}
	</script>
</body>
</html>