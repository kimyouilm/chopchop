package bitcamp.chopchop.web;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import bitcamp.chopchop.domain.Cooking;
import bitcamp.chopchop.domain.Ingredient;
import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.domain.Recipe;
import bitcamp.chopchop.domain.RecipeLike;
import bitcamp.chopchop.service.MemberService;
import bitcamp.chopchop.service.RecipeCommentService;
import bitcamp.chopchop.service.RecipeService;

@Controller
@RequestMapping("/recipe")
@SessionAttributes("loginUser")
public class RecipeController {
  @Resource private RecipeService recipeService;
  @Resource private CookingFileWriter cookingFileWriter;
  @Resource private MemberService memberService;
  @Resource private RecipeCommentService recipeCommentService;

  String uploadDir;

  public RecipeController(ServletContext sc) {
    uploadDir = sc.getRealPath("/upload/recipe");
  }

  @GetMapping("form")
  public void form(@ModelAttribute("loginUser") Member loginUser, Model model) throws Exception {
    Member member = memberService.get(loginUser.getMemberNo());
    model.addAttribute("member", member);
  }

  @PostMapping("add")
  public String add(@ModelAttribute("loginUser") Member loginUser, Recipe recipe, MultipartFile filePath, MultipartFile[] filePath2, String[] ingredientNames, String[] quantity, String[] cookingContent, 
      int[] processNo) throws Exception {
    Member member = memberService.get(loginUser.getMemberNo());
    recipe.setMemberNo(member.getMemberNo());

    String filename = UUID.randomUUID().toString();
    recipe.setThumbnail(filename);
    filePath.transferTo(new File(uploadDir + "/" + filename));
    
    List<Ingredient> ingredients = new ArrayList<>();
    for (int i = 0; i < ingredientNames.length; i++) {
      Ingredient ingredient = new Ingredient();
      ingredient.setName(ingredientNames[i]);
      ingredient.setQuantity(quantity[i]);
      ingredients.add(ingredient);
    }
    
    recipe.setIngredients(ingredients);
    recipe.setCookings(cookingFileWriter.getCookings(filePath2, processNo, cookingContent));
    recipeService.insert(recipe);
    return "redirect:list";
  }

  @GetMapping("delete")
  public String delete(int no) throws Exception {
    recipeService.delete(no);
    return "redirect:list";
  }
  
  @GetMapping("detail")
  public void detail(Model model, int no, @ModelAttribute("loginUser") Member loginUser) throws Exception {
    Recipe recipe = recipeService.get(no);
    recipeService.insertViewCount(no);
    
    Member recipeMember = memberService.get(recipe.getMemberNo()); // 작성자멤버
    Member member = memberService.get(loginUser.getMemberNo()); // 글을 보는사람
    RecipeLike recipeLike = new RecipeLike();
    recipeLike.setMemberNo(member.getMemberNo());
    recipeLike.setRecipeNo(recipe.getRecipeNo());
    int check = recipeService.findLike(recipeLike);
    boolean likeCheck = false;
    if (check == 1) { // 좋아요햇음
      likeCheck = true;
    } else if (check == 0){ // 좋아요 안했음
      likeCheck = false;
    }
    
    switch (recipe.getCategory()) {
      case "1" : model.addAttribute("category", "강아지"); break;
      case "2" : model.addAttribute("category", "고양이"); break;
      case "3" : model.addAttribute("category", "작은동물"); break;
      case "4" : model.addAttribute("category", "기타"); break;
    }
    model.addAttribute("recipe", recipe);
    model.addAttribute("recipeMember", recipeMember);
    model.addAttribute("member", member);
    model.addAttribute("isCheck", likeCheck);
  }
  
  @GetMapping("updateform")
  public void updateform(@ModelAttribute("loginUser") Member loginUser, Model model, int no) throws Exception {
    Recipe recipe = recipeService.get(no);
    Member member = memberService.get(loginUser.getMemberNo());
    model.addAttribute("recipe", recipe);
    model.addAttribute("member", member);
  }
  
