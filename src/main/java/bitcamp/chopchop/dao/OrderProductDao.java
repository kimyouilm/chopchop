package bitcamp.chopchop.dao;

import java.util.List;
import bitcamp.chopchop.domain.OrderProduct;

public interface OrderProductDao {
  void insert(OrderProduct orderProduct) throws Exception; // 최종 주문건
  void update(OrderProduct orderProduct) throws Exception; // 주소지, 수령인 변경 등
  void delete(int no) throws Exception; // 주문 취소
  OrderProduct findByOrderWith(int no) throws Exception;
  List<OrderProduct> findByMemberWith(int no) throws Exception;
}