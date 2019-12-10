package bitcamp.chopchop.web.json;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import bitcamp.chopchop.domain.Product;
import bitcamp.chopchop.service.ProductService;
import bitcamp.chopchop.web.PhotoFileWriter;

@RestController("json.ProductController")
@RequestMapping("/json/product")
public class ProductController {

  @Resource
  private ProductService productService;
  @Resource
  private PhotoFileWriter photoFileWriter;

  @PostMapping("add")
  public JsonResult add(HttpServletRequest request, Product product, MultipartFile[] filePath)
      throws Exception {
    try {
      product.setFiles(photoFileWriter.getPhotoFiles(filePath));
      productService.insert(product);
      return new JsonResult().setState(JsonResult.SUCCESS);
    } catch (Exception e) {
      return new JsonResult().setState(JsonResult.FAILURE).setMessage(e.getMessage());
    }
  }

  @GetMapping("list")
  public JsonResult list(Model model) throws Exception {
    try {
      model.addAttribute("products", productService.list());
      return new JsonResult().setState(JsonResult.SUCCESS);
    } catch (Exception e) {
      return new JsonResult().setState(JsonResult.FAILURE).setMessage(e.getMessage());
    }
  }

  @GetMapping("delete")
  public JsonResult delete(int no) throws Exception {
    try {
      productService.delete(no);
      return new JsonResult().setState(JsonResult.SUCCESS);
    } catch (Exception e) {
      return new JsonResult().setState(JsonResult.FAILURE).setMessage(e.getMessage());
    }
  }

  @GetMapping("detail")
  public JsonResult detail(Model model, int no) throws Exception {
    try {
      model.addAttribute("product", productService.get(no));
      return new JsonResult().setState(JsonResult.SUCCESS);
    } catch (Exception e) {
      return new JsonResult().setState(JsonResult.FAILURE).setMessage(e.getMessage());
    }
  }

  @PostMapping("update")
  public JsonResult update(Product product, MultipartFile[] filePath)
      throws Exception {
    try {
      product.setFiles(photoFileWriter.getPhotoFiles(filePath));
      productService.update(product);
      return new JsonResult().setState(JsonResult.SUCCESS);
    } catch (Exception e) {
      return new JsonResult().setState(JsonResult.FAILURE).setMessage(e.getMessage());
    }
  }

  @GetMapping("updateform")
  public JsonResult updateform(Model model, int no) throws Exception {
    try {
      model.addAttribute("product", productService.get(no));
      return new JsonResult().setState(JsonResult.SUCCESS);
    } catch (Exception e) {
      return new JsonResult().setState(JsonResult.FAILURE).setMessage(e.getMessage());
    }
  }
}