  @PostMapping("update")
  public String update(Recipe recipe, MultipartFile filePath, MultipartFile[] filePath2, int[] fileNo, String[] ingredientNames, String[] quantity, String[] cookingContent, 
      int[] processNo) throws Exception {
    //fileNo이 0인것만 인서트

    if (filePath.getSize() > 0) {
      String filename = UUID.randomUUID().toString();
      recipe.setThumbnail(filename);
      filePath.transferTo(new File(uploadDir + "/" + filename));
    }

    List<Ingredient> ingredients = new ArrayList<>();
    for (int i = 0; i < ingredientNames.length; i++) {
      Ingredient ingredient = new Ingredient();
      ingredient.setName(ingredientNames[i]);
      ingredient.setQuantity(quantity[i]);
      ingredients.add(ingredient);
    }
    recipe.setIngredients(ingredients);
    
    recipeService.deleteFile(fileNo, recipe.getRecipeNo());
    
    List<Cooking> cookings = new ArrayList<>();
    for (int i = 0; i < fileNo.length; i ++) {
      Cooking cooking = new Cooking();
      if (fileNo[i] == 0) { // 바꾼것
        String filename = UUID.randomUUID().toString();
        filePath2[i].transferTo(new File(uploadDir + "/" + filename));
        cooking.setProcessNo(processNo[i]);
        cooking.setFilePath(filename);
        cooking.setContent(cookingContent[i]);
        cookings.add(cooking);
      } else { // 파일은 안바꿨을때
        cooking.setCookingNo(fileNo[i]);
        cooking.setProcessNo(processNo[i]);
        cooking.setContent(cookingContent[i]);
        cookings.add(cooking);
      }
    }
    recipe.setCookings(cookings);
    
    recipeService.update(recipe);
    return "redirect:list";
  }

  @GetMapping("list")
  public void list(HttpSession session, Model model,
      @RequestParam(defaultValue = "1") int pageNo,
      @RequestParam(defaultValue = "16") int pageSize) throws Exception {
    if (session.getAttribute("loginUser") != null) {
      Member member = memberService.get(((Member)session.getAttribute("loginUser")).getMemberNo());
      model.addAttribute("member", member);
    } 
    List<Recipe> recipes = recipeService.list(pageNo, pageSize);
    model.addAttribute("recipes", recipes);
  }
  
  @GetMapping("rank")
  public void rank(HttpSession session, Model model) throws Exception {
    if (session.getAttribute("loginUser") != null) {
      Member member = memberService.get(((Member)session.getAttribute("loginUser")).getMemberNo());
      model.addAttribute("member", member);
    }
  }

  @GetMapping("myrecipe")
  public void myList(Model model, @ModelAttribute("loginUser") Member loginUser,
                     @RequestParam(defaultValue = "1") int pageNo,
                     @RequestParam(defaultValue = "16") int pageSize) throws Exception {
    
    Member member = memberService.get(loginUser.getMemberNo());
    model.addAttribute("member", member);
    List<Recipe> recipes = recipeService.list(pageNo, pageSize);
    List<Recipe> myrecipes = new ArrayList<>(); 
    for (Recipe recipe : recipes) {
      if (recipe.getMemberNo() != member.getMemberNo()) 
        continue;
      myrecipes.add(recipe);
    }
    model.addAttribute("myreicpes", myrecipes);
  }
  
  @GetMapping("myscrap")
  public void scrapList(Model model, @ModelAttribute("loginUser") Member loginUser) throws Exception {
    
    Member member = memberService.get(loginUser.getMemberNo());
    model.addAttribute("member", member);
    List<RecipeLike> recipeLikes = recipeService.listLike(); 
    List<Recipe> scrapRecipes = new ArrayList<>(); 
    for (RecipeLike recipeLike : recipeLikes) {
      if (recipeLike.getMemberNo() == member.getMemberNo()) {
        scrapRecipes.add(recipeService.get(recipeLike.getRecipeNo()));
      }
    }
    model.addAttribute("scrapRecipes", scrapRecipes);
  }

  @GetMapping("search")
  public void search(@ModelAttribute("loginUser") Member loginUser,Model model, String keyword) throws Exception {
    Member member = memberService.get(loginUser.getMemberNo());
    List<Recipe> recipes = recipeService.search(keyword);
    model.addAttribute("recipes", recipes);
    model.addAttribute("member", member);
  }
}