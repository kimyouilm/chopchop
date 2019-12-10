package bitcamp.chopchop.web;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import bitcamp.chopchop.domain.Comment;
import bitcamp.chopchop.service.CommentService;
import bitcamp.chopchop.service.MemberService;
import bitcamp.chopchop.service.ProductService;
import bitcamp.chopchop.web.json.JsonResult;

@Controller
@RequestMapping("/comment")
public class CommentController {

  @Resource
  private CommentService commentService;
  @Resource
  private MemberService memberService;
  @Resource
  private ProductService productService;

  @GetMapping("form")
  public void form() {
  }
  
  @ResponseBody
  @PostMapping("add")
  public JsonResult add(@RequestBody Comment comment) throws Exception {
    commentService.insert(comment);
    return new JsonResult().setState(JsonResult.SUCCESS);
  }

  @PostMapping("commentDelete")
  public String commentDelete(int commentNo, int productNo) throws Exception {
    commentService.commentDelete(commentNo);
    return "redirect:../product/detail?no="+ productNo;
  }

  @GetMapping("detail")
  public void detail(Model model, int no) throws Exception {
    model.addAttribute("comment", commentService.get(no));
  }
  
  @ResponseBody
  @PostMapping("update")
  public JsonResult update(@RequestBody Comment comment) throws Exception {
    System.out.println(comment);
    commentService.update(comment);
    return new JsonResult().setState(JsonResult.SUCCESS);
  }

  @GetMapping("updateform")
  public void updateform(Model model, int no) throws Exception {
    model.addAttribute("comment", commentService.get(no));
  }
  
  @GetMapping("productCommentList")
  public void productCommentList(Model model, int no) throws Exception {
  }
  
  @PostMapping("insertanswer")
  public String insertAnswer(Comment comment) throws Exception {
    commentService.commentAnswer(comment);
    return "redirect:/app/product/list";
  }
}


