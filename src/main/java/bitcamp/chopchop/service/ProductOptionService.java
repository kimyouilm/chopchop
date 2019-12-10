package bitcamp.chopchop.service;

import java.util.List;
import bitcamp.chopchop.domain.ProductOption;

public interface ProductOptionService {
  ProductOption get(int no) throws Exception;
  void insert(ProductOption productOption) throws Exception;
  void update(ProductOption productOption)  throws Exception;
  List<ProductOption> list() throws Exception;
  List<ProductOption> searchByProduct(int no) throws Exception;
  void delete(int no) throws Exception;
  void deleteAll(int no) throws Exception;
}
