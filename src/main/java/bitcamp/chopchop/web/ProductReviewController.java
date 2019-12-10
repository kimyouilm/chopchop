package bitcamp.chopchop.web;

import java.io.File;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.domain.ProductReview;
import bitcamp.chopchop.service.CommentService;
import bitcamp.chopchop.service.MemberService;
import bitcamp.chopchop.service.ProductReviewService;
import bitcamp.chopchop.service.ProductService;

@Controller
@RequestMapping("/productreview")
public class ProductReviewController {
  
  @Resource
  private CommentService commentService;
  @Resource
  private MemberService memberService;
  @Resource
  private ProductService productService;
  @Resource
  private ProductReviewService productReviewService;

  String uploadDir;

  public ProductReviewController(ServletContext sc) {
    this.uploadDir = sc.getRealPath("/upload/productreview");
  }

  @GetMapping("form")
  public void form() {
  }
  
  @GetMapping("list")
  public void list(Model model, int no, HttpSession session) throws Exception {
    // List<ProductReview> productReviews = productReviewService.list(no);
    // model.addAttribute("productReviews", productReviews);
  }

  @PostMapping("add")
  public String add(ProductReview productReview, HttpSession session, Model model, MultipartFile file) throws Exception {
    Member member = (Member) session.getAttribute("loginUser");
    productReview.setMemberNo(member.getMemberNo());
    productReview.setFilePath(writeFile(file));
    productReview.setContent(productReview.getContent());
    productReviewService.insert(productReview);
    return "redirect:../product/detail?no=" + productReview.getProductNo();
  }

  private String writeFile(MultipartFile file) throws Exception {
    if (file.isEmpty())
      return null;
    String filename = UUID.randomUUID().toString();
    file.transferTo(new File(uploadDir + "/" + filename));
    return filename;
  }

  @GetMapping("delete")
  public String delete(int no, int productNo) 
      throws Exception {
    productReviewService.delete(no);
    return "redirect:../product/detail?no="+ productNo;
  }
  
    @PostMapping("update")
    public String update(ProductReview productReview, MultipartFile file, HttpServletRequest request, int productNo) 
        throws Exception {
          productReview.setFilePath(writeFile(file));
      productReviewService.update(productReview);
      return "redirect:../product/detail?no=" + productNo;
    }
  
  @GetMapping("detail")
  public void detail(Model model, int no) throws Exception {
    model.addAttribute("comment", commentService.get(no));
  }

  @GetMapping("updateform")
  public void updateform(Model model, int no) throws Exception {
    model.addAttribute("comment", commentService.get(no));
  }

}


