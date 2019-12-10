package bitcamp.chopchop.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import bitcamp.chopchop.dao.PetDao;
import bitcamp.chopchop.domain.Pet;
import bitcamp.chopchop.service.PetService;

@Service
public class DefaultPetService implements PetService{

  @Resource
  private PetDao petDao;
  
  @Override
  public List<Pet> list() throws Exception {
    return petDao.findAll();
  }

  @Override
  public void insert(Pet pet) throws Exception {
    petDao.insert(pet);
  }

  @Override
  public Pet get(int no) throws Exception {
    Pet pet = petDao.findBy(no);
    if (pet == null) {
      throw new Exception("해당번호의 데이터가 없음");
    }
    return pet;
  }

  @Override
  public void update(Pet pet) throws Exception {
    System.out.println("PetService"  + pet.getName());
    petDao.update(pet);
  }

  @Override
  public void delete(int no) throws Exception {
    if (petDao.delete(no) == 0) {
      throw new Exception("해당 데이터가 없음.");
    }
  }

  @Override
  public List<Pet> getPets(int no) throws Exception {
    List<Pet> pets = petDao.getPets(no);
    if (pets == null) {
      throw new Exception("해당번호의 데이터가 없음");
    }
    return pets;
  }

}