package bitcamp.chopchop.web;

import java.util.Properties;
import java.util.UUID;
import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.service.MemberService;

@Controller
@RequestMapping("/auth")
public class AuthController {

  @Resource
  private MemberService memberService;

  @GetMapping("signin")
  public void signin() {}

  @GetMapping("findID")
  public void findID() {}

  @GetMapping("getID")
  public void getID(String tel, HttpSession session) {
    try {
      Member member = memberService.findMyID(tel);
      session.setAttribute("member", member);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  @GetMapping("findPassword")
  public void findPassword() {}

  @PostMapping("login")
  public String login(HttpServletResponse response, HttpSession session, String email,
      String password) throws Exception {

    // 응답할 때 클라이언트가 입력한 이메일을 쿠키로 보낸다.
    Cookie cookie = new Cookie("email", email);
    cookie.setMaxAge(60 * 60 * 24 * 15);
    response.addCookie(cookie);

    Member member = memberService.get(email, password);

    session.setAttribute("loginUser", member);
    return "redirect:../index";
  }

  @GetMapping("logout")
  public String logout(HttpSession session) throws Exception {
    session.invalidate();
    return "redirect:/app/index";
  }

  @RequestMapping(path = "getPassword", method = RequestMethod.GET)
  public void gGmailSend(String email) throws Exception {
    try {

      String user = "bitcamp1234@gmail.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
      String password = "Dmzizi1016!"; // 패스워드

      Member member = memberService.signEmailCheck(email);

      if (member != null) {

        // SMTP 서버 정보를 설정한다.
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", 465);
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.ssl.enable", "true");
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
          protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(user, password);
          }
        });

        String uuid = UUID.randomUUID().toString(); // -를 제거해 주었다.
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(user));

        // 수신자메일주소
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

        for (int i = 0; i < 1; i++) {
          uuid = uuid.substring(0, 10); // uuid를 앞에서부터 10자리 잘라줌.
        }

        String userMessage = "<html>\r\n" + "  <body>\r\n"
            + "      <div class='es-wrapper-color'>\r\n"
            + "          <table class='es-wrapper' width='100%' cellspacing='0' cellpadding='0'>\r\n"
            + "              <tbody>\r\n" + "                  <tr>\r\n"
            + "                      <td class='esd-email-paddings' valign='top'>\r\n"
            + "                          <table class='es-conter es-preheader esd-header-popover' cellspacing='0' cellpadding='0' align='center'>\r\n"
            + "                              <tbody>\r\n"
            + "                                  <tr>\r\n"
            + "                                      <td class='es-adaptive esd-stripe' align='center'>\r\n"
            + "                                          <table class='es-content-body' width='600' cellspacing='0' cellpadding='0' align='center'>\r\n"
            + "                                              <tbody>\r\n"
            + "                                                  <tr>\r\n"
            + "                                                      <td class='esd-structure es-p10' align='left'>\r\n"
            + "                                                          <table class='es-left' cellspacing='0' cellpadding='0' align='left'>\r\n"
            + "                                                              <tbody>\r\n"
            + "                                                                  <tr>\r\n"
            + "                                                                      <td class='esd-container-frame' width='280' align='left'>\r\n"
            + "                                                                          <table width='100%' cellspacing='0' cellpadding='0'>\r\n"
            + "                                                                              <tbody>\r\n"
            + "                                                                                  <tr>\r\n"
            + "                                                                                      <td class='es-infoblock esd-block-text' align='left'>[ChopChop] - Temporary Password</td>\r\n"
            + "                                                                                  </tr>\r\n"
            + "                                                                              </tbody>\r\n"
            + "                                                                          </table>\r\n"
            + "                                                                      </td>\r\n"
            + "                                                                  </tr>\r\n"
            + "                                                              </tbody>\r\n"
            + "                                                          </table>\r\n"
            + "                                                          <table class='es-right' cellspacing='0' cellpadding='0' align='right'>\r\n"
            + "                                                              <tbody>\r\n"
            + "                                                                  <tr>\r\n"
            + "                                                                      <td class='esd-container-frame' width='280' align='left'>\r\n"
            + "                                                                          <table width='100%' cellspacing='0' cellpadding='0'>\r\n"
            + "                                                                              <tbody>\r\n"
            + "                                                                                  <tr>\r\n"
            + "                                                                                      <td class='es-infoblock esd-block-text' align='right'>\r\n"
            + "                                                                                          <p><a href='http://#' target='_blank'>chopchop</a></p>\r\n"
            + "                                                                                      </td>\r\n"
            + "                                                                                  </tr>\r\n"
            + "                                                                              </tbody>\r\n"
            + "                                                                          </table>\r\n"
            + "                                                                      </td>\r\n"
            + "                                                                  </tr>\r\n"
            + "                                                              </tbody>\r\n"
            + "                                                          </table>\r\n"
            + "                                                      </td>\r\n"
            + "                                                  </tr>\r\n"
            + "                                              </tbody>\r\n"
            + "                                          </table>\r\n"
            + "                                      </td>\r\n"
            + "                                  </tr>\r\n"
            + "                              </tbody>\r\n"
            + "                          </table>\r\n"
            + "                          <table class='es-header' cellspacing='0' cellpadding='0' align='center'>\r\n"
            + "                              <tbody>\r\n"
            + "                                  <tr>\r\n"
            + "                                      <td class='es-adaptive esd-stripe' align='center'>\r\n"
            + "                                          <table class='es-header-body' width='600' cellspacing='0' cellpadding='0' align='center'>\r\n"
            + "                                              <tbody>\r\n"
            + "                                                  <tr>\r\n"
            + "                                                      <td class='esd-structure es-p10' esd-general-paddings-checked='false' align='left'>\r\n"
            + "                                                          <table class='es-left' cellspacing='0' cellpadding='0' align='left'>\r\n"
            + "                                                              <tbody>\r\n"
            + "                                                                  <tr>\r\n"
            + "                                                                      <td class='es-m-p0r es-m-p20b esd-container-frame' width='180' align='center'>\r\n"
            + "                                                                          <table width='100%' cellspacing='0' cellpadding='0'>\r\n"
            + "                                                                              <tbody>\r\n"
            + "                                                                                  <tr>\r\n"
            + "                                                                                      <td class='esd-block-menu' esd-img-prev-h='16' esd-img-prev-w='16'>\r\n"
            + "                                                                                          <table class='es-menu' width='100%' cellspacing='0' cellpadding='0'>\r\n"
            + "                                                                                              <tbody>\r\n"
            + "                                                                                                  <tr class='links'>\r\n"
            + "                                                                                                      <td class='es-p10t es-p10b es-p5r es-p5l' style='padding-bottom: 10px; padding-top: 10px; ' width='50.00%' bgcolor='transparent' align='center'><a style='color: #333333;' href='http://localhost:8888/app/index'>ChopHome</a></td>\r\n"
            + "                                                                                                      <td class='es-p10t es-p10b es-p5r es-p5l' style='border-left: 0px solid #000000; padding-bottom: 10px; padding-top: 10px; ' width='50.00%' bgcolor='transparent' align='center'><a style='color: #333333;' href='http://localhost:8888/app/recipe/list'>ChopRecipe</a></td>\r\n"
            + "                                                                                                  </tr>\r\n"
            + "                                                                                              </tbody>\r\n"
            + "                                                                                          </table>\r\n"
            + "                                                                                      </td>\r\n"
            + "                                                                                  </tr>\r\n"
            + "                                                                              </tbody>\r\n"
            + "                                                                          </table>\r\n"
            + "                                                                      </td>\r\n"
            + "                                                                      <td class='es-hidden' width='20'></td>\r\n"
            + "                                                                  </tr>\r\n"
            + "                                                              </tbody>\r\n"
            + "                                                          </table>\r\n"
            + "                                                          <table class='es-left' cellspacing='0' cellpadding='0' align='left'>\r\n"
            + "                                                              <tbody>\r\n"
            + "                                                                  <tr>\r\n"
            + "                                                                      <td class='es-m-p20b esd-container-frame' width='180' align='center'>\r\n"
            + "                                                                          <table width='100%' cellspacing='0' cellpadding='0'>\r\n"
            + "                                                                              <tbody>\r\n"
            + "                                                                                  <tr>\r\n"
            + "                                                                                      <td class='esd-block-image es-m-p0l es-p15l' align='center'><a href='http://localhost:8888/app/index' target='_blank'><img src='https://demo.stripocdn.email/content/guids/ca3a663f-43f7-4c82-96a7-27fad8f119aa/images/81511574246325128.png' alt='Chopchop logo' title='Chopchop logo' width='130' style='display: block;'></a></td>\r\n"
            + "                                                                                  </tr>\r\n"
            + "                                                                              </tbody>\r\n"
            + "                                                                          </table>\r\n"
            + "                                                                      </td>\r\n"
            + "                                                                  </tr>\r\n"
            + "                                                              </tbody>\r\n"
            + "                                                          </table>\r\n"
            + "                                                          <table class='es-right' cellspacing='0' cellpadding='0' align='right'>\r\n"
            + "                                                              <tbody>\r\n"
            + "                                                                  <tr>\r\n"
            + "                                                                      <td class='esd-container-frame' width='180' align='center'>\r\n"
            + "                                                                          <table width='100%' cellspacing='0' cellpadding='0'>\r\n"
            + "                                                                              <tbody>\r\n"
            + "                                                                                  <tr>\r\n"
            + "                                                                                      <td class='esd-block-menu' esd-img-prev-h='16' esd-img-prev-w='16'>\r\n"
            + "                                                                                          <table class='es-menu' width='100%' cellspacing='0' cellpadding='0'>\r\n"
            + "                                                                                              <tbody>\r\n"
            + "                                                                                                  <tr class='links'>\r\n"
            + "                                                                                                      <td class='es-p10t es-p10b es-p5r es-p5l' style='padding-bottom: 10px; padding-top: 10px; ' width='50.00%' bgcolor='transparent' align='center'><a style='color: #333333;' href='http://mysite.com'>Events</a></td>\r\n"
            + "                                                                                                      <td class='es-p10t es-p10b es-p5r es-p5l' style='border-left: 0px solid #000000; padding-bottom: 10px; padding-top: 10px; ' width='50.00%' bgcolor='transparent' align='center'><a style='color: #333333;' href='http://localhost:8888/app/product/list'>ChopStore</a></td>\r\n"
            + "                                                                                                  </tr>\r\n"
            + "                                                                                              </tbody>\r\n"
            + "                                                                                          </table>\r\n"
            + "                                                                                      </td>\r\n"
            + "                                                                                  </tr>\r\n"
            + "                                                                              </tbody>\r\n"
            + "                                                                          </table>\r\n"
            + "                                                                      </td>\r\n"
            + "                                                                  </tr>\r\n"
            + "                                                              </tbody>\r\n"
            + "                                                          </table>\r\n"
            + "                                                      </td>\r\n"
            + "                                                  </tr>\r\n"
            + "                                              </tbody>\r\n"
            + "                                          </table>\r\n"
            + "                                      </td>\r\n"
            + "                                  </tr>\r\n"
            + "                              </tbody>\r\n"
            + "                          </table>\r\n"
            + "                          <table class='es-content' cellspacing='0' cellpadding='0' align='center'>\r\n"
            + "                              <tbody>\r\n"
            + "                                  <tr>\r\n"
            + "                                      <td class='esd-stripe' align='center'>\r\n"
            + "                                          <table class='es-content-body' width='600' cellspacing='0' cellpadding='0' bgcolor='#ffffff' align='center'>\r\n"
            + "                                              <tbody>\r\n"
            + "                                                  <tr>\r\n"
            + "                                                      <td class='esd-structure es-p20' esd-general-paddings-checked='false' style='background-color: rgb(255, 255, 255);' bgcolor='#ffffff' align='left'>\r\n"
            + "                                                          <table width='100%' cellspacing='0' cellpadding='0'>\r\n"
            + "                                                              <tbody>\r\n"
            + "                                                                  <tr>\r\n"
            + "                                                                      <td class='esd-container-frame' width='560' valign='top' align='center'>\r\n"
            + "                                                                          <table width='100%' cellspacing='0' cellpadding='0'>\r\n"
            + "                                                                              <tbody>\r\n"
            + "                                                                                  <tr>\r\n"
            + "                                                                                      <td class='esd-block-text es-p15t es-p5b' align='center'>\r\n"
            + "                                                                                          <h1>  Hello! "
            + member.getNickname() + "</h1>\r\n"
            + "                                                                                      </td>\r\n"
            + "                                                                                  </tr>\r\n"
            + "                                                                                  <tr>\r\n"
            + "                                                                                      <td class='esd-block-spacer es-p10b es-p20r es-p20l' align='center'>\r\n"
            + "                                                                                          <table width='15%' height='100%' cellspacing='0' cellpadding='0' border='0'>\r\n"
            + "                                                                                              <tbody>\r\n"
            + "                                                                                                  <tr>\r\n"
            + "                                                                                                      <td style='border-bottom: 4px solid rgb(204, 173, 83); background: rgba(0, 0, 0, 0) none repeat scroll 0% 0%; height: 1px; width: 100%; margin: 0px;'></td>\r\n"
            + "                                                                                                  </tr>\r\n"
            + "                                                                                              </tbody>\r\n"
            + "                                                                                          </table>\r\n"
            + "                                                                                      </td>\r\n"
            + "                                                                                  </tr>\r\n"
            + "                                                                                  <tr>\r\n"
            + "                                                                                      <td class='esd-block-text es-p10t es-p10b' align='center'>\r\n"
            + "                                                                                          <h3>Your Temporary Password: </h3>\r\n"
            + "                                                                                      </td>\r\n"
            + "                                                                                  </tr>\r\n"
            + "                                                                                  <tr>\r\n"
            + "                                                                                      <td class='esd-block-text es-p10t es-p10b' align='center'>\r\n"
            + "                                                                                          <h2>"
            + uuid + "</h2>\r\n"
            + "                                                                                      </td>\r\n"
            + "                                                                                  </tr>\r\n"
            + "                                                                                  <tr>\r\n"
            + "                                                                                      <span class='es-button-border'><a href='http://localhost:8888/app/auth/signin' class='es-button' target='_blank' style='position:center; border-width: 10px 20px; color: rgb(255, 255, 255);'>Login</a></span>\r\n"
            + "                                                                                  </tr>\r\n"
            + "                                                                              </tbody>\r\n"
            + "                                                                          </table>\r\n"
            + "                                                                      </td>\r\n"
            + "                                                                  </tr>\r\n"
            + "                                                              </tbody>\r\n"
            + "                                                          </table>\r\n"
            + "                                                      </td>\r\n"
            + "                                                  </tr>\r\n"
            + "                                              </tbody>\r\n"
            + "                                          </table>\r\n"
            + "                                      </td>\r\n"
            + "                                  </tr>\r\n"
            + "                              </tbody>\r\n"
            + "                          </table>\r\n"
            + "                          <table class='es-content esd-footer-popover' cellspacing='0' cellpadding='0' align='center'>\r\n"
            + "                              <tbody>\r\n"
            + "                                  <tr></tr>\r\n"
            + "                                  <tr>\r\n"
            + "                                      <td class='esd-stripe' esd-custom-block-id='1560' align='center'>\r\n"
            + "                                          <table class='es-footer-body' width='600' cellspacing='0' cellpadding='0' align='center'>\r\n"
            + "                                              <tbody>\r\n"
            + "                                                  <tr>\r\n"
            + "                                                      <td class='esd-structure es-p20t es-p5b es-p20r es-p20l' esd-general-paddings-checked='false' align='left'>\r\n"
            + "                                                          <table width='100%' cellspacing='0' cellpadding='0'>\r\n"
            + "                                                              <tbody>\r\n"
            + "                                                                  <tr>\r\n"
            + "                                                                      <td class='esd-container-frame' width='560' valign='top' align='center'>\r\n"
            + "                                                                          <table width='100%' cellspacing='0' cellpadding='0'>\r\n"
            + "                                                                              <tbody>\r\n"
            + "                                                                                  <tr>\r\n"
            + "                                                                                      <td class='esd-block-spacer es-p5t es-p20b es-p10r es-p10l' align='center'>\r\n"
            + "                                                                                          <table width='100%' height='100%' cellspacing='0' cellpadding='0' border='0'>\r\n"
            + "                                                                                              <tbody>\r\n"
            + "                                                                                                  <tr>\r\n"
            + "                                                                                                      <td style='border-bottom: 1px solid #cccccc; background:none; height:1px; width:100%; margin:0px 0px 0px 0px;'></td>\r\n"
            + "                                                                                                  </tr>\r\n"
            + "                                                                                              </tbody>\r\n"
            + "                                                                                          </table>\r\n"
            + "                                                                                      </td>\r\n"
            + "                                                                                  </tr>\r\n"
            + "                                                                                  <tr>\r\n"
            + "                                                                                      <td class='esd-block-image es-m-p0l es-p5b es-p15l' align='center'><a href target='_blank'><img src='https://demo.stripocdn.email/content/guids/ca3a663f-43f7-4c82-96a7-27fad8f119aa/images/19911574246559688.png' alt='Marseille logo' title='Marseille logo' style='display: block;' width='545'></a></td>\r\n"
            + "                                                                                  </tr>\r\n"
            + "                                                                              </tbody>\r\n"
            + "                                                                          </table>\r\n"
            + "                                                                      </td>\r\n"
            + "                                                                  </tr>\r\n"
            + "                                                              </tbody>\r\n"
            + "                                                          </table>\r\n"
            + "                                                      </td>\r\n"
            + "                                                  </tr>\r\n"
            + "                                                  <tr>\r\n"
            + "                                                      <td class='esd-structure es-p5t es-p15b es-p20r es-p20l' esd-general-paddings-checked='false' align='left'>\r\n"
            + "                                                          <table width='100%' cellspacing='0' cellpadding='0'>\r\n"
            + "                                                              <tbody>\r\n"
            + "                                                                  <tr>\r\n"
            + "                                                                      <td class='esd-container-frame' width='560' valign='top' align='center'>\r\n"
            + "                                                                          <table width='100%' cellspacing='0' cellpadding='0'>\r\n"
            + "                                                                              <tbody>\r\n"
            + "                                                                                  <tr>\r\n"
            + "                                                                                      <td class='esd-block-text' align='center'>\r\n"
            + "                                                                                          <p style='line-height: 150%;'>You are receiving this email because you have visited our site or asked us about regular newsletter.</p>\r\n"
            + "                                                                                          <p style='line-height: 150%;'><a target='_blank' style='line-height: 150%;'>Unsubscribe</a>&nbsp; | <a target='_blank'>Update Preferences</a> | <a target='_blank'>Customer Support</a></p>\r\n"
            + "                                                                                      </td>\r\n"
            + "                                                                                  </tr>\r\n"
            + "                                                                              </tbody>\r\n"
            + "                                                                          </table>\r\n"
            + "                                                                      </td>\r\n"
            + "                                                                  </tr>\r\n"
            + "                                                              </tbody>\r\n"
            + "                                                          </table>\r\n"
            + "                                                      </td>\r\n"
            + "                                                  </tr>\r\n"
            + "                                              </tbody>\r\n"
            + "                                          </table>\r\n"
            + "                                      </td>\r\n"
            + "                                  </tr>\r\n"
            + "                              </tbody>\r\n"
            + "                          </table>\r\n" + "                      </td>\r\n"
            + "                  </tr>\r\n" + "              </tbody>\r\n"
            + "          </table>\r\n" + "      </div>\r\n" + "  </body>\r\n" + "\r\n"
            + "  </html>\r\n" + "";
        
        // Subject
        message.setSubject("[ChopChop] - Temporary Password"); // 메일 제목을 입력

        // Text
        message.setText(userMessage, "utf-8", "html");


        // email로 member를 찾는다.
        // 그 멤버 update (password=uuid)
        member.setPassword(uuid);
        memberService.update(member);

        // send the message
        Transport.send(message); //// 전송
        System.out.println("message sent successfully...");
      }
    } catch (AddressException e) {
      e.printStackTrace();
    } catch (MessagingException e) {
      e.printStackTrace();
    }
  }

}
