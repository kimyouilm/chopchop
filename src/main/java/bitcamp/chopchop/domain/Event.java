package bitcamp.chopchop.domain;

import java.sql.Date;
import java.util.List;

public class Event {
  private int eventNo;
  private String title;
  private String content;
  private String startDate;
  private String endDate;
  private Date createdDate;
  private int viewCount;

  private List<EventPhotoFile> files;

  public int getEventNo() {
    return eventNo;
  }

  public void setEventNo(int eventNo) {
    this.eventNo = eventNo;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public String getStartDate() {
    return startDate;
  }

  public void setStartDate(String startDate) {
    this.startDate = startDate;
  }

  public String getEndDate() {
    return endDate;
  }

  public void setEndDate(String endDate) {
    this.endDate = endDate;
  }

  public Date getCreatedDate() {
    return createdDate;
  }

  public void setCreatedDate(Date createdDate) {
    this.createdDate = createdDate;
  }

  public int getViewCount() {
    return viewCount;
  }

  public void setViewCount(int viewCount) {
    this.viewCount = viewCount;
  }
  
    public List<EventPhotoFile> getFiles() {
      return files;
    }
  
    public void setFiles(List<EventPhotoFile> files) {
      this.files = files;
    }

  @Override
  public String toString() {
    return "Event [content=" + content + ", createdDate=" + createdDate + ", endDate=" + endDate + ", eventNo="
        + eventNo + ", files=" + files + ", startDate=" + startDate + ", title=" + title + ", viewCount=" + viewCount
        + "]";
  }
  
}
