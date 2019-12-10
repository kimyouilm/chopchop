package bitcamp.chopchop.dao;

import java.util.List;
import bitcamp.chopchop.domain.RecipeLike;

public interface RecipeLikeDao {
  int insertLike(RecipeLike recipeLike) throws Exception;
  int findLike(RecipeLike recipeLike) throws Exception;
  void deleteLike(RecipeLike recipeLike) throws Exception;
  int deleteAll(int no) throws Exception;
  List<RecipeLike> findAll() throws Exception;
}
