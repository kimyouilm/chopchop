package bitcamp.chopchop.service;

import java.util.List;
import bitcamp.chopchop.domain.Comment;

// 역할:
// => 게시물 관리 업무를 수행
// => 트랜잭션 제어
// => 여러 페이지 컨트롤러가 사용한다.
public interface CommentService {
  List<Comment> list() throws Exception;
  Comment get(int no) throws Exception;
  void insert(Comment comment) throws Exception;
  void update(Comment comment) throws Exception;
  void commentDelete(int no) throws Exception;
  List<Comment> findByProductWith(int no) throws Exception;
  void commentAnswer(Comment comment) throws Exception;
}
