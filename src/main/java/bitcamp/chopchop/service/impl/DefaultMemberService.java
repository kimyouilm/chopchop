package bitcamp.chopchop.service.impl;

import java.util.HashMap;
import java.util.List;
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
import org.springframework.stereotype.Service;
import bitcamp.chopchop.dao.MemberDao;
import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.service.MemberService;

@Service
public class DefaultMemberService implements MemberService {

  @Resource
  private MemberDao memberDao;

  @Override
  public List<Member> list(int pageNo, int pageSize) throws Exception {
    HashMap<String,Object> param = new HashMap<>();
    param.put("offset", (pageNo - 1) * pageSize);
    param.put("pageSize", pageSize);
    return memberDao.findAll(param);
  }

  @Override
  public void insert(Member member) throws Exception {
    memberDao.insert(member);
  }

  @Override
  public int dupEmailCheck(String email) throws Exception {
    return memberDao.dupEmailCheck(email);
  }

  @Override
  public int dupNicknameCheck(String nickname) throws Exception {
    return memberDao.dupNicknameCheck(nickname);
  } 

  @Override
  public Member get(String email, String password) throws Exception {
    HashMap<String,Object> params = new HashMap<>();
    params.put("email", email);
    params.put("password", password);
    Member member = memberDao.findByEmailPassword(params);
    if (member == null) {
    } 
    return member;
  }
  
  @Override
  public Member signEmailCheck(String email) throws Exception {
    return memberDao.signEmailCheck(email);
  }
  
  @Override
  public int signPasswordCheck(String password) throws Exception {
    return memberDao.signPasswordCheck(password);
  }
  
  @Override
  public Member findMyID(String tel) throws Exception {
    return memberDao.findMyID(tel);
  }
  
  @Override
  public void sendMail() throws Exception {
    String user = "bitcamp1234@gmail.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
    String password = "kim1016!"; // 패스워드
    

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

    try {
      String uuid = UUID.randomUUID().toString().replaceAll("-", ""); // -를 제거해 주었다.
      MimeMessage message = new MimeMessage(session);
      message.setFrom(new InternetAddress(user));
      
      // 수신자메일주소
      message.addRecipient(Message.RecipientType.TO, new InternetAddress("madridista18@naver.com"));

      for (int i = 0; i < 1; i++) {
        uuid = uuid.substring(0, 10); //uuid를 앞에서부터 10자리 잘라줌.
      }

      // Subject
      message.setSubject("[ChopChop] - Temporary Password"); // 메일 제목을 입력

      // Text
      message.setText("비밀번호 찾기 임시 비밀번호: " + uuid + "변경  하시려면 링크를 클릭해 주세요." + "<a href=/'" + "/'"); // 메일 내용을 입력

      // send the message
      Transport.send(message); //// 전송
      System.out.println("message sent successfully...");
    } catch (AddressException e) {
      e.printStackTrace();
    } catch (MessagingException e) {
      e.printStackTrace();
    }
  }

  @Override
  public Member get(int no) throws Exception {
    Member member = memberDao.findBy(no);
    if (member == null) {
      throw new Exception("해당 번호의 데이터가 없습니다!");
    } 
    return member;
  }

  @Override
  public void update(Member member) throws Exception {
    memberDao.update(member);
  }

  @Override
  public void delete(int no) throws Exception {
    if (memberDao.delete(no) == 0) {
      throw new Exception("해당 데이터가 없습니다.");
    }
  }

  @Override
  public int chkPw(String password, int memberNo) throws Exception {
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("password", password);
    map.put("memberNo", memberNo);
    return memberDao.chkPw(map);
  }

  @Override
  public int uptPw(String password, int memberNo) throws Exception {
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("password", password);
    map.put("memberNo", memberNo);
    return memberDao.uptPw(map);
  }

  @Override
  public int size() throws Exception {
    return memberDao.countAll();
  }
}
