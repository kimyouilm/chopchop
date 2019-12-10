package bitcamp.chopchop.web;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import bitcamp.chopchop.domain.Cooking;

@Component
public class CookingFileWriter {

  String uploadDir;

  public CookingFileWriter(ServletContext sc) {
    uploadDir = sc.getRealPath("/upload/recipe");
  }

  public List<Cooking> getCookings(MultipartFile[] filePath2, int[] processNo, String[] cookingContent) throws Exception {

    List<Cooking> cookings = new ArrayList<>();
    for (int i = 0; i < processNo.length; i++) {
      Cooking cooking = new Cooking();
      if (filePath2[i].isEmpty())
        continue;
      String filename = UUID.randomUUID().toString();
      cooking.setFilePath(filename);
      filePath2[i].transferTo(new File(uploadDir + "/" + filename));

      cooking.setProcessNo(processNo[i]);
      cooking.setContent(cookingContent[i]);

      cookings.add(cooking);
    }
    return cookings;
  }
}
