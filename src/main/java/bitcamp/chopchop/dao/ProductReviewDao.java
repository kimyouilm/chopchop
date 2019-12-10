package bitcamp.chopchop.dao;

import java.util.HashMap;
import java.util.List;
import bitcamp.chopchop.domain.ProductReview;

public interface ProductReviewDao {
  int insert(ProductReview productReview) throws Exception;
  List<ProductReview> findAll(int no) throws Exception;
  List<ProductReview> findByProductReview(int no) throws Exception;
  ProductReview findBy(int no) throws Exception;
  int update(ProductReview productReview) throws Exception;
  int deleteAll(int no) throws Exception;
  int delete(int no) throws Exception;
  
  //==================================================================
  List<ProductReview> myreview(int no) throws Exception;
  int size() throws Exception;
  List<ProductReview> storeReview(HashMap<String,Object> param) throws Exception;
}
