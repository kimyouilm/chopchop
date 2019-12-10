package bitcamp.chopchop.service;

import java.util.List;
import bitcamp.chopchop.domain.Recipe;
import bitcamp.chopchop.domain.RecipeLike;

public interface RecipeService {
  List<Recipe> list(int pageNo, int pageSize) throws Exception; // 전체 조회
  List<Recipe> listSort(String column) throws Exception; // 정렬해서 조회
  
  Recipe get(int no) throws Exception;
  void insertViewCount(int no) throws Exception;
  void insert(Recipe recipe) throws Exception;
  void update(Recipe recipe) throws Exception;
  void deleteFile(int[] fileNo, int no) throws Exception;
  void delete(int no) throws Exception;
  List<Recipe> search(String keyword) throws Exception;
  int size() throws Exception;
  
  void insertLike(RecipeLike recipeLike) throws Exception; // 좋아요 
  void deleteLike(RecipeLike recipeLike) throws Exception; // 좋아요 취소
  int findLike(RecipeLike recipeLike) throws Exception; // 좋아요 했는지 확인 
  
  List<Recipe> mainTop() throws Exception;
  List<RecipeLike> listLike() throws Exception;
  List<Recipe> pagingList(int pageNo, int pageSize) throws Exception;
}

