package bitcamp.chopchop.dao;

import java.util.List;
import bitcamp.chopchop.domain.Pet;

public interface PetDao {

  int insert(Pet pet) throws Exception;
  List<Pet> findAll() throws Exception;
  int update(Pet pet) throws Exception;
  Pet findBy(int no) throws Exception;
  int delete(int no) throws Exception;
  List<Pet> getPets(int no) throws Exception;
}
