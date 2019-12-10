package bitcamp.chopchop.domain;

import java.io.Serializable;
import java.sql.Date;

public class Pet implements Serializable {
  private static final long serialVersionUID = 1L;

  private int memberNo;
  private int petNo;
  private String name;
  private Date createdDate;
  private int registerNo;
  private int gender;
  private int age;
  private String filePath;
  private String breed;
  
  public int getPetNo() {
    return petNo;
  }

  public void setPetNo(int petNo) {
    this.petNo = petNo;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public Date getCreatedDate() {
    return createdDate;
  }

  public void setCreatedDate(Date createdDate) {
    this.createdDate = createdDate;
  }

  public int getRegisterNo() {
    return registerNo;
  }

  public void setRegisterNo(int registerNo) {
    this.registerNo = registerNo;
  }

  public int getGender() {
    return gender;
  }

  public void setGender(int gender) {
    this.gender = gender;
  }

  public int getAge() {
    return age;
  }

  public void setAge(int age) {
    this.age = age;
  }

  public String getBreed() {
    return breed;
  }

  public void setBreed(String breed) {
    this.breed = breed;
  }

  public int getMemberNo() {
    return memberNo;
  }

  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }

  public String getFilePath() {
    return filePath;
  }

  public void setFilePath(String filePath) {
    this.filePath = filePath;
  }

}
