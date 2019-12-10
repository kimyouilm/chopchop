<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>ChopChop Sign in</title>
<link rel='stylesheet'
	href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'
	integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T'
	crossorigin='anonymous'>
<link rel='stylesheet' href='/css/member/signin.css'>
<!-- Favicon -->
<link rel="icon" href="/img/core-img/favicon.ico">
</head>
<body>

	<div class="bucket">
		<div class="buffer">
			<div class="header">
				<div class="logo-area"></div>
			</div>
			<form name="signinform" onsubmit="return checkAll();">
				<label for="email">Email</label> <input type="email" name="email"
					value='${cookie.email.value}' onblur="email_check();" />
				<div id="email_chk" class="vali_check"></div>
				<label for="password">Password</label> <input type="password"
					name="password" onblur="password_check();" />
				<div id="password_chk" class="vali_check"></div>
				<div id="emailPassword_chk" class="vali_check"></div>
				<input class="btn" onclick="check_signin();" type="button"
					value="Sign in" />
			</form>
			<input class="btnn" type="button"
				onclick="window.location.href = '/app/member/form';"
				value="Create Account" />

			<div class="find_info">
				<a target="_blank" id="pwinquiry" href="/app/auth/findID"
					onclick="window.open(this.href, '_blank', 'width=600px,height=600px,toolbars=no,scrollbars=no'); return false;">
					Find my ID</a> <span class="bar" aria-hidden="true">|</span> <a
					href="/app/auth/findPassword"
					onclick="window.open(this.href, '_blank', 'width=600px,height=600px,toolbars=no,scrollbars=no'); return false;">
					Find my password</a> <span class="bar" aria-hidden="true">|</span>
			</div>
		</div>
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

		function password_check() {
			var pCheckFlag = false;
			console.log("password_check");
			if (signinform.password.value == "") {
				document.getElementById("password_chk").innerHTML = "비밀번호를 입력하세요.";
				$("#password_chk").css('color', 'red');
			} else {
				document.getElementById("password_chk").innerHTML = "";
				pCheckFlag = true;
			}

			return pCheckFlag;
		}

		function checkAll() {
			var checkCnt = 0;
			if (email_check()) {
				checkCnt++;
			}
			if (password_check()) {
				checkCnt++;
			}

			return checkCnt == 2 ? true : false;
		};

		function check_signin() {
			var userEmail = $("input[name=email]").val();
			var userPssword = $("input[name=password]").val();

			$
					.post(
							"/app/json/auth/login",
							{
								email : userEmail,
								password : userPssword
							},
							function(data) {
								if (data.state == "success") {
									window.location.href = '/app/index';
								} else {
									document.getElementById("password_chk").innerHTML = "가입하지 않은 아이디거나, 잘못된 비밀번호입니다.";
									$("#password_chk").css('color', 'red');
								}
							});
		}
	</script>
	<jsp:include page="../footer.jsp" />

</body>
</html>
