<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">댓글 수정</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <input type='hidden' class="modal-commentNo" name='commentNo' value='${recipeComment.commentNo}' >
      <textarea class="modal-comment-text" name='content' rows='3' cols='50'></textarea>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary modal-closeBtn" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-danger modal-delBtn">Delete</button>
        <button type="button" class="btn btn-primary modal-saveBtn">Save</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal -->

<section class="post-news-area section-padding-100-0 mb-70">
<div class="container">
  <div class="justify-content-center">
    <div class="col-12">
      <div class="comment_area mb-100 my-commentList">
        <h4 class="mb-50">Comments</h4>
        <ol class="commentList">
        <!-- commentList-->
        </ol>
        <nav aria-label="Page navigation example">
        <ul class="pagination">
          <li class="page-item" data-page="prev">
          <a class="page-link" href="#">
            <span aria-hidden="true">&laquo;</span>
          </a>
          </li>
          <li class="page-item" data-page="next">
          <a class="page-link" href="#">
            <span aria-hidden="true">&raquo;</span>
          </a>
          </li>
        </ul>
        </nav>
      </div>
    </div>
                    
    <div class="row">      
      <div class="col-12 post-a-comment-area mb-30">
        <h4 class="mb-50">Leave a reply</h4>
        <!-- Reply Form -->
          <div class="contact-form-area">
            <form id='commentForm' name='commentForm'>
            <div class="row">
              <div class="col-12 col-lg-12">
                <input type="hidden" class="form-control" name="no" value="${recipe.recipeNo}">
                <input type="hidden" class="form-control" value="${viewer.nickname}" readonly>
              </div>
              <div class="col-12">
                <textarea name="content" class="form-control add-content" id="message" cols="30" rows="10" placeholder="Message" required></textarea>
              </div>
              <div class="col-12">
                <button id="addCommentBtn" type="button" class="btn bueno-btn mt-30">Submit Comment</button>
              </div>
            </div>
            </form>
          </div>
       </div>
    </div>
  </div>
</div>
</section>
        
<script id="t1" type="commentHtml">
{{#each recipeComments}}
<li class='single_comment_area'>
<div class='comment-content d-flex my-comment' style='height:70px;'>
    <div class='comment-author'>
    <img class='author-img' src='/upload/member/{{member.photo}}' alt='author'>
    </div>
  <div class='comment-meta'>
    <div class='d-flex'>
      <a class='post-author'>{{member.nickname}}</a>
      <a class='post-date'>{{recipeComment.createdDate}}</a>
      {{#if owner}}
        <a href='#' class='reply my-btn'>수정</a>
      {{/if}}
    </div>
    <input type='hidden' class='comment-no' name='commentNo' value={{recipeComment.commentNo}}>
    <p class='comment-content'>{{recipeComment.content}}</p>
  </div>
</div>
<hr>
</li>
{{/each}}
</script>

<script>
"use strict";
var dbody = $('.commentList');
var templateSrc = $('#t1').html();
var template = Handlebars.compile(templateSrc);

function addComment(data) {
  dbody.append(template(data));
};

$('#addCommentBtn').on('click', function() { 
  if ($('#message').val() == '' || $('#message').val() == '댓글을 입력해주세요.') {
    $('#message').val('댓글을 입력해주세요.').css('color', 'red');
  } else {
    var comment = $('#commentForm').serialize(); // recipeNo=32&content=ddd
    $.post("/app/json/recipecomment/add", comment, function(data) {
      if(data.state == 'success') {
        $('.add-content').val('');
        $('.single_comment_area').remove();
        getCommentList();
      }
    });
  }
});

$('#exampleModal').modal({ // modal 속성 설정
  backdrop: 'static',
  keyboard: false,
  show: false
});
</script>

<script>
"use strict";
var dbody2 = $('.commentList');
var templateSrc2 = $('#t1').html();
var template2 = Handlebars.compile(templateSrc2);

getCommentList();

function getCommentList() {
  $.get("/app/json/recipecomment/list?no=" + ${recipe.recipeNo}, function(data) {
    console.log(data.result); 
    for (var item of data.result.recipeComments) {
      item.owner = item.member.memberNo == item.viewer.memberNo;
    }
    dbody2.html(template2(data.result));
    
    window.currentPage = data.result.pageNo;
    window.pageSize = data.result.pageSize;
    window.totalPage = data.result.totalPage;
  });
};

  $(document).on('click', '.my-btn', function(e) {
    window.commentContent = $(e.target.parentNode.parentNode.parentNode).find('.comment-content').text();
    window.commentNo = $(e.target.parentNode.parentNode.parentNode).find('.comment-no').val();
    $('.modal-comment-text').val(window.commentContent); // modal 창에 값을 셋팅
    $('.modal-commentNo').val(window.commentNo);
    $('#exampleModal').modal('show');
    return false;
  });
  
  $('.modal-saveBtn').on('click', function() { // 모달창에서 save 클릭 이벤트
    var content = $('.modal-comment-text').val();
    var commentNo = $('.modal-commentNo').val();
    $.ajax({
      url: '/app/json/recipecomment/update',
      type: 'POST',
      data: {commentNo: commentNo, content: content},
      success: function(result){
        $('.single_comment_area').remove();
        getCommentList();
        $('#exampleModal').modal('hide'); 
      }
    });
  });
  
  $('.modal-delBtn').on('click', function() { // 모달창에서 delete 클릭 이벤트
    var commentNo = $('.modal-commentNo').val();
    $.get('/app/json/recipecomment/delete?no='+ commentNo, function(data) {
      console.log(commentNo); // 삭제된 번호
      $('.single_comment_area').remove();

      getCommentList();
      $('#exampleModal').modal('hide'); 
    });
  });
  
$('.page-item').click((e) => {
e.preventDefault();
var page = $(e.currentTarget).attr('data-page');

if (page == 'prev') {
  if (currentPage == 1) {
    alert("첫페이지입니다!!");    
    return;
  }
  prev(currentPage, pageSize, totalPage);
  
} else if (page == 'next') {
    if (currentPage >= totalPage)
    return;
  next(currentPage, pageSize, totalPage);
} else {
  console.log("else로 들어옴");
}
});

function next(currentPage, pageSize, totalPage) {
  $.get('/app/json/recipecomment/list?no=' +${recipe.recipeNo} + '&pageNo=' + (currentPage + 1), function(data) {
    console.log(data.result);
      $('.single_comment_area').remove();
      
      for (var item of data.result.recipeComments) {
        console.log(item.member.memberNo);
        item.owner = item.member.memberNo == item.viewer.memberNo;
      }
      
    dbody2.html(template2(data.result));
    window.currentPage = data.result.pageNo;
    window.pageSize = data.result.pageSize;
    window.totalPage = data.result.totalPage;
    
  });
};

function prev(currentPage, pageSize, totalPage) {
  $.get('/app/json/recipecomment/list?no=' +${recipe.recipeNo} + '&pageNo=' + (currentPage - 1), function(data) {
    console.log(data.result);
      $('.single_comment_area').remove();
      for (var item of data.result.recipeComments) {
        console.log(item.member.memberNo);
        item.owner = item.member.memberNo == item.viewer.memberNo;
      }
      dbody2.html(template2(data.result));
      
      window.currentPage = data.result.pageNo;
      window.pageSize = data.result.pageSize;
      window.totalPage = data.result.totalPage;
      
  });
};
  
</script>
