package bitcamp.chopchop.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.domain.RecipeComment;
import bitcamp.chopchop.service.MemberService;
import bitcamp.chopchop.service.RecipeCommentService;

@Controller
@RequestMapping("/recipecomment")
@SessionAttributes("loginUser")
public class RecipeCommentController {
  @Resource private RecipeCommentService recipeCommentService;
  @Resource private MemberService memberService;
  
  @GetMapping("form")
  public void form() {
  }
  
  @GetMapping("updateform")
  public void updateform(Model model, int no) throws Exception {
    RecipeComment recipeComment = recipeCommentService.get(no);
    model.addAttribute("recipeComment", recipeComment);
  }
  
  @PostMapping("add")
  public String add(RecipeComment recipeComment, int no, @ModelAttribute("loginUser") Member loginUser) throws Exception {
    Member member = memberService.get(loginUser.getMemberNo());
    recipeComment.setMemberNo(member.getMemberNo());
    recipeComment.setRecipeNo(no);
    
    recipeCommentService.insert(recipeComment);
    return "redirect:/app/recipe/list";
  }
  
  @GetMapping("delete")
  public String delete(int no) throws Exception {
    recipeCommentService.delete(no);
    return "redirect:/app/recipe/list";
  }
  
  @GetMapping("detail")
  public void detail(Model model, int no) throws Exception {
    RecipeComment recipeComment = recipeCommentService.get(no);
    model.addAttribute("recipeComment", recipeComment);
  }
  
  @GetMapping("list")
  public void list(@RequestParam(defaultValue = "1") int pageNo,
      @RequestParam(defaultValue = "4") int pageSize, 
      int no, Model model, @ModelAttribute("loginUser") Member loginUser) throws Exception {

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
    List<RecipeComment> originRecipeComments = recipeCommentService.list(no, pageNo, pageSize);
    List<HashMap<String,Object>> recipeComments = new ArrayList<>(); 
    Member viewer = memberService.get(loginUser.getMemberNo());
    
    for (int i = 0; i < originRecipeComments.size(); i++) {
      HashMap<String,Object> hashMap = new HashMap<>();
      Member member = memberService.get(originRecipeComments.get(i).getMemberNo()); 
      hashMap.put("member", member);
      hashMap.put("recipeComment", originRecipeComments.get(i));
      hashMap.put("viewer", viewer);
      recipeComments.add(hashMap);
    }
    
    model.addAttribute("recipeComments", recipeComments);
    model.addAttribute("pageNo", pageNo);
    model.addAttribute("pageSize", pageSize);
    model.addAttribute("totalPage", totalPage);
    model.addAttribute("size", size);
    model.addAttribute("beginPage", (pageNo - 1) > 0 ? (pageNo - 1) : 1);
    model.addAttribute("endPage", (pageNo + 1) < totalPage ? (pageNo + 1) : totalPage);
  }
  
  @PostMapping("update")
  public String update(RecipeComment recipeComment) throws Exception {
    recipeCommentService.update(recipeComment);
    return "redirect:/app/recipe/list";
  }
}