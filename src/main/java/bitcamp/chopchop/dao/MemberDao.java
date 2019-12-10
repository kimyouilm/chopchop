package bitcamp.chopchop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import bitcamp.chopchop.domain.Member;

// 회원 관리 DAO의 사용 규칙을 정의한다.
public interface MemberDao {
  int insert(Member member) throws Exception;
  List<Member> findAll(HashMap<String,Object> param) throws Exception;
  List<Member> findByKeyword(String keyword) throws Exception;
  int update(Member member) throws Exception;
  Member findByEmailPassword(Map<String,Object> params) throws Exception;
  int dupEmailCheck(String email) throws Exception;
  int dupNicknameCheck(String nickname) throws Exception;
  Member findBy(int no) throws Exception;
  int delete(int no) throws Exception;
  Member signEmailCheck(String email);
  int signPasswordCheck(String password);
  int chkPw(HashMap<String, Object> map) throws Exception;
  int uptPw(HashMap<String, Object> map) throws Exception;
  Member findMyID(String tel) throws Exception;
  int countAll() throws Exception;
}








