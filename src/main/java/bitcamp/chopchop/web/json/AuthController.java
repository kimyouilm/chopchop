package bitcamp.chopchop.web.json;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.service.MemberService;

@RestController("json.AuthController")
@RequestMapping("/json/auth")
public class AuthController {

  @Resource
  private MemberService memberService;

  @GetMapping("getMember")
  public JsonResult findByEmail(String email) throws Exception {
    try {
      Member member = memberService.signEmailCheck(email);

      if (member == null) {
        return new JsonResult().setState(JsonResult.FAILURE);
      }
      return new JsonResult().setState(JsonResult.SUCCESS).setResult(member);
    } catch (Exception e) {
      return new JsonResult().setState(JsonResult.FAILURE).setMessage(e.getMessage());
    }
  }

  @GetMapping("getMemberID")
  public JsonResult findByTel(String tel) throws Exception {
    try {
      Member member = memberService.findMyID(tel);


      if (member == null) {
        return new JsonResult().setState(JsonResult.FAILURE);
      }

      return new JsonResult().setState(JsonResult.SUCCESS).setResult(member);
    } catch (Exception e) {
      return new JsonResult().setState(JsonResult.FAILURE).setMessage(e.getMessage());
    }
  }

  @PostMapping("login")
  public JsonResult login(HttpServletResponse response, HttpSession session, String email,
      String password) throws Exception {

    try {
      // 응답할 때 클라이언트가 입력한 이메일을 쿠키로 보낸다.
      Cookie cookie = new Cookie("email", email);
      cookie.setMaxAge(60 * 60 * 24 * 15);
      response.addCookie(cookie);

      Member member = memberService.get(email, password);


      session.setAttribute("loginUser", member);

      if (member == null) {
        return new JsonResult().setState(JsonResult.FAILURE);
      }

      return new JsonResult().setState(JsonResult.SUCCESS).setResult(member);
    } catch (Exception e) {
      return new JsonResult().setState(JsonResult.FAILURE).setMessage(e.getMessage());
    }
  }
}
