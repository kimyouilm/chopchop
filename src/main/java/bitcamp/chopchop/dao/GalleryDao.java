package bitcamp.chopchop.dao;

import java.util.List;
import bitcamp.chopchop.domain.Gallery;

public interface GalleryDao {
  int insert(Gallery gallery) throws Exception;
  List<Gallery> findAll() throws Exception;
  Gallery findBy(int no) throws Exception;
  Gallery findWithPhotosBy(int no) throws Exception;
  int update(Gallery gallery) throws Exception;
  int delete(int no) throws Exception;
  int increaseViewCount(int no) throws Exception;
  
}
