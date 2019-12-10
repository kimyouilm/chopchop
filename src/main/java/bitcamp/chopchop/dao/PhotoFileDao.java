package bitcamp.chopchop.dao;

import java.util.List;
import bitcamp.chopchop.domain.PhotoFile;

public interface PhotoFileDao {
  int insert(PhotoFile photoFile) throws Exception;
  List<PhotoFile> findAll(int productNo) throws Exception;
  int deleteAll(int productNo) throws Exception;
}
