package bitcamp.chopchop.domain;


import java.io.Serializable;
import java.sql.Date;
import java.util.List;
import com.fasterxml.jackson.annotation.JsonFormat;

public class Recipe implements Serializable {
  private static final long serialVersionUID = 1L;
  
  private int recipeNo;
  private int memberNo;
  private String title;
  
  @JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
  private Date createdDate;
  private int viewCount;
  private String content;
  private String thumbnail;
  private String category;
  private String tag;
  private String otherInfo;
  private int scrap;

  // 자식테이블 'ingredient'의 데이터를 담을 Ingredient 객체 목록.
  private List<Ingredient> ingredients;
  // 자식테이블 'Cooking'의 데이터를 담을 Cooking 객체 목록.
  private List<Cooking> cookings;
  // 자식테이블 'RecipeLike'의 데이터를 담을 RecipeLike 객체 목록.
  private List<RecipeLike> recipeLikes;
  // 자식테이블 'RecipeComment"의 데이터를 담을 RecipeComment 객체 목록.
  private List<RecipeComment> recipeComments;
  
  private List<Member> members;
  
  @Override
  public String toString() {
    return "Recipe [recipeNo=" + recipeNo + ", memberNo=" + memberNo + ", title=" + title
        + ", createdDate=" + createdDate + ", viewCount=" + viewCount + ", content=" + content
        + ", thumbnail=" + thumbnail + ", category=" + category + ", tag=" + tag + ", otherInfo="
        + otherInfo + ", scrap=" + scrap + ", ingredients=" + ingredients + ", cookings=" + cookings
        + ", recipeLikes=" + recipeLikes + ", recipeComments=" + recipeComments + ", members="
        + members + "]";
  }
  public List<RecipeLike> getRecipeLikes() {
    return recipeLikes;
  }
  public void setRecipeLikes(List<RecipeLike> recipeLikes) {
    this.recipeLikes = recipeLikes;
  }
  public int getRecipeNo() {
    return recipeNo;
  }
  public void setRecipeNo(int recipeNo) {
    this.recipeNo = recipeNo;
  }
  public int getMemberNo() {
    return memberNo;
  }
  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public Date getCreatedDate() {
    return createdDate;
  }
  public void setCreatedDate(Date createdDate) {
    this.createdDate = createdDate;
  }
  public int getViewCount() {
    return viewCount;
  }
  public void setViewCount(int viewCount) {
    this.viewCount = viewCount;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public String getThumbnail() {
    return thumbnail;
  }
  public void setThumbnail(String thumbnail) {
    this.thumbnail = thumbnail;
  }
  public String getCategory() {
    return category;
  }
  public void setCategory(String category) {
    this.category = category;
  }
  public String getTag() {
    return tag;
  }
  public void setTag(String tag) {
    this.tag = tag;
  }
  public String getOtherInfo() {
    return otherInfo;
  }
  public void setOtherInfo(String otherInfo) {
    this.otherInfo = otherInfo;
  }
  public int getScrap() {
    return scrap;
  }
  public void setScrap(int scrap) {
    this.scrap = scrap;
  }
  public List<Cooking> getCookings() {
    return cookings;
  }
  public void setCookings(List<Cooking> cookings) {
    this.cookings = cookings;
  }
  public List<Ingredient> getIngredients() {
    return ingredients;
  }
  public void setIngredients(List<Ingredient> ingredients) {
    this.ingredients = ingredients;
  }
  public List<RecipeComment> getRecipeComments() {
    return recipeComments;
  }
  public void setRecipeComments(List<RecipeComment> recipeComments) {
    this.recipeComments = recipeComments;
  }
  public List<Member> getMembers() {
    return members;
  }
  public void setMembers(List<Member> members) {
    this.members = members;
  }
  

}