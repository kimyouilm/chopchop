package bitcamp.chopchop.service.impl;

import java.util.HashMap;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import bitcamp.chopchop.dao.CartDao;
import bitcamp.chopchop.dao.CommentDao;
import bitcamp.chopchop.dao.PhotoFileDao;
import bitcamp.chopchop.dao.ProductDao;
import bitcamp.chopchop.dao.ProductOptionDao;
import bitcamp.chopchop.domain.PhotoFile;
import bitcamp.chopchop.domain.Product;
import bitcamp.chopchop.service.ProductService;

// ProductService 기본 구현체 
//
@Service
public class DefaultProductService implements ProductService {

  @Resource
  private ProductDao productDao;
  @Resource
  private PhotoFileDao photoFileDao;
  @Resource
  private CommentDao commentDao;
  @Resource
  private ProductOptionDao productOptionDao;
  @Resource
  private CartDao cartDao;

  @Transactional
  @Override
  public void insert(Product product) throws Exception {

    if(product.getFiles().size() == 0) {
      throw new Exception("사진 파일이 없습니다.");
    }

    productDao.insert(product);
    for (PhotoFile file : product.getFiles()) {
      file.setProductNo(product.getProductNo());
      photoFileDao.insert(file);
    }
  }
  
  @Transactional
  @Override
  public void delete(int no) throws Exception {
    if (productDao.findBy(no) == null) {
      throw new Exception("해당 데이터가 없습니다.");
    }
    
    cartDao.deleteAll(no);
    productOptionDao.deleteAll(no);
    commentDao.deleteAll(no);
    photoFileDao.deleteAll(no);
    productDao.delete(no);
  }

  @Override
  public Product get(int no) throws Exception {
    Product product = productDao.findWithFilesBy(no);
    if (product == null) {
      throw new Exception("해당 번호의 데이터가 없습니다!");
    }
    productDao.increaseViewCount(no);
    return product;
  }

  @Override
  public List<Product> list() throws Exception {
    return productDao.findAll();
  }
  
  @Transactional
  @Override
  public void update(Product product) throws Exception {
    productDao.update(product);
    
    if(product.getFiles().size() > 0) {
      photoFileDao.deleteAll(product.getProductNo());
      for (PhotoFile file : product.getFiles()) {
        file.setProductNo(product.getProductNo());
        photoFileDao.insert(file);
      }
    }
  }
  
  @Override
  public List<Product> categorySearch(String species) throws Exception {
    return productDao.findCategory(species);
  }

  @Override
  public List<Product> search(String keyword) throws Exception {
    return productDao.findByKeyword(keyword);
  }

  @Override
  public List<Product> mainTop() throws Exception {
    return productDao.mainTop();
  }

  @Override
  public int size() throws Exception {
    return productDao.size();
  }

  @Override
  public List<Product> pagingList(int pageNo, int pageSize) throws Exception {
    HashMap<String,Object> param = new HashMap<>();
    param.put("offset", (pageNo - 1) * pageSize);
    param.put("pageSize", pageSize);
    return productDao.findAllPaging(param);
  }
  
}
