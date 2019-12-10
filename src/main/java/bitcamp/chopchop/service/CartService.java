package bitcamp.chopchop.service;

import java.util.List;
import org.springframework.stereotype.Service;
import bitcamp.chopchop.domain.Cart;
import bitcamp.chopchop.domain.ProductOption;

@Service
public interface CartService {
  List<Cart> list() throws Exception;
  List<Cart> search(int keyword) throws Exception;
  Cart get(int no) throws Exception;
  void insert(Cart cart) throws Exception;
  void update(Cart cart) throws Exception;
  void delete(int no) throws Exception;
  ProductOption getOption(int no) throws Exception;
}
