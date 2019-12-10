package bitcamp.chopchop.domain;

import java.io.Serializable;

public class RecipeLike implements Serializable {
  private static final long serialVersionUID = 1L;
  
  private int recipeLikeNo;
  private int memberNo;
  private int recipeNo;
  
  public int getRecipeLikeNo() {
    return recipeLikeNo;
  }
  public void setRecipeLikeNo(int recipeLikeNo) {
    this.recipeLikeNo = recipeLikeNo;
  }
  public int getMemberNo() {
    return memberNo;
  }
  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }
  public int getRecipeNo() {
    return recipeNo;
  }
  public void setRecipeNo(int recipeNo) {
    this.recipeNo = recipeNo;
  }
}
