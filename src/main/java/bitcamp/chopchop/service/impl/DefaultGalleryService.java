package bitcamp.chopchop.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import bitcamp.chopchop.dao.GalleryDao;
import bitcamp.chopchop.dao.GalleryPhotoDao;
import bitcamp.chopchop.domain.Gallery;
import bitcamp.chopchop.domain.GalleryPhoto;
import bitcamp.chopchop.service.GalleryService;

@Service
public class DefaultGalleryService implements GalleryService {
  @Resource private GalleryDao galleryDao;
  @Resource private GalleryPhotoDao galleryPhotoDao;
  @Override
  public List<Gallery> list() throws Exception {
    return galleryDao.findAll();
  }
  @Override
  public Gallery get(int no) throws Exception {
    Gallery gallery = galleryDao.findWithPhotosBy(no);
    if (gallery == null) {
      throw new Exception("해당 번호의 데이터가 없습니다.!");
    }
    galleryDao.increaseViewCount(no);
    return gallery;
  }
  @Override
  public void insert(Gallery gallery) throws Exception {
    if (gallery.getGalleryPhotos().size() == 0) {
      throw new Exception("사진 파일 없음!");
    }
    galleryDao.insert(gallery);
    for (GalleryPhoto galleryPhoto : gallery.getGalleryPhotos()) {
      galleryPhoto.setGalleryNo(gallery.getGalleryNo());
      galleryPhotoDao.insert(galleryPhoto);
    }
  }
  @Override
  public void update(Gallery gallery) throws Exception {
    if (gallery.getGalleryPhotos().size() == 0) {
      throw new Exception("사진 파일 없음!");
    }
    galleryDao.update(gallery);
    galleryPhotoDao.deleteAll(gallery.getGalleryNo());
    for (GalleryPhoto galleryPhoto : gallery.getGalleryPhotos()) {
      galleryPhoto.setGalleryNo(gallery.getGalleryNo());
      galleryPhotoDao.insert(galleryPhoto);
    }
  }
  @Override
  public void delete(int no) throws Exception {
    if (galleryDao.findBy(no) == null) {
      throw new Exception("해당 데이터가 없습니다.");
    }
    galleryPhotoDao.deleteAll(no);
    galleryDao.delete(no);
  }
  
}
