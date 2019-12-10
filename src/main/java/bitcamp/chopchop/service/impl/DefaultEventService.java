package bitcamp.chopchop.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import bitcamp.chopchop.dao.EventDao;
import bitcamp.chopchop.dao.EventPhotoFileDao;
import bitcamp.chopchop.domain.Event;
import bitcamp.chopchop.domain.EventPhotoFile;
import bitcamp.chopchop.service.EventService;

@Service
public class DefaultEventService implements EventService {

  @Resource
  private EventDao eventDao;
  @Resource
  private EventPhotoFileDao eventPhotoFileDao;

  @Transactional
  @Override
  public void insert(Event event) throws Exception {

    if(event.getFiles().size() == 0) {
      throw new Exception("사진 파일이 없습니다.");
    }

    eventDao.insert(event);
    for (EventPhotoFile file : event.getFiles()) {
      file.setEventNo(event.getEventNo());
      eventPhotoFileDao.insert(file);
    }
  }
  
  @Transactional
  @Override
  public void delete(int no) throws Exception {
    if (eventDao.findBy(no) == null) {
      throw new Exception("해당 데이터가 없습니다.");
    }
    eventPhotoFileDao.deleteAll(no);
    eventDao.delete(no);
  }

  @Override
  public Event get(int no) throws Exception {
    Event event = eventDao.findBy(no);
    if (event == null) {
      throw new Exception("해당 번호의 데이터가 없습니다!");
    }
    eventDao.increaseViewCount(no);
    return event;
  }

  @Override
  public List<Event> list() throws Exception {
    return eventDao.findAll();
  }
  
  @Transactional
  @Override
  public void update(Event event) throws Exception {
    eventDao.update(event);
    
    if(event.getFiles().size() > 0) {
      eventPhotoFileDao.deleteAll(event.getEventNo());
      for (EventPhotoFile file : event.getFiles()) {
        file.setEventNo(event.getEventNo());
        eventPhotoFileDao.insert(file);
      }
    }
  }
}
