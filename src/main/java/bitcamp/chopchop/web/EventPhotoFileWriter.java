package bitcamp.chopchop.web;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import bitcamp.chopchop.domain.EventPhotoFile;

@Component
public class EventPhotoFileWriter {

  String uploadDir;
  public EventPhotoFileWriter(ServletContext sc) {
    this.uploadDir = sc.getRealPath("/upload/event");
  }

  public List<EventPhotoFile> getEventPhotoFiles(MultipartFile[] filePath) throws Exception {

    List<EventPhotoFile> eventPhotoFiles = new ArrayList<>();

    for (MultipartFile part : filePath) {
      if (part.getSize() == 0) {
        continue;
      }
      // 클라이언트가 보낸 파일을 디스크에 저장한다.
      String filename = UUID.randomUUID().toString();
      part.transferTo(new File((uploadDir + "/" + filename)));

      // 저장한 파일명을 PhotoFile 에 보관한다.
      EventPhotoFile eventPhotoFile = new EventPhotoFile();
      eventPhotoFile.setFilePath(filename);
      eventPhotoFiles.add(eventPhotoFile);
    }
    return eventPhotoFiles;
  }
}
