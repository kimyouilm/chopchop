package bitcamp.chopchop.service.impl;

import java.util.HashMap;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import bitcamp.chopchop.dao.RecipeCommentDao;
import bitcamp.chopchop.domain.RecipeComment;
import bitcamp.chopchop.service.RecipeCommentService;

@Service
public class DefaultRecipeCommentService implements RecipeCommentService {
  @Resource private RecipeCommentDao recipeCommentDao;

  @Override
  public List<RecipeComment> list(int no, int pageNo, int pageSize) throws Exception {
    HashMap<String,Object> param = new HashMap<>();
    param.put("offset", (pageNo - 1) * pageSize);
    param.put("pageSize", pageSize);
    param.put("no", no);
    return recipeCommentDao.findAll(param);
  }

  @Override
  public RecipeComment get(int no) throws Exception {
    return recipeCommentDao.findBy(no);
  }

  @Override
  public void insert(RecipeComment recipeComment) throws Exception {
    recipeCommentDao.insert(recipeComment);
    
  }

  @Override
  public void update(RecipeComment recipeComment) throws Exception {
    recipeCommentDao.update(recipeComment);
  }

  @Override
  public void delete(int no) throws Exception {
    if (recipeCommentDao.delete(no) == 0) {
     throw new Exception("해당 데이터가 없습니다.");
    }
  }
  
  @Override
  public int size(int no) throws Exception {
    return recipeCommentDao.countAll(no);
  }

  @Override
  public List<RecipeComment> recipeCommentList(int pageNo, int pageSize) throws Exception {
    HashMap<String,Object> param = new HashMap<>();
    param.put("offset", (pageNo - 1) * pageSize);
    param.put("pageSize", pageSize);
    return recipeCommentDao.recipeCommentList(param);
  }
}
