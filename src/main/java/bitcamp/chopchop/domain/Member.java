package bitcamp.chopchop.domain;

import java.io.Serializable;
import java.util.List;

public class Member implements Serializable {
  private static final long serialVersionUID = 1L;

  private int memberNo;
  private String nickname;
  private String email;
  private String password;
  private String tel;
  private String photo;
  private String postNo;
  private String baseAddress;
  private String detailAddress;
  private int grade;
  
  private List<Recipe> recipes;
  private List<Pet> pets;

  public List<Pet> getPets() {
    return pets;
  }

  public void setPets(List<Pet> pets) {
    this.pets = pets;
  }

  public int getMemberNo() {
    return memberNo;
  }

  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }

  public String getNickname() {
    return nickname;
  }

  public void setNickname(String nickname) {
    this.nickname = nickname;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getTel() {
    return tel;
  }

  public void setTel(String tel) {
    this.tel = tel;
  }

  public String getPhoto() {
    return photo;
  }

  public void setPhoto(String photo) {
    this.photo = photo;
  }

  public String getPostNo() {
    return postNo;
  }

  public void setPostNo(String postNo) {
    this.postNo = postNo;
  }

  public String getBaseAddress() {
    return baseAddress;
  }

  public void setBaseAddress(String baseAddress) {
    this.baseAddress = baseAddress;
  }

  public String getDetailAddress() {
    return detailAddress;
  }

  public void setDetailAddress(String detailAddress) {
    this.detailAddress = detailAddress;
  }

  public int getGrade() {
    return grade;
  }

  public void setGrade(int grade) {
    this.grade = grade;
  }

  public List<Recipe> getRecipes() {
    return recipes;
  }

  public void setRecipes(List<Recipe> recipes) {
    this.recipes = recipes;
  }

  @Override
  public String toString() {
    return "Member [memberNo=" + memberNo + ", nickname=" + nickname + ", email=" + email
        + ", password=" + password + ", tel=" + tel + ", photo=" + photo + ", postNo=" + postNo
        + ", baseAddress=" + baseAddress + ", detailAddress=" + detailAddress + ", grade=" + grade
        + ", recipes=" + recipes + ", pets=" + pets + "]";
  }
  
}
