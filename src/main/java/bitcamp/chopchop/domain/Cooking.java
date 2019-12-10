package bitcamp.chopchop.domain;

public class Cooking {
  
  private int cookingNo;
  private int recipeNo;
  private int processNo;
  private String filePath;
  private String content;
  
  public int getCookingNo() {
    return cookingNo;
  }
  public void setCookingNo(int cookingNo) {
    this.cookingNo = cookingNo;
  }
  public int getRecipeNo() {
    return recipeNo;
  }
  public void setRecipeNo(int recipeNo) {
    this.recipeNo = recipeNo;
  }
  public int getProcessNo() {
    return processNo;
  }
  public void setProcessNo(int processNo) {
    this.processNo = processNo;
  }
  public String getFilePath() {
    return filePath;
  }
  public void setFilePath(String filePath) {
    this.filePath = filePath;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  
}