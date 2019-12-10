package bitcamp.chopchop.domain;

public class CartProductOption {
  int no;
  int quantity;
  
  public int getNo() {
    return no;
  }
  public void setNo(int no) {
    this.no = no;
  }
  public int getQuantity() {
    return quantity;
  }
  public void setQuantity(int quantity) {
    this.quantity = quantity;
  }
  
  @Override
  public String toString() {
    return "CartProductOption [no=" + no + ", quantity=" + quantity + "]";
  }
  
  
}
