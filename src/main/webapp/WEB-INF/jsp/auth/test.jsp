<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찾기</title>
<script type="text/JavaScript"
   src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<style>
#mail1 {
   display: none;
}

#ctf_check {
  display: none;
}
</style>
</head>
<body>
   <form action="findid" method="post">
      <h1>아이디 찾기</h1>

      <h2>이름</h2>
      <input type="text" name="name" required>
      <h2>이메일</h2>
      <div id=mailselect>
         <input type="text" name=mail0 id="mail0" maxlength="50" required>@
         <input type="text" name="mail1" id="mail1" value="" required> 
         <select   name="mail2" id="mail2">
            <option selected disabled>메일 선택</option>
            <option value="naver.com">naver.com</option>
            <option value="daum.net">daum.net</option>
            <option value="gmail.com">gmail.com</option>
            <option value="nate.com">nate.com</option>
            <option value="">직접 입력</option>
         </select>
      </div>
      <div id="email_check"></div>
      
      <button type="submit" id="submit">아이디를 찾아줘</button>
   </form>
   
<!--    <form action="이메일전송" method=""></form>이메일 세션 저장 -->
    <h1>비밀번호 찾기</h1>

    <h2>이름</h2>
    <input type="text" name="name" required>
    <h2>아이디</h2>
    <input type="text" name="id" required>
    <h2>이메일</h2>
    <div id=mailselect>
      <input type="text" name="mail0" id="mail0" maxlength="50" required>@
      <input type="text" name="mail1" id="mail1" value="" required> 
      <select name="mail2" id="mail2">
        <option selected disabled>메일 선택</option>
        <option value="naver.com">naver.com</option>
        <option value="daum.net">daum.net</option>
        <option value="gmail.com">gmail.com</option>
        <option value="nate.com">nate.com</option>
        <option value="">직접 입력</option>
      </select>
    </div>
    <div id="email_check"></div>
    
    <input type="button" id="ctf" onclick='ctfft()' value="인증번호 발송" required>
    <div id="ctf_check">
         <div id=divRandom></div>
         <input type="text" id="ctfok">
         <input type="button" id="ctfclick" onclick='ctfclick2()' value="인증 확인" required>
         <div id="ctf_check2"></div>
      <a href="../auth/findpw">
      <button type="submit" id="submit2">비밀번호 찾기</button></a>
    </div>
  
<!--   인증번호 생성-->
  <script>
    function ctfft() {
       var dp = document.getElementById("ctf_check");
      dp.style.display = "block";
      
      var arr="a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,1,2,3,4,5,6,7,8,9".split(",");
      var randomStr = "";
      
      for (var j=0; j<10; j++) {
          randomStr += arr[Math.floor(Math.random()*arr.length)];
      }

      document.getElementById("divRandom").innerText = randomStr;
      }
  </script>

<!--   인증 확인 -->
  <script>
    function ctfclick2(){
       var whatmail = "s_swwhh@naver.com";
        $.ajax({
          url : 'mailsend',
          type : 'post',
          data : "whatmail="+whatmail,
          success : function(result) {
       var dq = document.getElementById('divRandom').innerHTML;
       var dw = $('#ctfok').val();
       if(dw == ""){
          $('#ctf_check2').text('인증번호를 입력해주세요');
        $('#ctf_check2').css('color', 'red');
        $("#submit2").attr("disabled", true);
       } else if(dq == dw){
          $('#ctf_check2').text('인증 되었습니당');
        $('#ctf_check2').css('color', 'green');
        $('#ctfok').css('color', 'green');
        $("#submit2").attr("disabled", false);
       } else{
          $('#ctf_check2').text('인증번호가 맞지 않습니다');
        $('#ctf_check2').css('color', 'red');
        $('#ctfok').css('color', 'red');
        $("#submit2").attr("disabled", true);
       }
    }, error : function() {
        console.log("실패");
    }
  });
  }
  </script>

<!--   메일 -->
   <script>
   $("#mailselect").change(function() {
         var dp = document.getElementById("mail1");
         dp.style.display = "block";
         
         var mail0 = $('#mail0').val();
         var mail1 = $('#mail1').val();
         var mail = mail0+'@'+mail1;
         
         if($("#mailselect option:selected").val() == "") {
             dp.readOnly = false;
             $('#email_check').text("");
             $("#submit").attr("disabled", false);
           } else if($("#mailselect option:selected").val() == "메일 선택") {
                dp.readOnly = true;
                $('#email_check').text('이메일을 입력해주세요 :)');
                $('#email_check').css('color', 'red');
                $("#submit").attr("disabled", true);
            } else {
               dp.readOnly = true;
               $('#email_check').text("");
               $("#submit").attr("disabled", false);
            }
   });
   </script>

   <!--     메일 선택 -->
   <script>
  $("#mail2").change(function() {
      document.getElementById("mail1").value = document.getElementById("mail2").value;
      });
  </script>

</body>
</html>