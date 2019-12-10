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

.telBox {
	width: 360px;
	height: 28px;
	position: center;
}
</style>
</head>
<body>
	<div class="find-password-page"
		ng-controller="FindIdCtrl as findIdCtrl">
		<div class="find-password-header">Find My ID</div>
		<form method='POST' action='/app/auth/getID' name="signinform"
			onsubmit="return checkAll();">
			<div class="find-password-content">
				<div class="find-password-div">
					등록하신 <span>전화번호를</span> 입력하세요.
				</div>
				<div>
					<input class="telBox" type="tel" name="tel"
						placeholder="Telephone" onblur="tel_check();">
				</div>
				<div id="tel_chk" class="vali_check"></div>
			</div>
			<div class="find-password-button">
				<button type="submit" onclick="find_id();" id="IDRequest">Find ID</button>
			</div>
		</form>
	</div>

	<script src="/node_modules/jquery/dist/jquery.min.js"></script>
	<script type="text/javascript">
		function tel_check() {
			var eCheckFlag = false;
			console.log("tel_check");
			if (signinform.tel.value == "") { // 빈 값 검사
				document.getElementById("tel_chk").innerHTML = "전화번호를 입력하세요.";
				$("#tel_chk").css('color', 'red');
			} else {
				document.getElementById("tel_chk").innerHTML = "";
				eCheckFlag = true;
			}
			return eCheckFlag;
		}
		function find_id() {
			var userTel = $("input[name=tel]").val();
			$.get("/app/json/auth/getMemberID?tel=" + userTel,
							function(data) {
				console.log(data.state);
								if (data.state == "success") {
									window.location.href = '/app/auth/getID?tel='
											+ userTel;
								} else {
									alert("없는 전화번호 입니다. 다시 입력해 주세요")
									location.reload();
								}
							});
		}

		function checkAll() {
			var checkCnt = 0;
			if (tel_check()) {
				checkCnt++;
			}

			console.log(checkCnt);
			return checkCnt == 2 ? true : false;
		}
	</script>
</body>
</html>