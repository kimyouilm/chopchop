package bitcamp.chopchop.domain;

import java.sql.Date;
import java.util.List;

public class ProductReview {

  private int productReviewNo;
  private int productNo;
  private int memberNo;
  private int orderNo;
  private String filePath;
  private String content;
  private int rating;
  private Date createdDate;

  private String writer;

  private List<Product> products;
  private List<Member> members;
  private List<ProductOption> options;

  public int getProductReviewNo() {
    return productReviewNo;
  }

  public void setProductReviewNo(int productReviewNo) {
    this.productReviewNo = productReviewNo;
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

  public String getFilePath() {
    return filePath;
  }

  public void setFilePath(String filePath) {
    this.filePath = filePath;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public int getRating() {
    return rating;
  }

  public void setRating(int rating) {
    this.rating = rating;
  }

  public Date getCreatedDate() {
    return createdDate;
  }

  public void setCreatedDate(Date createdDate) {
    this.createdDate = createdDate;
  }
  
    public List<Product> getProducts() {
      return products;
    }
  
    public void setProducts(List<Product> products) {
      this.products = products;
    }
    
      public List<Member> getMembers() {
        return members;
      }
    
      public void setMembers(List<Member> members) {
        this.members = members;
      }
      
        public String getWriter() {
          return writer;
        }
      
        public void setWriter(String writer) {
          this.writer = writer;
        }

  @Override
  public String toString() {
    return "ProductReview [productReviewNo=" + productReviewNo + ", productNo=" + productNo
        + ", memberNo=" + memberNo + ", orderNo=" + orderNo + ", filePath=" + filePath
        + ", content=" + content + ", rating=" + rating + ", createdDate=" + createdDate
        + ", writer=" + writer + ", products=" + products + ", members=" + members + ", options="
        + options + "]";
  }

  public List<ProductOption> getOptions() {
    return options;
  }

  public void setOptions(List<ProductOption> options) {
    this.options = options;
  }

  public int getOrderNo() {
    return orderNo;
  }

  public void setOrderNo(int orderNo) {
    this.orderNo = orderNo;
  }
  
  
  
}
