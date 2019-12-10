package bitcamp.chopchop.service;

import java.util.List;
import bitcamp.chopchop.domain.RecipeComment;

public interface RecipeCommentService {
  List<RecipeComment> list(int no, int pageNo, int pageSize) throws Exception;
  RecipeComment get(int no) throws Exception;
  void insert(RecipeComment recipeComment) throws Exception;
  void update(RecipeComment recipeComment) throws Exception;
  void delete(int no) throws Exception;
  int size(int no) throws Exception;
  List<RecipeComment> recipeCommentList (int pageNo, int pageSize) throws Exception;
}
