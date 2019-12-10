package bitcamp.chopchop.web.json;

import javax.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import bitcamp.chopchop.service.PetService;

@RestController("json.PetController")
@RequestMapping("/json/pet")
public class PetController {

  @Resource private PetService petservice;
  
  @GetMapping("delete")
  public JsonResult deletePet(int no)throws Exception{
    try {
      petservice.delete(no);
      return new JsonResult().setState(JsonResult.SUCCESS);
    } catch (Exception e) {
      return new JsonResult().setState(JsonResult.FAILURE).setMessage(e.getMessage());
    }
  }; 
}
