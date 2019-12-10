package bitcamp.chopchop.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.context.annotation.FilterType;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

// @Component, @Service, @Repository, @Controller annotation을 Scan해서 자동으로 Bean 등록시킴
@ComponentScan(basePackages = "bitcamp.chopchop",
    excludeFilters = {@Filter(type = FilterType.REGEX, pattern = "bitcamp.chopchop.web.*")})

@EnableWebMvc 
public class AppConfig {

}
