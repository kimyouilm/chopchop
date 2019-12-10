package bitcamp.chopchop.config;

import javax.servlet.Filter;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

// 스프링은 웹 모듈내에 이미 ServletContainerInitializer를 구현한 클래스가 포함되어 있고,
// 이는 WebApplicationInitializer 인터페이스를 구현한 클래스를 찾아 초기화 작업을 위임하는 역할을 수행한다.
public class AppWebApplicationInitializer 
  extends AbstractAnnotationConfigDispatcherServletInitializer {

  @Override
  protected Class<?>[] getRootConfigClasses() {
    return new Class<?>[] {AppConfig.class, DatabaseConfig.class, MybatisConfig.class};
  }

  @Override
  protected Class<?>[] getServletConfigClasses() {
    return new Class<?>[] {WebConfig.class};
  }

  @Override
  protected String[] getServletMappings() {
    return new String[] {"/app/*"};
  }

  @Override
  protected String getServletName() {
    return "app";
  }

  @Override
  protected Filter[] getServletFilters() {
    return new Filter[] {
        new CharacterEncodingFilter("UTF-8")
        /*, new AuthFilter()*/};
  }
}
