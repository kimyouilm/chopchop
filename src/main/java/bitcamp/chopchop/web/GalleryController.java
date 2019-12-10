package bitcamp.chopchop.web;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import bitcamp.chopchop.service.GalleryService;

@Controller
@RequestMapping("/gallery")
public class GalleryController {
  @Resource GalleryService galleryService;
  
  @GetMapping("form")
  public void form() {
    
  }
}
