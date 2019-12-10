<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <!-- Comment Area Start -->
  <div class="comment_area mb-100">
    <h4 class="mb-50">상품 문의</h4>
    <c:forEach items="${comments}" var = "comment">
    <div>
      <ol>
        <!-- Single Comment Area -->
        <li class="single_comment_area" id="isComment">
          <!-- Comment Content -->
          <div class="comment-content d-flex">
            <!-- Comment Author -->
            <div class="comment-author">
              <span class="member-no" style="display:none">${comment.member.memberNo}</span>
              <p><span id="memberName" style="font-size:14px;">${comment.member.nickname}</span></p>
            </div>
            <!-- Comment Meta -->
            <div class="comment-meta">
              <div class="d-flex" style="height:60px;">
                <a class="comment-no" style="display:none;">${comment.commentNo}</a>
                <a class="update-title">${comment.title}&nbsp;&nbsp;</a>
                <a class="post-date">${comment.createdDate}</a>
                &nbsp;<a style="display:none;" id="" class="reply-btn">수정</a>&nbsp;
                &nbsp;<a style="display:none;" class="comment-delete-btn">삭제</a>&nbsp;
              </div>
              <p class="update-content" style="display:none;">${comment.content}</p><br>
              <textarea class="form-control" id="comment-answer" placeholder="답변을 입력해주세요." style="display:none;">${comment.answer}</textarea>
<!--               <label class="answer-label" style="display:none">답변<br></label><br> -->
              <hr class="content-answer-line" style="display:none;">
              <button class="btn btn-success" id="answer-submit" style="display:none;">입력</button>
              <p style="display:none;">${comment.answer}</p>
              <br><br><a class="comment-answer-btn" style="display:none">답변하기</a>
            </div>
          </div><hr style="width:1100px;">
        </li>
      </ol>
      </div>
    </c:forEach>
    <div id="fuck"></div>
    <div class="post-a-comment-area mb-30" id="append-comment">
      <h4 class="mb-50">Leave a reply</h4>
      <div class="contact-form-area">
        <form>
          <div id="abc">
            <input type='hidden' name='productNo' id='productNo' value='${product.productNo}'>
            <input type='hidden' name='memberNo' id="memberNo"value='${loginUser.memberNo}'>
            <div class="col-12 col-lg-6">
              <input type="text" name='title' class="form-control" id="title" placeholder="title" required>
            </div>
            <div class="col-12">
              <textarea name='content' class="form-control" id="message" cols="30" rows="10" placeholder="Message" required></textarea>
            </div>
            <div class="col-12">
              <button id="comment-submit" class="btn bueno-btn mt-30" type="button">Submit Comment</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
