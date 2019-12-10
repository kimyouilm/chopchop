package bitcamp.chopchop.web;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.domain.Order;
import bitcamp.chopchop.domain.Recipe;
import bitcamp.chopchop.domain.RecipeComment;
import bitcamp.chopchop.service.MemberService;
import bitcamp.chopchop.service.OrderService;
import bitcamp.chopchop.service.PetService;
import bitcamp.chopchop.service.ProductReviewService;
import bitcamp.chopchop.service.ProductService;
import bitcamp.chopchop.service.RecipeCommentService;
import bitcamp.chopchop.service.RecipeService;

@Controller
@RequestMapping("/admin")
@SessionAttributes("loginUser")
public class AdminController {

  @Resource
  private RecipeService recipeService;
  @Resource
  private MemberService memberService;
  @Resource
  private PetService petService;
  @Resource
  private ProductService productService;
  @Resource
  private ProductReviewService productReviewService;
  @Resource
  private OrderService orderService;
  @Resource
  private RecipeCommentService recipeCommentService;

  @GetMapping("member_list")
  public void memberTotalList(Model model, @ModelAttribute("loginUser") Member loginUser,
      @RequestParam(defaultValue = "1") int pageNo, @RequestParam(defaultValue = "3") int pageSize)
      throws Exception {
    Member member = memberService.get(loginUser.getMemberNo());

    // 멤버 총 건수
    int size = memberService.size();

    // 페이징처리에서 보여주는 숫자
    int totalPage = size / pageSize; // 13 / 3 = 4.x
    if (size % pageSize > 0) {
      totalPage++;
    }

    List<Member> members = memberService.list(pageNo, pageSize);
    // List<Pet> pets = petService.list();

    model.addAttribute("member", member);
    model.addAttribute("members", members);
    // model.addAttribute("pets", pets);

    model.addAttribute("pageNo", pageNo);
    model.addAttribute("pageSize", pageSize);
    model.addAttribute("totalPage", totalPage);
    model.addAttribute("size", size);
    model.addAttribute("beginPage", (pageNo - 2) > 0 ? (pageNo - 2) : 1);
    model.addAttribute("endPage", (pageNo + 2) < totalPage ? (pageNo + 2) : totalPage);

  }

  @GetMapping("recipe_list")
  public void recipeTotalList(HttpSession session, Model model,
      @RequestParam(defaultValue = "1") int pageNo, @RequestParam(defaultValue = "3") int pageSize)
      throws Exception {
    if (session.getAttribute("loginUser") != null) {
      Member member = memberService.get(((Member) session.getAttribute("loginUser")).getMemberNo());
      model.addAttribute("member", member);
    }
    // 멤버 총 건수
    int size = recipeService.size();

    // 페이징처리에서 보여주는 숫자
    int totalPage = size / pageSize; // 13 / 3 = 4.x
    if (size % pageSize > 0) {
      totalPage++;
    }
    List<Recipe> recipes = recipeService.pagingList(pageNo, pageSize);
    List<String> memberNameList = new ArrayList<>();
    for (Recipe a : recipes) {
      int k = a.getMemberNo();
      Member member = memberService.get(k);
      String nickname = member.getNickname();
      memberNameList.add(nickname);
    }
    model.addAttribute("recipes", recipes);
    model.addAttribute("memberNameList", memberNameList);
    model.addAttribute("pageNo", pageNo);
    model.addAttribute("pageSize", pageSize);
    model.addAttribute("totalPage", totalPage);
    model.addAttribute("size", size);
    model.addAttribute("beginPage", (pageNo - 2) > 0 ? (pageNo - 2) : 1);
    model.addAttribute("endPage", (pageNo + 2) < totalPage ? (pageNo + 2) : totalPage);

  }

