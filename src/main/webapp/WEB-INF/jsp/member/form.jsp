<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>CHOPCHOP 회원가입</title>
<!-- Favicon -->
<link rel="stylesheet" href="/css/member/style_join.css">
</head>
<jsp:include page="../header.jsp" />
<body>
  <div class="bucket">
    <div class="buffer">
      <div class="header">
        <div class="logo-area"></div>
      </div>
      <form method="POST" action="add" name="form" onsubmit="return checkAll();">
        <input type="email" id="email" name="email" placeholder="이메일" onblur="email_check();"/>
          <div id="email_chk" class="vali_check"></div>
        <input type="password" id="password" name="password" placeholder="비밀번호" onblur="password_check();" maxlength="15"/> 
          <div id="password_chk" class="vali_check"></div>
        <input type="password" id="password2" name="password2" placeholder="비밀번호 확인" onblur="password2_check();" maxlength="15"/> 
          <div id="password2_chk" class="vali_check"></div>
        <input type="text" id="nickname" name="nickname" placeholder="닉네임" onblur="nickname_check();" maxlength="12"/>
          <div id="nickname_chk" class="vali_check"></div>
        <input type="tel" id="tel" name="tel" placeholder="핸드폰 번호&nbsp&nbsp&nbsp'-'없이 숫자만 입력해주세요." onblur="tel_check();" maxlength="11"/> 
          <div id="tel_chk" class="vali_check"></div>
        <input type="submit" class="btn" value="회원가입" />
      </form>
      <br>
    </div>
  </div>
  
  <script type="text/javascript">
  
  function email_check() {
	  var eCheckFlag = false;
    if (form.email.value == "") { // 빈 값 검사
      document.getElementById("email_chk").innerHTML = "이메일을 입력하세요.";
      $("#email_chk").css('color', 'red');
    }
    // 이메일 값이 들어있다면 정규식 검사 
    var eRegPass = false;
    if (form.email.value != "") { 
      var emailRegExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
      if (!emailRegExp.test(form.email.value)) {
        document.getElementById("email_chk").innerHTML = "이메일 형식이 올바르지 않습니다!";
        $("#email_chk").css('color', 'red');
      } else {
        eRegPass = true;
      }
    }
    
    // 이메일 중복체크
    if(eRegPass) {
      var xhr = new XMLHttpRequest();
      xhr.onreadystatechange = function() {
        if (xhr.readyState == 4) {
        if (xhr.status == 200) {
          if (xhr.responseText == "1") { // 0이면 가입 가능, 아니면 중복!
            document.getElementById("email_chk").innerHTML = "중복된 이메일입니다.";
            $("#email_chk").css('color', 'red');
          } else {
            document.getElementById("email_chk").innerHTML = "가입 가능한 이메일입니다. ";
            $("#email_chk").css('color', 'green');
            eCheckFlag = true; 
          }
        } else {
          alert("시스템 오류 발생!");
        }
        }
      };
      xhr.open("GET", "dupE?email=" + form.email.value, false);
      xhr.send();
    }
    return eCheckFlag;
  }
  
function password_check() {
  var pCheckFlag = false;
  if (form.password.value == "") {
    document.getElementById("password_chk").innerHTML = "비밀번호를 입력하세요.";
    $("#password_chk").css('color', 'red');
  } 

  // 비밀번호 정규식 검사 
  if (form.password.value != "") {
    var passwordRegExp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
  if (!passwordRegExp.test(form.password.value)) {
    document.getElementById("password_chk").innerHTML = "8~15자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
    $("#password_chk").css('color', 'red');
  } else {
    document.getElementById("password_chk").innerHTML = "사용 가능한 비밀번호입니다.";
    $("#password_chk").css('color', 'green');
    pCheckFlag = true;
  }
  } 
  return pCheckFlag;
}
  
  function password2_check() {
	  var p2CheckFlag = false;
	  if (form.password2.value == "") {
       document.getElementById("password2_chk").innerHTML = "비밀번호 확인을 입력하세요.";
       $("#password2_chk").css('color', 'red');
     } 
	  
	  // 비밀번호 & 비밀번호 확인이 같은 값인지 검사 
    if (form.password2.value != "") {
      if (form.password.value != form.password2.value) {
        document.getElementById("password2_chk").innerHTML = "두 비밀번호가 다릅니다.";
        $("#password2_chk").css('color', 'red');
      } else {
        document.getElementById("password2_chk").innerHTML = "두 비밀번호가 일치합니다.";
        $("#password2_chk").css('color', 'green');
        p2CheckFlag = true;
      }
    } 
	  return p2CheckFlag;
  }
  
  function nickname_check() {
	  var nCheckFlag = false;
	  if (form.nickname.value == "") {
       document.getElementById("nickname_chk").innerHTML = "닉네임을 입력하세요.";
       $("#nickname_chk").css('color', 'red');
     } 
    // 닉네임 정규식 검사 
    var nRegPass = false;
    if (form.nickname.value != "") {
      var nicknameRegExp = /^[a-zA-z0-9가-힣]{2,12}$/;
      if (!nicknameRegExp.test(form.nickname.value)) {
          document.getElementById("nickname_chk").innerHTML = "닉네임 형식이 올바르지 않습니다!";
          $("#nickname_chk").css('color', 'red');
      } else {
        nRegPass = true;
      }
    }
      
    // 닉네임 중복체크
    if(nRegPass) {
      var xhr = new XMLHttpRequest();
      xhr.onreadystatechange = function() {
        if (xhr.readyState == 4) {
          if (xhr.status == 200) {
            // 0이면 가입 가능, 아니면 중복!
            if (xhr.responseText == "1") {
              document.getElementById("nickname_chk").innerHTML = "중복된 닉네임입니다.";
              $("#nickname_chk").css('color', 'red');
            } else {
              document.getElementById("nickname_chk").innerHTML = "가입 가능한 닉네임입니다. ";
              $("#nickname_chk").css('color', 'green');
              nCheckFlag = true;
            }
          } else {
            alert("시스템 오류 발생!");
          }
        }
      }
      // false는 동기식(Ajax 순서대로 진행하도록 동기식으로 )
      xhr.open("GET", "dupN?nickname=" + form.nickname.value, false);
      xhr.send();
    }
    return nCheckFlag;
  }
  
  function tel_check() {
	  var tCheckFlag = false;
	  if (form.tel.value == "") {
      document.getElementById("tel_chk").innerHTML = "핸드폰 번호를 입력하세요.";
      $("#tel_chk").css('color', 'red');
    } 
	// 핸드폰 번호 정규식 검사 
    if (form.tel.value != "") {
      var telRegExp = /^[0-9]{3}[0-9]{3,4}[0-9]{4}$/;
      if (!telRegExp.test(form.tel.value)) {
       document.getElementById("tel_chk").innerHTML = "핸드폰 번호의 형식이 올바르지 않습니다.";
       $("#tel_chk").css('color', 'red');
      } else {
        document.getElementById("tel_chk").innerHTML = "";
        tCheckFlag = true;

      }
    } 
   return tCheckFlag;
  }
  
  function checkAll() {
    var checkCnt = 0;
    if (email_check()) {
      checkCnt++;
    }
    if (password_check()) {
      checkCnt++;
    }
    if (password2_check()) {
      checkCnt++;
    }
    if (nickname_check()) {
      checkCnt++;
    }
    if (tel_check()) {
      checkCnt++;
    }
    
    return checkCnt == 5 ? true : false; 
   }
</script>
<script src="/node_modules/jquery/dist/jquery.min.js"></script>
<jsp:include page="../footer.jsp"/>
</body>
</html>

