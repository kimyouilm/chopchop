package bitcamp.chopchop.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import bitcamp.chopchop.dao.CartDao;
import bitcamp.chopchop.dao.ProductOptionDao;
import bitcamp.chopchop.domain.Cart;
import bitcamp.chopchop.domain.ProductOption;
import bitcamp.chopchop.service.CartService;

@Service
public class DefaultCartService implements CartService {

  @Resource
  private CartDao cartDao;
  @Resource
  private ProductOptionDao productOptionDao;

  @Override
  public void insert(Cart cart) throws Exception {
    cartDao.insert(cart);
  }
  
  @Override
  public void delete(int no) throws Exception {
    if (cartDao.delete(no) == 0) {
      throw new Exception("해당 데이터가 없습니다.");
    }
  }

  @Override
  public Cart get(int no) throws Exception {
    Cart cart = cartDao.findBy(no);
    if (cart == null) {
      throw new Exception("해당 번호의 데이터가 없습니다!");
    } 
    return cart;
  }

  @Override
  public List<Cart> list() throws Exception {
    return cartDao.findAll();
  }
  
  @Override
  public void update(Cart cart) throws Exception {
    cartDao.update(cart);
  }

   @Override
  public List<Cart> search(int keyword) throws Exception {
    return cartDao.findByKeyword(keyword);
  }

   @Override
  public ProductOption getOption(int no) throws Exception {
    return productOptionDao.findBy(no);
  }
   
}

















