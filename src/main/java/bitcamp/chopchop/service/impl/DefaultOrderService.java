package bitcamp.chopchop.service.impl;

import java.util.HashMap;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import bitcamp.chopchop.dao.OrderDao;
import bitcamp.chopchop.dao.OrderProductDao;
import bitcamp.chopchop.domain.Order;
import bitcamp.chopchop.domain.OrderProduct;
import bitcamp.chopchop.service.OrderService;

@Service
public class DefaultOrderService implements OrderService {

  @Resource
  OrderDao orderDao;
  @Resource
  OrderProductDao orderProductDao;

  @Override
  public Order get(int no) throws Exception {
    Order order = orderDao.findBy(no);
    if (order == null) {
      throw new Exception("해당 주문 데이터가 없습니다.");
    }
    return order;
  }
  
  @Override
  public OrderProduct getOrderProduct(int no) throws Exception {
    return orderProductDao.findByOrderWith(no);
  }
  
  @Transactional
  @Override
  public void insert(Order order) throws Exception {
    // 주문 정보는 서버에서 처리하고, 회원정보는 로그인 정보 세션에서 가져옴
    orderDao.insert(order);
    
  }

  @Transactional
  @Override
  public void insert(OrderProduct orderProduct, Order order) throws Exception {
    orderProduct.setOrderNo(order.getOrderNo());
    orderProductDao.insert(orderProduct);
  }
  
  @Override
  public void update(Order order) throws Exception {
    orderDao.update(order);
  }

  @Override
  public void delete(int no) throws Exception {
    orderProductDao.delete(no);
    orderDao.delete(no);
  }
  
  @Override
  public List<OrderProduct> searchByMember(int no) throws Exception {
    return orderProductDao.findByMemberWith(no);
  }
  
  @Override
  public void updateStatus(Order order) throws Exception {
    orderDao.statusUpdate(order);
  }

  @Override
  public List<Order> list(int pageNo, int pageSize) throws Exception {
    HashMap<String,Object> param = new HashMap<>();
    param.put("offset", (pageNo - 1) * pageSize);
    param.put("pageSize", pageSize);
    return orderDao.findAll(param);
  }
  
  @Override
  public int size() throws Exception {
    return orderDao.countAll();
  }
  
  
  
  
}
