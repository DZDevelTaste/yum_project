package ant.yum.yum_project;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@ComponentScan(basePackages={"ant.yum.controller","ant.yum.repository","ant.yum.service"})
@SpringBootApplication
public class YumApplication {
	public static void main(String[] args) {
		SpringApplication.run(YumApplication.class, args);
	}
}
