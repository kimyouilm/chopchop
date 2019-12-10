package bitcamp.chopchop.web;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import bitcamp.chopchop.domain.Cart;
import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.domain.Order;
import bitcamp.chopchop.domain.OrderProduct;
import bitcamp.chopchop.domain.Product;
import bitcamp.chopchop.domain.ProductOption;
import bitcamp.chopchop.service.CartService;
import bitcamp.chopchop.service.MemberService;
import bitcamp.chopchop.service.OrderService;
import bitcamp.chopchop.service.ProductOptionService;
import bitcamp.chopchop.service.ProductService;

@Controller
@RequestMapping("/order")
@SessionAttributes("loginUser")
public class OrderController {

  @Resource
  private OrderService orderService;
  @Resource
  private ProductService productService;
  @Resource
  private CartService cartService;
  @Resource
  private MemberService memberService;
  @Resource
  private ProductOptionService productOptionService;
  
  @PostMapping("form")
  public void form(Model model, HttpSession session, String[] optNo, String[] optQuantity, 
      String[] optPrice, int productNo) throws Exception {
    if (session.getAttribute("loginUser") != null) {
      Member member = memberService.get(((Member)session.getAttribute("loginUser")).getMemberNo());
      model.addAttribute("member", member);
    }
    Product product = productService.get(productNo);
    ArrayList<ProductOption> tempOptions = new ArrayList<>();
    for (int i=0;i<optNo.length;i++) {
      tempOptions.add(productOptionService.get(Integer.parseInt(optNo[i])));
      tempOptions.get(i).setQuantity(Integer.parseInt(optQuantity[i]));
      product.setOptions(tempOptions);
    }
//    System.out.println(tempOptions);
    model.addAttribute("product", product);
  }

  @PostMapping("cartorderform")
  public void cartorderform(Model model, String[] cartNo, 
      @ModelAttribute("loginUser") Member loginUser, HttpSession session) throws Exception {
    if (session.getAttribute("loginUser") != null) {
      Member member = memberService.get(((Member)session.getAttribute("loginUser")).getMemberNo());
      model.addAttribute("member", member);
    }
    List<Cart> carts = new ArrayList<>();
    for (int i=0;i<cartNo.length; i++) {
      carts.add(cartService.get(Integer.parseInt(cartNo[i])));
      carts.get(i).setProduct(productService.get(carts.get(i).getProductNo()));
      carts.get(i).setProductOption(productOptionService.get(carts.get(i).getOptionNo()));
    }
    model.addAttribute("carts", carts);
    session.setAttribute("selectedProduct", carts);
  }

  @GetMapping("searchbymember")
  public void searchByMember(Model model, HttpSession session) throws Exception {
    
    Member member = new Member();
    if (session.getAttribute("loginUser") != null) {
      member = memberService.get(((Member)session.getAttribute("loginUser")).getMemberNo());
      model.addAttribute("member", member);
    }
    List<OrderProduct> orderProducts = orderService.searchByMember(member.getMemberNo());

    for(OrderProduct op : orderProducts) {
      op.setProduct(productService.get(op.getProductNo()));
      op.setOrder(orderService.get(op.getOrderNo()));
      op.setProductOption(productOptionService.get(op.getOptionNo()));
    }
    model.addAttribute("loginUser", member);
    model.addAttribute("orderProducts", orderProducts);
    session.setAttribute("selectedProduct", orderProducts);
  }

  @PostMapping("add")
  @Transactional
  public String add(HttpSession session, Order order, int no, int[] optionNo, int[] quantity) throws Exception {
    orderService.insert(order);
    OrderProduct orderProduct = new OrderProduct();
    for(int i=0 ; i<optionNo.length ; i++) {
      Product product = productService.get(no);
      orderProduct.setProductNo(no);
      orderProduct.setOptionNo(optionNo[i]);
      orderProduct.setQuantity(quantity[i]);
      orderProduct.setDiscountPrice(((product.getPrice() * (100-product.getDiscount())/100) + productOptionService.get(optionNo[i]).getPrice()) * quantity[i]);
      if(orderProduct.getDiscountPrice() < 50000) {
        orderProduct.setDiscountPrice(orderProduct.getDiscountPrice() + 2500);
      }
      orderService.insert(orderProduct, order);
    }
    session.setAttribute("order", order);
    session.setAttribute("orderProduct", orderProduct);

    return "redirect:result";
  }

  @PostMapping("addfromcart")
  @Transactional
  public String addFromCart(HttpSession session, Order order) throws Exception {
    OrderProduct orderProduct = new OrderProduct();
    @SuppressWarnings("unchecked")
    List<Cart> selectedProduct = (List<Cart>) session.getAttribute("selectedProduct");
    orderService.insert(order);
    if (selectedProduct != null) {
      for (Cart cart : selectedProduct) {
        Product product = cart.getProduct();
        ProductOption productOption = cart.getProductOption();
        orderProduct.setProductNo(cart.getProductNo());
        orderProduct.setOptionNo(cart.getOptionNo());
        orderProduct.setQuantity(cart.getQuantity());
        orderProduct.setDiscountPrice(((product.getPrice() * (100-product.getDiscount())/100) + productOption.getPrice()) * cart.getQuantity());
        if(orderProduct.getDiscountPrice() < 50000) {
          orderProduct.setDiscountPrice(orderProduct.getDiscountPrice() + 2500);
        }
        orderService.insert(orderProduct, order);
//        cartService.delete(cart.getCartNo()); // 테스트할 때 막아두고 나중에 풀 것
      }
    }
    session.setAttribute("order", order);
    return "redirect:result";
  }

  @GetMapping("delete")
  public String delete(int no) throws Exception {
    orderService.delete(no);
    return "redirect:searchbymember";
  }

  @GetMapping("detail")
  public void detail(Model model, int no) throws Exception {
    model.addAttribute("order", orderService.get(no));
  }

  @PostMapping("update")
  public String update(Order order) throws Exception {
    orderService.update(order);
    return "redirect:searchbymember"; // -> 주문 완료 페이지로
  }

  @GetMapping("result")
  public void result(
      HttpSession session, Order order, OrderProduct orderProduct, Model model) throws Exception {
    order = (Order) session.getAttribute("order");
    orderProduct = (OrderProduct) session.getAttribute("orderProduct");
    model.addAttribute("order", order);
    model.addAttribute("orderProduct", orderProduct);
//    model.addAttribute("product", productService.get(orderProduct.getProductNo()));
  }

  @GetMapping("updateform")
  public void updateform(int no, Model model, HttpSession session) throws Exception {
    if (session.getAttribute("loginUser") != null) {
      Member member = memberService.get(((Member)session.getAttribute("loginUser")).getMemberNo());
      model.addAttribute("member", member);
    }
    model.addAttribute("order", orderService.get(no));
  }
  
  @PostMapping("statusupdate")
  public String statusUpdate(int no, String status) throws Exception {
    Order order = orderService.get(no);
    order.setShipStatus(String.valueOf(status));
    System.out.println(order);
    orderService.updateStatus(order);
    return "redirect:/app/admin/order_list";
  }

}































