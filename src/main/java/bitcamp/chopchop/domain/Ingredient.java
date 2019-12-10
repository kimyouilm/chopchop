package bitcamp.chopchop.domain;

public class Ingredient {
  private int ingredientNo;
  private int recipeNo;
  private String name;
  private String quantity;
  

  public int getIngredientNo() {
    return ingredientNo;
  }
  public void setIngredientNo(int ingredientNo) {
    this.ingredientNo = ingredientNo;
  }
  public int getRecipeNo() {
    return recipeNo;
  }
  public void setRecipeNo(int recipeNo) {
    this.recipeNo = recipeNo;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public String getQuantity() {
    return quantity;
  }
  public void setQuantity(String quantity) {
    this.quantity = quantity;
  }
  
}

