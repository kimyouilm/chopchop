package bitcamp.chopchop.domain;

public class PhotoFile {
  int photoFileNo;
  String filePath;
  int productNo;

  @Override
  public String toString() {
    return "PhotoFile [photoFileNo=" + photoFileNo + ", filePath=" + filePath + ", productNo="
        + productNo + "]";
  }

  public int getPhotoFileNo() {
    return photoFileNo;
  }

  public void setPhotoFileNo(int photoFileNo) {
    this.photoFileNo = photoFileNo;
  }

  public String getFilePath() {
    return filePath;
  }

  public void setFilePath(String filePath) {
    this.filePath = filePath;
  }

  public int getProductNo() {
    return productNo;
  }

  public void setProductNo(int productNo) {
    this.productNo = productNo;
  }
}
