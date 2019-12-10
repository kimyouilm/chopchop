package bitcamp.chopchop.domain;

public class OrderProduct {

  private int orderProductNo;
  private int orderNo;
  private int productNo;
  private int quantity;
  private int discountPrice;
  private int optionNo;
  private Product product;
  private Order order;
  private ProductOption productOption;

  @Override
  public String toString() {
    return "OrderProduct [orderProductNo=" + orderProductNo + ", orderNo=" + orderNo
        + ", productNo=" + productNo + ", quantity=" + quantity + ", discountPrice=" + discountPrice
        + ", optionNo=" + optionNo + ", product=" + product + ", order=" + order
        + ", productOption=" + productOption + "]";
  }

  public int getOrderProductNo() {
    return orderProductNo;
  }

  public void setOrderProductNo(int orderProductNo) {
    this.orderProductNo = orderProductNo;
  }

  public ProductOption getProductOption() {
    return productOption;
  }

  public void setProductOption(ProductOption productOption) {
    this.productOption = productOption;
  }

  public int getOrderNo() {
    return orderNo;
  }

  public void setOrderNo(int orderNo) {
    this.orderNo = orderNo;
  }

  public int getProductNo() {
    return productNo;
  }

  public void setProductNo(int productNo) {
    this.productNo = productNo;
  }

  public int getQuantity() {
    return quantity;
  }

  public void setQuantity(int quantity) {
    this.quantity = quantity;
  }

  public int getDiscountPrice() {
    return discountPrice;
  }

  public void setDiscountPrice(int discountPrice) {
    this.discountPrice = discountPrice;
  }

  public int getOptionNo() {
    return optionNo;
  }

  public void setOptionNo(int optionNo) {
    this.optionNo = optionNo;
  }

  public Product getProduct() {
    return product;
  }

  public void setProduct(Product product) {
    this.product = product;
  }

  public Order getOrder() {
    return order;
  }

  public void setOrder(Order order) {
    this.order = order;
  }

}
