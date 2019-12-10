package bitcamp.chopchop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import bitcamp.chopchop.domain.RecipeComment;

public interface RecipeCommentDao {
  List<RecipeComment> findAll(Map<String,Object> param) throws Exception;
  RecipeComment findBy(int no) throws Exception;
  int insert(RecipeComment recipeComment) throws Exception;
  int update(RecipeComment recipeComment) throws Exception;
  int delete(int no) throws Exception;
  int deleteAll(int no) throws Exception;
  int countAll(int no) throws Exception;
  List<RecipeComment> recipeCommentList(HashMap<String,Object> param) throws Exception;
}
