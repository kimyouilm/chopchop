package bitcamp.chopchop.dao;

import java.util.List;
import bitcamp.chopchop.domain.ProductOption;;

public interface ProductOptionDao {
  int insert(ProductOption productOption) throws Exception; // 옵션 등록
  List<ProductOption> findAll() throws Exception; // 등록된 옵션 모두 찾기
  List<ProductOption> findWithProduct(int no) throws Exception; // 상품에 딸린 옵션 모두 찾기
  ProductOption findBy(int no) throws Exception; // 옵션 하나만 찾기
  int update(ProductOption productOption) throws Exception;
  int delete(int no) throws Exception; // 해당 옵션만 삭제
  int deleteAll(int no) throws Exception; // 상품에 딸린 옵션 모두 삭제
}
