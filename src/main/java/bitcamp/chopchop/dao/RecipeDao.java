package bitcamp.chopchop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import bitcamp.chopchop.domain.Recipe;

public interface RecipeDao {
  int insert(Recipe recipe) throws Exception;
  List<Recipe> findAll(Map<String,Object> param) throws Exception;
  List<Recipe> findSort(String column) throws Exception;
  Recipe findBy(int no) throws Exception;
  Recipe findWithIngredientBy(int no) throws Exception;
  Recipe findTotalBy(int no) throws Exception;
  int update(Recipe recipe) throws Exception;
  int delete(int no) throws Exception;
  int increaseViewCount(int no) throws Exception;
  List<Recipe> findByTag(String keyword) throws Exception;
  int countAll() throws Exception;
  
  int increaseScrapCount(int no) throws Exception;
  int decreaseScrapCount(int no) throws Exception;
//  int updateRecipeLike(Recipe recipe) throws Exception;
  
  List<Recipe> mainTop() throws Exception;
  List<Recipe> findAllPaging(HashMap<String, Object> param) throws Exception;
}
