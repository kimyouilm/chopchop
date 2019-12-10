package bitcamp.chopchop.domain;

public class EventPhotoFile {
  int photoNo;
  int eventNo;
  String filePath;

  public int getPhotoNo() {
    return photoNo;
  }

  public void setPhotoNo(int photoNo) {
    this.photoNo = photoNo;
  }

  public int getEventNo() {
    return eventNo;
  }

  public void setEventNo(int eventNo) {
    this.eventNo = eventNo;
  }

  public String getFilePath() {
    return filePath;
  }

  public void setFilePath(String filePath) {
    this.filePath = filePath;
  }

  @Override
  public String toString() {
    return "EventPhotoFile [eventNo=" + eventNo + ", filePath=" + filePath + ", photoNo=" + photoNo + "]";
  }
  
}
