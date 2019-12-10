package bitcamp.chopchop.web.json;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.domain.RecipeComment;
import bitcamp.chopchop.service.MemberService;
import bitcamp.chopchop.service.RecipeCommentService;

@RestController("json.RecipeCommentController")
@RequestMapping("/json/recipecomment")
@SessionAttributes("loginUser")
public class RecipeCommentController {
  @Resource private RecipeCommentService recipeCommentService;
  @Resource private MemberService memberService;

  @PostMapping("add")
  public JsonResult add(RecipeComment recipeComment, int no, @ModelAttribute("loginUser") Member loginUser) throws Exception {
    try {
      Member member = memberService.get(loginUser.getMemberNo());
      recipeComment.setMemberNo(member.getMemberNo());
      recipeComment.setRecipeNo(no);
      recipeCommentService.insert(recipeComment);

      return new JsonResult().setState(JsonResult.SUCCESS);
    } catch (Exception e) {
      return new JsonResult().setState(JsonResult.FAILURE).setMessage(e.getMessage());
    }
  }

  @GetMapping("delete")
  public JsonResult delete(int no) throws Exception {
    try {
      recipeCommentService.delete(no);
      return new JsonResult().setState(JsonResult.SUCCESS);
    } catch (Exception e) {
      return new JsonResult().setState(JsonResult.FAILURE).setMessage(e.getMessage());
    }
  }

  @GetMapping("detail")
  public JsonResult detail(int no) throws Exception {
    try {
      RecipeComment recipeComment = recipeCommentService.get(no);
      return new JsonResult().setState(JsonResult.SUCCESS).setResult(recipeComment);
    } catch (Exception e) {
      return new JsonResult().setState(JsonResult.FAILURE).setMessage(e.getMessage());
    }
  }

  @GetMapping("list")
  public JsonResult list(@RequestParam(defaultValue = "1") int pageNo,
                         @RequestParam(defaultValue = "4") int pageSize, // 한페이지에 들어갈 댓글 갯수
                         int no, @ModelAttribute("loginUser") Member loginUser) throws Exception {
    if (pageSize < 4 || pageSize > 10) { 
      pageSize = 4;
    }
    int size = recipeCommentService.size(no);
    int totalPage = size / pageSize;
    if (size % pageSize > 0) {
      totalPage++;
    }
    if (pageNo < 1 || pageNo > totalPage) {
      pageNo = 1;
    }
    
    try {
      List<RecipeComment> originRecipeComments = recipeCommentService.list(no, pageNo, pageSize);
      List<HashMap<String,Object>> recipeComments = new ArrayList<>(); 
      Member viewer = memberService.get(loginUser.getMemberNo());
      
      HashMap<String,Object> result = new HashMap<>();
      
      for (int i = 0; i < originRecipeComments.size(); i++) {
        HashMap<String,Object> hashMap = new HashMap<>();
        Member member = memberService.get(originRecipeComments.get(i).getMemberNo()); 
        hashMap.put("member", member);
        hashMap.put("recipeComment", originRecipeComments.get(i));
        hashMap.put("viewer", viewer);
        recipeComments.add(hashMap);
      }
      
      result.put("recipeComments", recipeComments);
      result.put("pageNo", pageNo);
      result.put("pageSize", pageSize);
      result.put("totalPage", totalPage);
      result.put("size", size);
      result.put("beginPage", (pageNo - 1) > 0 ? (pageNo - 1) : 1);
      result.put("endPage", (pageNo + 1) < totalPage ? (pageNo + 1) : totalPage);

      return new JsonResult().setState(JsonResult.SUCCESS).setResult(result);
    } catch (Exception e) {
      return new JsonResult().setState(JsonResult.FAILURE).setMessage(e.getMessage());
    }
  }

  @PostMapping("update")
  public JsonResult update(RecipeComment recipeComment) throws Exception {
    try {
      recipeCommentService.update(recipeComment);
      return new JsonResult().setState(JsonResult.SUCCESS);
    } catch (Exception e) {
      return new JsonResult().setState(JsonResult.FAILURE).setMessage(e.getMessage());
    }
  }

}