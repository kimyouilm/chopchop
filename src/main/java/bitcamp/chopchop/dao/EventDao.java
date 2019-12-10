package bitcamp.chopchop.dao;

import java.util.List;

import bitcamp.chopchop.domain.Event;

public interface EventDao {
  int insert(Event event) throws Exception;
  List<Event> findAll() throws Exception;
  Event findBy(int no) throws Exception;
  Event findWithFilesBy(int no) throws Exception;
  int increaseViewCount(int no) throws Exception;
  int update(Event event) throws Exception;
  int delete(int no) throws Exception;
}
