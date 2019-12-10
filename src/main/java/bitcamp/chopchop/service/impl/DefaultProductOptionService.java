package bitcamp.chopchop.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import bitcamp.chopchop.dao.ProductOptionDao;
import bitcamp.chopchop.domain.ProductOption;
import bitcamp.chopchop.service.ProductOptionService;

@Service
public class DefaultProductOptionService implements ProductOptionService {
  
  @Resource
  private ProductOptionDao productOptionDao;
  
  @Override
  public ProductOption get(int no) throws Exception {
    return productOptionDao.findBy(no);
  }

  @Override
  public void insert(ProductOption productOption) throws Exception {
    productOptionDao.insert(productOption);
  }

  @Override
  public void update(ProductOption productOption) throws Exception {
    productOptionDao.update(productOption);
  }

  @Override
  public List<ProductOption> list() throws Exception {
    return productOptionDao.findAll();
  }

  @Override
  public List<ProductOption> searchByProduct(int no) throws Exception {
    return productOptionDao.findWithProduct(no);
  }

  @Override
  public void delete(int no) throws Exception {
    productOptionDao.delete(no);
  }

  @Override
  public void deleteAll(int no) throws Exception {
    productOptionDao.deleteAll(no);
  }

}
