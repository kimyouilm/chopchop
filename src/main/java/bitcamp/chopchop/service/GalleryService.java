package bitcamp.chopchop.service;

import java.util.List;
import bitcamp.chopchop.domain.Gallery;

public interface GalleryService {
  List<Gallery> list() throws Exception;
  Gallery get(int no) throws Exception;
  void insert(Gallery gallery) throws Exception;
  void update(Gallery gallery) throws Exception;
  void delete(int no) throws Exception;
}
