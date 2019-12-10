package bitcamp.chopchop.service.impl;

import java.util.HashMap;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import bitcamp.chopchop.dao.CookingDao;
import bitcamp.chopchop.dao.IngredientDao;
import bitcamp.chopchop.dao.RecipeCommentDao;
import bitcamp.chopchop.dao.RecipeDao;
import bitcamp.chopchop.dao.RecipeLikeDao;
import bitcamp.chopchop.domain.Cooking;
import bitcamp.chopchop.domain.Ingredient;
import bitcamp.chopchop.domain.Recipe;
import bitcamp.chopchop.domain.RecipeLike;
import bitcamp.chopchop.service.RecipeService;

@Service
public class DefaultRecipeService implements RecipeService {
  @Resource private RecipeDao recipeDao;
  @Resource private IngredientDao ingredientDao;
  @Resource private CookingDao cookingDao;
  @Resource private RecipeLikeDao recipeLikeDao;
  @Resource private RecipeCommentDao recipeCommentDao;

  @Transactional
  @Override
  public void insert(Recipe recipe) throws Exception {
    if (recipe.getIngredients().size() == 0 || recipe.getCookings().size() == 0) {
      throw new Exception("내용을 입력해주세요");
    }

    recipeDao.insert(recipe);
    for (Ingredient ingredient : recipe.getIngredients()) {
      ingredient.setRecipeNo(recipe.getRecipeNo());
      ingredientDao.insert(ingredient);
    }

    for (Cooking cooking : recipe.getCookings()) {
      cooking.setRecipeNo(recipe.getRecipeNo());
      cookingDao.insert(cooking);
    }
  }

  @Override
  public Recipe get(int no) throws Exception {
    Recipe recipe = recipeDao.findTotalBy(no);
    if (recipe == null) {
      throw new Exception("데이터가 없습니다!");
    }
    return recipe;
  }
  
  @Override
  public void insertViewCount(int no) throws Exception {
    recipeDao.increaseViewCount(no);
  }
  

  @Override
  public List<Recipe> list(int pageNo, int pageSize) throws Exception {
    HashMap<String,Object> param = new HashMap<>();
    param.put("offset", (pageNo - 1) * pageSize);
    param.put("pageSize", pageSize);
    
    return recipeDao.findAll(param);
  }

  @Override
  public List<Recipe> listSort(String column) throws Exception {
    return recipeDao.findSort(column);
  }

  @Transactional
  @Override
  public void delete(int no) throws Exception {
    if (recipeDao.findBy(no) == null) {
      throw new Exception("데이터가 없습니다.");
    }
    recipeCommentDao.deleteAll(no);
    recipeLikeDao.deleteAll(no);
    cookingDao.deleteAll(no);
    ingredientDao.deleteAll(no);
    recipeDao.delete(no);
  }
  
  @Override
  public int size() throws Exception {
    return recipeDao.countAll();
  }

  @Override
  public List<Recipe> search(String keyword) throws Exception {
    return recipeDao.findByTag(keyword);
  }

  @Transactional
  @Override
  public void update(Recipe recipe) throws Exception {

    recipeDao.update(recipe);

    if (recipe.getIngredients().size() > 0) {
      ingredientDao.deleteAll(recipe.getRecipeNo());
      for (Ingredient i : recipe.getIngredients()) {
        i.setRecipeNo(recipe.getRecipeNo());
        ingredientDao.insert(i);
      }
    }

    for (Cooking cooking : recipe.getCookings()) {
      if (cooking.getFilePath() == null) {
        cookingDao.update(cooking);
      } else {
        cooking.setRecipeNo(recipe.getRecipeNo());
        cookingDao.insert(cooking);
      }
    }
  }
  
  @Override
  public void deleteFile(int[] fileNo, int no) throws Exception {
    HashMap<String,Object> hashMap = new HashMap<>();
    hashMap.put("fileNo", fileNo);
    hashMap.put("recipeNo", no);
    cookingDao.delete(hashMap);
  }

  @Transactional
  @Override
  public void insertLike(RecipeLike recipeLike) throws Exception {
    recipeDao.increaseScrapCount(recipeLike.getRecipeNo());
    System.out.println("좋아요 올라감");
    recipeLikeDao.insertLike(recipeLike);
  }

  @Override
  public void deleteLike(RecipeLike recipeLike) throws Exception {
    recipeDao.decreaseScrapCount(recipeLike.getRecipeNo());
    System.out.println("좋아요 내려감");
    recipeLikeDao.deleteLike(recipeLike);
  }

  @Override
  public int findLike(RecipeLike recipeLike) throws Exception {
    return recipeLikeDao.findLike(recipeLike);
  }
  
  @Override
  public List<RecipeLike> listLike() throws Exception {
    return recipeLikeDao.findAll();
  }

  @Override
  public List<Recipe> mainTop() throws Exception {
    return recipeDao.mainTop();
    
  }

  @Override
  public List<Recipe> pagingList(int pageNo, int pageSize) throws Exception {
    HashMap<String,Object> param = new HashMap<>();
    param.put("offset", (pageNo - 1) * pageSize);
    param.put("pageSize", pageSize);
    return recipeDao.findAllPaging(param);
  }

}
