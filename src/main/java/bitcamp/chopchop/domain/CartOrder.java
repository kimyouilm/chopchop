package bitcamp.chopchop.domain;

import java.util.List;

public class CartOrder {
  List<Integer> no;
  List<Integer> optionNo;
  List<Integer> quantity;

  @Override
  public String toString() {
    return "CartOrder [no=" + no + ", optionNo=" + optionNo + ", quantity=" + quantity + "]";
  }

  public List<Integer> getNo() {
    return no;
  }

  public void setNo(List<Integer> no) {
    this.no = no;
  }

  public List<Integer> getOptionNo() {
    return optionNo;
  }

  public void setOptionNo(List<Integer> optionNo) {
    this.optionNo = optionNo;
  }

  public List<Integer> getQuantity() {
    return quantity;
  }

  public void setQuantity(List<Integer> quantity) {
    this.quantity = quantity;
  }



}
