package bitcamp.chopchop.domain;

import java.sql.Date;

public class Comment {

  private int commentNo;
  private int productNo;
  private int memberNo;
  private String title;
  private String content;
  private String answer;
  private Date createdDate;
  private Member member;

  @Override
  public String toString() {
    return "Comment [commentNo=" + commentNo + ", productNo=" + productNo + ", memberNo=" + memberNo
        + ", title=" + title + ", content=" + content + ", answer=" + answer + ", createdDate="
        + createdDate + ", member=" + member + "]";
  }

  public int getCommentNo() {
    return commentNo;
  }

  public void setCommentNo(int commentNo) {
    this.commentNo = commentNo;
  }

  public int getProductNo() {
    return productNo;
  }

  public void setProductNo(int productNo) {
    this.productNo = productNo;
  }

  public int getMemberNo() {
    return memberNo;
  }

  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public Date getCreatedDate() {
    return createdDate;
  }

  public void setCreatedDate(Date createdDate) {
    this.createdDate = createdDate;
  }

  public Member getMember() {
    return member;
  }

  public void setMember(Member member) {
    this.member = member;
  }

  public String getAnswer() {
    return answer;
  }

  public void setAnswer(String answer) {
    this.answer = answer;
  }
}
