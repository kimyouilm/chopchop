package bitcamp.chopchop.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import bitcamp.chopchop.domain.Cart;
import bitcamp.chopchop.domain.CartProduct;
import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.service.CartService;
import bitcamp.chopchop.service.MemberService;
import bitcamp.chopchop.service.ProductOptionService;
import bitcamp.chopchop.service.ProductService;
import bitcamp.chopchop.web.json.JsonResult;

@Controller
@RequestMapping("/cart")
@SessionAttributes("loginUser")
public class CartController {

  @Resource
  private CartService cartService;
  @Resource
  private MemberService memberService;
  @Resource
  private ProductService productService;
  @Resource
  private ProductOptionService productOptionService;

  @GetMapping("form")
  public void form() {
  }
  
  @GetMapping("list")
  public void list(Model model) throws Exception {
    model.addAttribute("carts", cartService.list());
  }

  @PostMapping("add")
  @ResponseBody
  public JsonResult add(@RequestBody CartProduct product, @ModelAttribute("loginUser") Member loginUser) throws Exception {
    for(int i=0; i<product.getOptions().size(); i++) {
      Cart cart = new Cart();
      cart.setMemberNo(memberService.get(loginUser.getMemberNo()).getMemberNo());
      cart.setProductNo(product.getNo());
      cart.setOptionNo(product.getOptions().get(i).getNo());
      cart.setQuantity(product.getOptions().get(i).getQuantity());
      cart.setProduct(productService.get(product.getNo()));
      System.out.println(cart.getProduct());
      cartService.insert(cart);
    }
    return new JsonResult().setState(JsonResult.SUCCESS);
  }

  // button delete
  @GetMapping("delete")
  public String delete(int no, HttpServletRequest request) 
      throws Exception {
    cartService.delete(no);
    return "redirect:search";
  }

  // checkbox delete controller
  @GetMapping("chkdelete")
  public String chkdelete(HttpSession session,
      @RequestParam Map<String, String> paramMap, Cart cart) throws Exception {

    String[] arrIdx = paramMap.get("chkbox").toString().split(",");
    for (int i = 0; i < arrIdx.length; i++) {
      cartService.delete(Integer.parseInt(arrIdx[i]));
    }
    return "redirect:search";
  }

  @GetMapping("chkoption")
  public String chkoption(
      HttpSession session, @RequestParam Map<String, String> paramMap, Cart cart) throws Exception {
    System.out.println("들어왔나");
    String[] arrIdx = paramMap.get("chkbox").toString().split(",");
    List<Cart> selected = new ArrayList<>();
    for (int i = 0; i < arrIdx.length; i++) {
      selected.add(cartService.get(Integer.parseInt(arrIdx[i])));
    }
    
    for (Cart tempCart : selected) {
      System.out.println(tempCart.getOptionNo());
      tempCart.setProductOption(cartService.getOption(tempCart.getOptionNo()));
    }
    
    session.setAttribute("selected", selected);
    return "redirect:../order/cartorderform";
  }

  @GetMapping("detail")
  public void detail(Model model, int no) throws Exception {
    model.addAttribute("cart", cartService.get(no));
  }

  @GetMapping("search")
  public void search(Model model, @ModelAttribute("loginUser") Member loginUser) throws Exception {
    List<Cart> carts = cartService.search(loginUser.getMemberNo());
    Member member = memberService.get(loginUser.getMemberNo());
    model.addAttribute("carts", carts);
    model.addAttribute("member", member);
  }

  @PostMapping("update")
  public String update(Cart cart, HttpServletRequest request) 
      throws Exception {
    System.out.println("나와라~");
    cartService.update(cart);
    return "redirect:search";
  }
}


