package bitcamp.chopchop.service;

import java.util.List;
import bitcamp.chopchop.domain.ProductReview;

public interface ProductReviewService {
  List<ProductReview> list(int no) throws Exception;
  ProductReview get(int no) throws Exception;
  void insert(ProductReview productReview) throws Exception;
  void update(ProductReview productReview) throws Exception;
  void delete(int no) throws Exception;
  List<ProductReview> myreview(int no) throws Exception;
  List<ProductReview> storeReview(int pageNo, int pageSize) throws Exception;
  int size() throws Exception;
  
}
