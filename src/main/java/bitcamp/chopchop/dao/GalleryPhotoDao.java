package bitcamp.chopchop.dao;

import java.util.List;
import bitcamp.chopchop.domain.GalleryPhoto;

public interface GalleryPhotoDao {
  int insert(GalleryPhoto galleryPhoto) throws Exception;
  List<GalleryPhoto> findAll(int galleryNo) throws Exception;
  int deleteAll(int galleryNo) throws Exception;
}
