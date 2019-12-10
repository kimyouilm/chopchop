package bitcamp.chopchop.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import bitcamp.chopchop.dao.CommentDao;
import bitcamp.chopchop.domain.Comment;
import bitcamp.chopchop.service.CommentService;

@Service
public class DefaultCommentService implements CommentService {

  @Resource
  private CommentDao commentDao;

  @Override
  public void insert(Comment comment) throws Exception {
    commentDao.insert(comment);
  }
  
  @Override
  public void commentDelete(int no) throws Exception {
    if (commentDao.commentDelete(no) == 0) {
      throw new Exception("해당 데이터가 없습니다.");
    }
  }

  @Override
  public Comment get(int no) throws Exception {
    Comment comment = commentDao.findBy(no);
    if (comment == null) {
      throw new Exception("해당 번호의 데이터가 없습니다!");
    } 
    return comment;
  }

  @Override
  public List<Comment> list() throws Exception {
    return commentDao.findAll();
  }
  
  @Override
  public void update(Comment comment) throws Exception {
    commentDao.update(comment);
  }

  @Override
  public List<Comment> findByProductWith(int no) throws Exception {
    return commentDao.findByProductWith(no);
  }
  
  @Override
  public void commentAnswer(Comment comment) throws Exception {
    commentDao.insertAnswer(comment);
  }
}

















