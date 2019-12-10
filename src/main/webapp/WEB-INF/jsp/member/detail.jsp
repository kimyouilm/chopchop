<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>My Page</title>
<link rel="stylesheet" href="/css/member/style_detail.css">
<!-- Favicon -->
<link rel="icon" href="/img/core-img/favicon.ico">
<!-- Font Awesome -->
<link rel="stylesheet"
  href="/js/plugins/fontawesome-free/css/all.min.css">
</head>
<jsp:include page="../header.jsp" />
<jsp:include page="../member/mypage_sidebar.jsp" />
<body onload="formLoad();">
	<div class="content-wrapper"
		style="width: 1100px; margin: 0px auto; min-height: 680px;">
		<div class="container memb-info px-0">
			<div
				class="d-flex justify-content-between align-items-center py-0 mb-3 mInfo">
				<h3 class="recipe-h3">My Information</h3>
				<span class="mInfo-span"> <a href="/app/member/myprofile"
					class="mypage-tagA">My Page</a>&nbsp>&nbspMy Information
				</span>
			</div>
			<form action='update' method='post' name="form"
				enctype='multipart/form-data' onsubmit="return checkAll();">
				<div class="row justify-content-center mem-Row">
					<div class="col-4" style="text-align: center;">
						<div id='content'>
							<div>
								<input type="hidden" id="photo2" value="${member.photo}" /> <img
									id="imgThumb" class="imgThumb">
							</div>
							<span class="btn btn-primary fileinput-button"
								style="background-color: #b0c364; border-color: #b0c364;">
								<span>사진 변경</span> <input id="fileupload" type="file"
								name="file">
							</span>
						</div>
					</div>
					<div class="col-8">
						<input type='hidden' id='memberNo' name='memberNo'
							value='${member.memberNo}' readonly>
						<div class="form-group row">
							<label for="email" class="col-sm-3 col-form-label">이메일</label>
							<div class="col-sm-6">
								<input type="email" readonly class="form-control-plaintext"
									id="email" value="${member.email}">
							</div>
						</div>
						<div class="form-group row">
							<label for="password" class="col-sm-3 col-form-label">패스워드</label>
							<div class="col-sm-6">
								<input type="button" class="form-control change_btn"
									id="password" name="pwUpdate" value="비밀번호 변경"
									data-toggle="modal" data-target="#exampleModal" />
							</div>
						</div>
						<div class="form-group row">
							<label for="nickname" class="col-sm-3 col-form-label">닉네임</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="nickname"
									name='nickname' value='${member.nickname}' maxlength="12"
									onblur="nickname_check();">
								<div id="nickname_chk" class="vali_check"></div>
							</div>
						</div>
						<div class="form-group row">
							<label for="tel" class="col-sm-3 col-form-label">핸드폰번호</label>
							<div class="col-sm-6">
								<input type="tel" class="form-control" id="tel" name='tel'
									value='${member.tel}' maxlength="11" onblur="tel_check();">
								<div id="tel_chk" class="vali_check"></div>
							</div>
						</div>
						<div class="form-group row">
							<label for="postNo" class="col-sm-3 col-form-label">우편번호</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="postNo"
									name='postNo' value='${member.postNo}'>
							</div>
							<div class="col-sm-3">
								<input type="button" class="form-control change_btn" id="postNo"
									name='post_search' value="우편번호 찾기" onclick="myPostcode();">
							</div>
						</div>
						<div class="form-group row">
							<label for="baseAddress" class="col-sm-3 col-form-label">기본주소</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="baseAddress"
									name='baseAddress' value='${member.baseAddress}'>
							</div>
						</div>
						<div class="form-group row">
							<label for="detailAddress" class="col-sm-3 col-form-label">상세주소</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="detailAddress"
									name='detailAddress' value='${member.detailAddress}'>
							</div>
						</div>
						<!-- 원래 닉네임값  -->
						<input type="hidden" id="nickname1" value="${member.nickname}" />
						<button type="submit" class="btn btn-primary"
							style="background-color: #b0c364; border-color: #b0c364;">변경</button>
						<button type="button" id="memberdelete" class="btn btn-primary"
							style="background-color: #b0c364; border-color: #b0c364;">회원탈퇴</button>
					</div>
				</div>
			</form>
		</div>
		<br>
		<br>
		<jsp:include page="../pet/detail.jsp" />
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">비밀번호 변경</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="form-group row">
							<label for="nowPassword" class="col-sm-4 col-form-label">현재
								비밀번호</label>
							<div class="col-sm-6">
								<input type="password" class="form-control" id="nowPassword"
									name='nowPassword' onblur="nowpw_check();" maxlength="15">
								<div id="password1_chk" class="vali_check"></div>
							</div>
						</div>
						<div class="form-group row">
							<label for="newPassword" class="col-sm-4 col-form-label">새
								비밀번호</label>
							<div class="col-sm-6">
								<input type="password" class="form-control" id="newPassword"
									name='newPassword' onblur="newpw_check();" maxlength="15">
								<div id="password2_chk" class="vali_check"></div>
							</div>
						</div>
						<div class="form-group row">
							<label for="newPassword" class="col-sm-4 col-form-label">새
								비밀번호 확인</label>
							<div class="col-sm-6">
								<input type="password" class="form-control" id="newPassword2"
									name='newPassword2' onblur="newpw2_check();" maxlength="15">
								<div id="password3_chk" class="vali_check"></div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary"
							style="background-color: #b0c364; border-color: #b0c364;"
							onclick="changePw();">변경</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script src="/node_modules/jquery/dist/jquery.min.js"></script>
	<script src="/node_modules/sweetalert/dist/sweetalert.min.js"></script>
	<script src="/node_modules/jquery-ui-dist/jquery-ui.min.js"></script>
	<script src="/node_modules/popper.js/dist/umd/popper.min.js"></script>
	<script src="/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
	 <script src="/node_modules/jquery/dist/jquery.min.js"></script>
	<script>
  
   $(function(){
       $('#exampleModal').on('shown.bs.modal', function () {
         pop_init ();
       });
    });
    
   function pop_init (){
     $("#nowPassword").val("");
     $("#newPassword").val("");
     $("#newPassword2").val("");
     $("#password1_chk").html("");
     $("#password2_chk").html("");
     $("#password3_chk").html("");
   }
   
  $('#memberdelete').click(function(){
    Swal.fire({
    title: '탈퇴하시겠습니까?',
    text: "저장된 데이터가 모두 사라집니다.",
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#b0c364',
    cancelButtonColor: '#d33',
    confirmButtonText: '탈퇴',
    cancelButtonText: '취소'
  }).then((result) => {
    console.log(result);
    if (result.value) {
       location.href='delete?no=${member.memberNo}'
      }
    })
  })

    function changePw() {
      var cnt = 0;

      if (nowpw_check()) {
        cnt++;
      }
      if (newpw_check()) {
        cnt++;
      }
      if (newpw2_check()) {
        cnt++;
      }

      // 업데이트 해줄 ajax memberNo, 변경할 패스워드
      if (cnt == 3) {
        
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
          if (xhr.readyState == 4) {
            if (xhr.status == 200) {
              if (xhr.responseText == "1") { // 1이면 변경완료, 0이면 변경 못함
                swal("변경완료 되었습니다.");
                $('#exampleModal').modal("hide");
              }
            } else {
              swal("시스템 오류 발생!");
            }
          }
        };
        xhr.open("POST", "uptPw", false);
        xhr.setRequestHeader('Content-type',
            'application/x-www-form-urlencoded');
        xhr.send("password="
            + document.getElementById("newPassword").value
            + "&memberNo="
            + document.getElementById("memberNo").value);
      }

    }

    function nowpw_check() {
      var pCheckFlag = false;
      if ($("#nowPassword").val() == "") {
        $("#password1_chk").html("비밀번호를 입력하세요.");
        $("#password1_chk").css('color', 'red');
      }

      // 비밀번호 정규식 검사 
      if ($("#nowPassword").val() != "") {
          var xhr = new XMLHttpRequest();
          xhr.onreadystatechange = function() {
            if (xhr.readyState == 4) {
              if (xhr.status == 200) {
                if (xhr.responseText == "0") { // 1이면 동일, 0이면 패스워드 틀림
                  document.getElementById("password1_chk").innerHTML = "패스워드를 다시 확인해주세요.";
                  $("#password1_chk").css('color', 'red');
                } else {
                  document.getElementById("password1_chk").innerHTML = "";
                  pCheckFlag = true;
                }
              } else {
                swal("시스템 오류 발생!");
              }
            }
          };
          xhr.open("POST", "chkPw", false);
          xhr.setRequestHeader('Content-type',
              'application/x-www-form-urlencoded');
          xhr.send("password="
              + document.getElementById("nowPassword").value
              + "&memberNo="
              + document.getElementById("memberNo").value);
        
      }
      return pCheckFlag;
    }
    function newpw_check() {
      var pCheckFlag = false;
      if ($("#newPassword").val() == "") {
        $("#password2_chk").html("새 비밀번호를 입력하세요.");
        $("#password2_chk").css('color', 'red');
      }

      // 비밀번호 정규식 검사 
      if ($("#newPassword").val() != "") {
        var passwordRegExp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
        if (!passwordRegExp.test($("#newPassword").val())) {
          $("#password2_chk").html("8~15자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
          $("#password2_chk").css('color', 'red');
        } else {
          $("#password2_chk").html("안전한 비밀번호입니다.");
          $("#password2_chk").css('color', 'green');
          pCheckFlag = true;
        }
      }
      return pCheckFlag;
    }

    function newpw2_check() {
      var p2CheckFlag = false;
      if ($("#newPassword2").val() == "") {
        $("#password3_chk").html("비밀번호 확인을 입력하세요.");
        $("#password3_chk").css('color', 'red');
      }

      // 비밀번호 & 비밀번호 확인이 같은 값인지 검사 
      
      if ($("#newPassword2").val() != "") {
        if ($("#newPassword").val() != $("#newPassword2").val()) {
          $("#password3_chk").html("두 비밀번호가 다릅니다.");
          $("#password3_chk").css('color', 'red');
        } else {
          $("#password3_chk").html("");
          p2CheckFlag = true;
        }
      }
      return p2CheckFlag;
    }

    function formLoad() {
      // hidden값을 이용해서 자바스크립트를 이용한 경우
      if ($("#photo2").val() == null || $("#photo2").val() == "") {
        $("#imgThumb").attr("src", "/upload/member/info_photo.jpg");
        //document.getElementById("imgThumb").src = "/upload/member/info_photo.jpg";
      } else {
        $("#imgThumb").attr("src", "/upload/member/" + $("#photo2").val());
      }
    }

    function checkAll() {
      var checkCnt = 0;
      if (nickname_check()) {
        checkCnt++;
      }
      if (tel_check()) {
        checkCnt++;
      }
      return checkCnt == 2 ? true : false;
    }

    function nickname_check() {
      var nCheckFlag = false;
      if (form.nickname.value == "") {
        $("#nickname_chk").html("닉네임을 입력하세요.");
        $("#nickname_chk").css('color', 'red');
      }
      // 닉네임 정규식 검사 
      var nRegPass = false;
      if (form.nickname.value != "") {
        var nicknameRegExp = /^[a-zA-z0-9가-힣]{2,12}$/;
        if (!nicknameRegExp.test(form.nickname.value)) {
          $("#nickname_chk").html("닉네임 형식이 올바르지 않습니다!");
          $("#nickname_chk").css('color', 'red');
        } else {
          nRegPass = true;
        }
      }

      // 닉네임 중복체크
      if (nRegPass) {
        // 원래 닉네임과 동일하게 쓴다면 ajax 돌 필요도 없다.
        if (form.nickname.value == form.nickname1.value) {
          $("#nickname_chk").html("변경 가능한 닉네임입니다.");
          $("#nickname_chk").css('color', 'green');
          nCheckFlag = true;
        } else {
          var xhr = new XMLHttpRequest();
          xhr.onreadystatechange = function() {
            if (xhr.readyState == 4) {
              if (xhr.status == 200) {
                // 0이면 가입 가능, 아니면 중복!
                if (xhr.responseText == "1") {
                  document.getElementById("nickname_chk").innerHTML = "중복된 닉네임입니다.";
                  $("#nickname_chk").css('color', 'red');
                } else {
                  document.getElementById("nickname_chk").innerHTML = "변경 가능한 닉네임입니다. ";
                  $("#nickname_chk").css('color', 'green');
                  nCheckFlag = true;
                }
              } else {
                swal("시스템 오류 발생!");
              }
            }
          }
          // false는 동기식(Ajax 순서대로 진행하도록 동기식으로)
          xhr.open("GET", "dupN?nickname=" + form.nickname.value, false);
          xhr.send();
        }
      }
      return nCheckFlag;
    }

    function tel_check() {
      var tCheckFlag = false;
      if (form.tel.value == "") {
        $("#tel_chk").html("핸드폰 번호를 입력하세요.");
        $("#tel_chk").css('color', 'red');
      }
      // 핸드폰 번호 정규식 검사 
      if (form.tel.value != "") {
        var telRegExp = /^[0-9]{3}[0-9]{3,4}[0-9]{4}$/;
        if (!telRegExp.test(form.tel.value)) {
          $("#tel_chk").html("핸드폰 번호의 형식이 올바르지 않습니다.");
          $("#tel_chk").css('color', 'red');
        } else {
          $("#tel_chk").html("");
          tCheckFlag = true;
        }
      }
      return tCheckFlag;
    }

    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function myPostcode() {
      new daum.Postcode(
          {
            oncomplete : function(data) {

              // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
              // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
              var roadAddr = data.roadAddress; // 도로명 주소 변수
              var extraRoadAddr = ''; // 참고 항목 변수

              // 법정동명이 있을 경우 추가한다. (법정리는 제외)
              // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
              if (data.bname !== ''
                  && /[동|로|가]$/g.test(data.bname)) {
                extraRoadAddr += data.bname;
              }
              // 건물명이 있고, 공동주택일 경우 추가한다.
              if (data.buildingName !== ''
                  && data.apartment === 'Y') {
                extraRoadAddr += (extraRoadAddr !== '' ? ', '
                    + data.buildingName : data.buildingName);
              }
              // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
              if (extraRoadAddr !== '') {
                extraRoadAddr = ' (' + extraRoadAddr + ')';
              }
              // 우편번호와 주소 정보를 해당 필드에 넣는다.
              document.getElementById("postNo").value = data.postcode;
              document.getElementById("baseAddress").value = data.jibunAddress;
              document.getElementById("detailAddress").value = "";
            }
          }).open();
    }

    // 사진 미리보기 
    document.getElementById("fileupload").onchange = function() {
      var reader = new FileReader();
      reader.onload = function(e) {
        document.getElementById("imgThumb").src = e.target.result;
//        $("#imgThumb").attr("src", "e.target.result");
      };
      reader.readAsDataURL(this.files[0]);
    };
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
</body>
<jsp:include page="../footer.jsp" />
</html>