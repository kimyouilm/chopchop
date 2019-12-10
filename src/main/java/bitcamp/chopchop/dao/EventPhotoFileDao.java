package bitcamp.chopchop.dao;

import java.util.List;
import bitcamp.chopchop.domain.EventPhotoFile;

public interface EventPhotoFileDao {
  int insert(EventPhotoFile eventPhotoFile) throws Exception;
  List<EventPhotoFile> findAll(int eventNo) throws Exception;
  int deleteAll(int eventNo) throws Exception;
}
