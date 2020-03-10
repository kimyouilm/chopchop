package bitcamp.chopchop.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.context.annotation.FilterType;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

// @Component, @Service, @Repository, @Controller annotation을 Scan해서 자동으로 Bean 등록시킴
// basePackageClasses = ~~.class
@ComponentScan(basePackages = "bitcamp.chopchop",
    excludeFilters = {@Filter(type = FilterType.REGEX, pattern = "bitcamp.chopchop.web.*")})

// Annotation 기반의 SpringMVC를 구성할 때 필요한 Bean설정들을 자동으로 해주는 Annotation, 기본적으로 등록해주는 Bean들 이외에 추가적으로 개발자가 필요로하는 Bean들을 손쉽게 등록할 수 있도록 도와줌.
@EnableWebMvc 
public class AppConfig {

}