  @GetMapping("order_list")
  public void orderTotalList(Model model, @ModelAttribute("loginUser") Member loginUser,
      @RequestParam(defaultValue = "1") int pageNo, @RequestParam(defaultValue = "3") int pageSize)
      throws Exception {
    Member member = memberService.get(loginUser.getMemberNo());

    // 멤버 총 건수
    int size = orderService.size();

    // 페이징처리에서 보여주는 숫자
    int totalPage = size / pageSize; // 13 / 3 = 4.x
    if (size % pageSize > 0) {
      totalPage++;
    }

    List<Order> orders = orderService.list(pageNo, pageSize);
    model.addAttribute("member", member);
    model.addAttribute("orders", orders);

    model.addAttribute("pageNo", pageNo);
    model.addAttribute("pageSize", pageSize);
    model.addAttribute("totalPage", totalPage);
    model.addAttribute("size", size);
    model.addAttribute("beginPage", (pageNo - 2) > 0 ? (pageNo - 2) : 1);
    model.addAttribute("endPage", (pageNo + 2) < totalPage ? (pageNo + 2) : totalPage);
  }

  @GetMapping("product_list")
  public void productTotalList(Model model, @ModelAttribute("loginUser") Member loginUser,
      @RequestParam(defaultValue = "1") int pageNo, @RequestParam(defaultValue = "3") int pageSize)
      throws Exception {
    Member member = memberService.get(loginUser.getMemberNo());
    model.addAttribute("member", member);
    // 멤버 총 건수
    int size = productService.size();

    // 페이징처리에서 보여주는 숫자
    int totalPage = size / pageSize; // 13 / 3 = 4.x
    if (size % pageSize > 0) {
      totalPage++;
    }
    model.addAttribute("products", productService.pagingList(pageNo, pageSize));
    model.addAttribute("pageNo", pageNo);
    model.addAttribute("pageSize", pageSize);
    model.addAttribute("totalPage", totalPage);
    model.addAttribute("size", size);
    model.addAttribute("beginPage", (pageNo - 2) > 0 ? (pageNo - 2) : 1);
    model.addAttribute("endPage", (pageNo + 2) < totalPage ? (pageNo + 2) : totalPage);
  }

  @GetMapping("storeReview_list")
  public void storeReviewTotalList(Model model, @ModelAttribute("loginUser") Member loginUser,
      @RequestParam(defaultValue = "1") int pageNo, @RequestParam(defaultValue = "3") int pageSize)
      throws Exception {
    Member member = memberService.get(loginUser.getMemberNo());
    model.addAttribute("member", member);
    // 멤버 총 건수
    int size = productReviewService.size();

    // 페이징처리에서 보여주는 숫자
    int totalPage = size / pageSize; // 13 / 3 = 4.x
    if (size % pageSize > 0) {
      totalPage++;
    }
    model.addAttribute("storeReviews", productReviewService.storeReview(pageNo, pageSize));
    model.addAttribute("pageNo", pageNo);
    model.addAttribute("pageSize", pageSize);
    model.addAttribute("totalPage", totalPage);
    model.addAttribute("size", size);
    model.addAttribute("beginPage", (pageNo - 2) > 0 ? (pageNo - 2) : 1);
    model.addAttribute("endPage", (pageNo + 2) < totalPage ? (pageNo + 2) : totalPage);
  }

  @GetMapping("recipeComment_list")
  public void recipeCommentList(Model model, @ModelAttribute("loginUser") Member loginUser,
      @RequestParam(defaultValue = "1") int pageNo, @RequestParam(defaultValue = "3") int pageSize)
      throws Exception {
    Member member = memberService.get(loginUser.getMemberNo());
    List<RecipeComment> recipeCommentList =
        recipeCommentService.recipeCommentList(pageNo, pageSize);

    int size = productReviewService.size();

    // 페이징처리에서 보여주는 숫자
    int totalPage = size / pageSize; // 13 / 3 = 4.x
    if (size % pageSize > 0) {
      totalPage++;
    }

    model.addAttribute("member", member);
    model.addAttribute("recipeCommentList", recipeCommentList);

    model.addAttribute("pageNo", pageNo);
    model.addAttribute("pageSize", pageSize);
    model.addAttribute("totalPage", totalPage);
    model.addAttribute("size", size);
    model.addAttribute("beginPage", (pageNo - 2) > 0 ? (pageNo - 2) : 1);
    model.addAttribute("endPage", (pageNo + 2) < totalPage ? (pageNo + 2) : totalPage);
  }
}
