package bitcamp.chopchop.domain;

public class ProductOption {
    private int optionNo;
    private int productNo;
    private String title;
    private int price;
    private int quantity;
    
    public int getOptionNo() {
        return optionNo;
    }

    public void setOptionNo(int optionNo) {
        this.optionNo = optionNo;
    }

    public int getProductNo() {
        return productNo;
    }

    public void setProductNo(int productNo) {
        this.productNo = productNo;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
    
    public int getQuantity() {
      return quantity;
    }

    public void setQuantity(int quantity) {
      this.quantity = quantity;
    }

    @Override
    public String toString() {
      return "ProductOption [optionNo=" + optionNo + ", productNo=" + productNo + ", title=" + title
          + ", price=" + price + ", quantity=" + quantity + "]";
    }

}
