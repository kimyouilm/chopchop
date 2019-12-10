package bitcamp.chopchop.service;

import java.util.List;
import bitcamp.chopchop.domain.Order;
import bitcamp.chopchop.domain.OrderProduct;

public interface OrderService {
  
  List<Order> list(int pageNo, int pageSize) throws Exception;
//  List<Order> searchByMember(int no) throws Exception;
  Order get(int no) throws Exception;
  void insert(Order order) throws Exception;
  void insert(OrderProduct orderProduct, Order order) throws Exception;
  void update(Order order) throws Exception;
  void delete(int no) throws Exception;
  OrderProduct getOrderProduct(int no) throws Exception;
  List<OrderProduct> searchByMember(int no) throws Exception;
  void updateStatus(Order order) throws Exception;
  int size() throws Exception;
}
