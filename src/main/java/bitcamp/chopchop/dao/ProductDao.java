package bitcamp.chopchop.dao;

import java.util.HashMap;
import java.util.List;
import bitcamp.chopchop.domain.Product;

public interface ProductDao {
  int insert(Product product) throws Exception;
  List<Product> findAll() throws Exception;
  List<Product> findByKeyword(String species) throws Exception;
  Product findBy(int no) throws Exception;
  Product findWithFilesBy(int no) throws Exception;
  int increaseViewCount(int no) throws Exception;
  int update(Product product) throws Exception;
  int delete(int no) throws Exception;
  List<Product> findCategory(String species) throws Exception;
  
  //==================================================================
  List<Product> mainTop() throws Exception;
  int size() throws Exception;
  List<Product> findAllPaging(HashMap<String, Object> param) throws Exception;
}
