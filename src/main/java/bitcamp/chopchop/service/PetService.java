package bitcamp.chopchop.service;

import java.util.List;
import bitcamp.chopchop.domain.Pet;

public interface PetService {

  List<Pet> list() throws Exception;
  void insert(Pet pet) throws Exception;
  Pet get(int no) throws Exception;
  void update(Pet pet) throws Exception;
  void delete(int no) throws Exception;
  List<Pet> getPets(int no) throws Exception;
}
