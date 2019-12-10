package bitcamp.chopchop.service;

import java.util.List;
import bitcamp.chopchop.domain.Product;

// 역할:
// => 게시물 관리 업무를 수행
// => 트랜잭션 제어
// => 여러 페이지 컨트롤러가 사용한다.
//
public interface ProductService {
  List<Product> list() throws Exception;
  List<Product> search(String keyword) throws Exception;
  List<Product> categorySearch(String species) throws Exception;
  Product get(int no) throws Exception;
  void insert(Product product) throws Exception;
  void update(Product product) throws Exception;
  void delete(int no) throws Exception;
  
  List<Product> mainTop() throws Exception;
  int size() throws Exception;
  List<Product> pagingList(int pageNo, int pageSize) throws Exception;
}


