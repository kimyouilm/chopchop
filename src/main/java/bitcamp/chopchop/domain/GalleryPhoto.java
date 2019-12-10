package bitcamp.chopchop.domain;

import java.io.Serializable;

public class GalleryPhoto implements Serializable {
  private static final long serialVersionUID = 1L;
  
  private int photoNo;
  private int galleryNo;
  private String filePath;
  
  @Override
  public String toString() {
    return "GalleryPhoto [photoNo=" + photoNo + ", galleryNo=" + galleryNo + ", filePath="
        + filePath + "]";
  }

  public int getPhotoNo() {
    return photoNo;
  }

  public void setPhotoNo(int photoNo) {
    this.photoNo = photoNo;
  }

  public int getGalleryNo() {
    return galleryNo;
  }

  public void setGalleryNo(int galleryNo) {
    this.galleryNo = galleryNo;
  }

  public String getFilePath() {
    return filePath;
  }

  public void setFilePath(String filePath) {
    this.filePath = filePath;
  }
  
}
