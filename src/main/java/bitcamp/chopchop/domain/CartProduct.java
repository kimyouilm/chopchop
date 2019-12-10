package bitcamp.chopchop.domain;

import java.util.List;

public class CartProduct {
  private int no;
//  private int quantity;
  
  List<CartProductOption> options;

  public int getNo() {
    return no;
  }

  public void setNo(int no) {
    this.no = no;
  }

//  public int getQuantity() {
//    return quantity;
//  }
//
//  public void setQuantity(int quantity) {
//    this.quantity = quantity;
//  }

  public List<CartProductOption> getOptions() {
    return options;
  }

  public void setOptions(List<CartProductOption> options) {
    this.options = options;
  }

  @Override
  public String toString() {
    return "CartProduct [no=" + no + ", options=" + options + "]";
  }
  
  
}
