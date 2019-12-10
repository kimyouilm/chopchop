package bitcamp.chopchop.web;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.domain.ProductReview;
import bitcamp.chopchop.service.MemberService;
import bitcamp.chopchop.service.ProductReviewService;
import bitcamp.chopchop.service.ProductService;

@Controller
@RequestMapping("/mypage")
@SessionAttributes("loginUser")
public class MypageController {
  @Resource
  private MemberService memberService;

  @Resource
  private ProductReviewService productReviewService;
  
  @Resource
  private ProductService productService;

  @GetMapping("myreview")
  public void myreview(Model model, @ModelAttribute("loginUser") Member loginUser) throws Exception {
    Member member = memberService.get(loginUser.getMemberNo());
    List<ProductReview> productReviews = productReviewService.myreview(loginUser.getMemberNo());
    model.addAttribute("member", member);
    model.addAttribute("productReviews", productReviews);
    
  }
  
}
