package bitcamp.chopchop.domain;

import java.sql.Date;
import java.util.List;

public class Cart {
  private int cartNo;
  private int memberNo;
  private int productNo;
  private int optionNo;
  private int quantity;
  private Product product;

  private Date createdDate;
  private ProductOption productOption;

  private CartProduct cartProduct;
  private List<Product> products;
  private List<PhotoFile> files;
  private List<Member> members;
  private List<ProductOption> options;

  @Override
  public String toString() {
    return "Cart [cartNo=" + cartNo + ", memberNo=" + memberNo + ", productNo=" + productNo
        + ", optionNo=" + optionNo + ", quantity=" + quantity + ", product=" + product
        + ", createdDate=" + createdDate + ", productOption=" + productOption + ", cartProduct="
        + cartProduct + ", products=" + products + ", files=" + files + ", members=" + members
        + ", options=" + options + "]";
  }

  public int getCartNo() {
    return cartNo; 
  }

  public void setCartNo(int cartNo) {
    this.cartNo = cartNo;
  }

  public int getMemberNo() {
    return memberNo;
  }

  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }

  public int getProductNo() {
    return productNo;
  }

  public void setProductNo(int productNo) {
    this.productNo = productNo;
  }

  public int getOptionNo() {
    return optionNo;
  }

  public void setOptionNo(int optionNo) {
    this.optionNo = optionNo;
  }

  public int getQuantity() {
    return quantity;
  }

  public void setQuantity(int quantity) {
    this.quantity = quantity;
  }

  public Product getProduct() {
    return product;
  }

  public void setProduct(Product product) {
    this.product = product;
  }

  public Date getCreatedDate() {
    return createdDate;
  }

  public void setCreatedDate(Date createdDate) {
    this.createdDate = createdDate;
  }

  public ProductOption getProductOption() {
    return productOption;
  }

  public void setProductOption(ProductOption productOption) {
    this.productOption = productOption;
  }

  public CartProduct getCartProduct() {
    return cartProduct;
  }

  public void setCartProduct(CartProduct cartProduct) {
    this.cartProduct = cartProduct;
  }

  public List<Product> getProducts() {
    return products;
  }

  public void setProducts(List<Product> products) {
    this.products = products;
  }

  public List<PhotoFile> getFiles() {
    return files;
  }

  public void setFiles(List<PhotoFile> files) {
    this.files = files;
  }

  public List<Member> getMembers() {
    return members;
  }

  public void setMembers(List<Member> members) {
    this.members = members;
  }

  public List<ProductOption> getOptions() {
    return options;
  }

  public void setOptions(List<ProductOption> options) {
    this.options = options;
  }



}
