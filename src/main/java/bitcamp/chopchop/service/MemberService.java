package bitcamp.chopchop.service;

import java.util.List;
import org.springframework.stereotype.Service;
import bitcamp.chopchop.domain.Member;

@Service
public interface MemberService {

  List<Member> list(int pageNo, int pageSize) throws Exception;
  void insert(Member member) throws Exception;
  int dupEmailCheck(String email) throws Exception;
  int dupNicknameCheck(String nickname) throws Exception;
  Member get(String email, String password) throws Exception;
  void sendMail() throws Exception;
  Member get(int no) throws Exception;
  void update(Member member) throws Exception;
  void delete(int no) throws Exception;
  Member signEmailCheck(String email) throws Exception;
  Member findMyID(String tel) throws Exception;
  int signPasswordCheck(String password) throws Exception;
  int chkPw(String password, int memberNo) throws Exception;
  int uptPw(String password, int memberNo) throws Exception;
  int size() throws Exception;
}
