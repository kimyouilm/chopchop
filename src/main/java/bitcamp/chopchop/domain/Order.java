package bitcamp.chopchop.domain;

import java.sql.Date;
import java.util.List;

public class Order {
  private int orderNo;
  private int memberNo;
  private String name;
  private String tel;
  private String postNo;
  private String baseAddress;
  private String detailAddress;
  private Date paymentDate;
  private String paymentMethod;
  private String shipStatus; // (주문 상태)
  private String invoice;
  private OrderProduct orderProduct;
  private Member member;

  private List<OrderProduct> orderProducts;
  private List<Member> members;

  @Override
  public String toString() {
    return "Order [orderNo=" + orderNo + ", memberNo=" + memberNo + ", name=" + name + ", tel="
        + tel + ", postNo=" + postNo + ", baseAddress=" + baseAddress + ", detailAddress="
        + detailAddress + ", paymentDate=" + paymentDate + ", paymentMethod=" + paymentMethod
        + ", shipStatus=" + shipStatus + ", invoice=" + invoice + ", orderProduct=" + orderProduct
        + ", member=" + member + ", orderProducts=" + orderProducts + ", members=" + members + "]";
  }

  public String getShipStatus() {
    return shipStatus;
  }

  public void setShipStatus(String shipStatus) {
    this.shipStatus = shipStatus;
  }

  public int getOrderNo() {
    return orderNo;
  }

  public Order setOrderNo(int orderNo) {
    this.orderNo = orderNo;
    return this;
  }

  public int getMemberNo() {
    return memberNo;
  }

  public Order setMemberNo(int memberNo) {
    this.memberNo = memberNo;
    return this;
  }

  public String getName() {
    return name;
  }

  public Order setName(String name) {
    this.name = name;
    return this;
  }

  public String getTel() {
    return tel;
  }

  public Order setTel(String tel) {
    this.tel = tel;
    return this;
  }

  public String getPostNo() {
    return postNo;
  }

  public Order setPostNo(String postNo) {
    this.postNo = postNo;
    return this;
  }

  public String getBaseAddress() {
    return baseAddress;
  }

  public Order setBaseAddress(String baseAddress) {
    this.baseAddress = baseAddress;
    return this;
  }

  public String getDetailAddress() {
    return detailAddress;
  }

  public Order setDetailAddress(String detailAddress) {
    this.detailAddress = detailAddress;
    return this;
  }

  public Date getPaymentDate() {
    return paymentDate;
  }

  public Order setPaymentDate(Date paymentDate) {
    this.paymentDate = paymentDate;
    return this;
  }

  public String getPaymentMethod() {
    return paymentMethod;
  }

  public Order setPaymentMethod(String paymentMethod) {
    this.paymentMethod = paymentMethod;
    return this;
  }

  public String getInvoice() {
    return invoice;
  }

  public Order setInvoice(String invoice) {
    this.invoice = invoice;
    return this;
  }

  public OrderProduct getOrderProduct() {
    return orderProduct;
  }

  public Order setOrderProduct(OrderProduct orderProduct) {
    this.orderProduct = orderProduct;
    return this;
  }

  public Member getMember() {
    return member;
  }

  public Order setMember(Member member) {
    this.member = member;
    return this;
  }

  public List<OrderProduct> getOrderProducts() {
    return orderProducts;
  }

  public Order setOrderProducts(List<OrderProduct> orderProducts) {
    this.orderProducts = orderProducts;
    return this;
  }

  public List<Member> getMembers() {
    return members;
  }

  public Order setMembers(List<Member> members) {
    this.members = members;
    return this;
  }
}
