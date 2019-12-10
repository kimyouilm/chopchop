package bitcamp.chopchop.service;

import java.util.List;

import bitcamp.chopchop.domain.Event;

public interface EventService {
  List<Event> list() throws Exception;
  Event get(int no) throws Exception;
  void insert(Event event) throws Exception;
  void update(Event event) throws Exception;
  void delete(int no) throws Exception;
}


