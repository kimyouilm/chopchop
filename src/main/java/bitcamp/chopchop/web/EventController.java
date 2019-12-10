package bitcamp.chopchop.web;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import bitcamp.chopchop.domain.Event;
import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.service.EventService;
import bitcamp.chopchop.service.MemberService;

@Controller
@RequestMapping("/event")
@SessionAttributes("loginUser")
public class EventController {

  @Resource
  private EventService eventService;
  @Resource
  private EventPhotoFileWriter eventPhotoFileWriter;
  @Resource
  private MemberService memberService;

  @GetMapping("form")
  public void form() {
  }

  @GetMapping("list")
  public void list(Model model, @ModelAttribute("loginUser") Member loginUser) throws Exception {
    Member member = memberService.get(loginUser.getMemberNo());
    model.addAttribute("member", member);
    model.addAttribute("events", eventService.list());
  }

  @Transactional
  @PostMapping("add")
  public String add(Event event, MultipartFile[] filePath) throws Exception {
    event.setFiles(eventPhotoFileWriter.getEventPhotoFiles(filePath));
    eventService.insert(event);
    return "redirect:list";
  }

  @Transactional
  @PostMapping("delete")
  public String delete(int eventNo) throws Exception {
    eventService.delete(eventNo);
    return "redirect:list";
  }

  @GetMapping("detail")
  public void detail(Model model, int no, @ModelAttribute("loginUser") Member loginUser) throws Exception {
    Member member = memberService.get(loginUser.getMemberNo());
    model.addAttribute("member", member);
    model.addAttribute("event", eventService.get(no));
  }

  @Transactional
  @PostMapping("update")
  public String update(Event event, MultipartFile[] filePath) throws Exception {
    event.setFiles(eventPhotoFileWriter.getEventPhotoFiles(filePath));
    eventService.update(event);
    return "redirect:detail?no=" + event.getEventNo();
  }

  @PostMapping("updateform")
  public void updateform(Model model, int no
  //  ,@ModelAttribute("loginUser") Member loginUser
   ) throws Exception {
    // Member member = memberService.get(loginUser.getMemberNo());
    model.addAttribute("event", eventService.get(no));
    // model.addAttribute("loginUser", member);
  }


}
