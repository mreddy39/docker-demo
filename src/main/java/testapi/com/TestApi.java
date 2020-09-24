package testapi.com;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;

@SpringBootApplication
public class TestApi {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SpringApplication.run(TestApi.class, args);

	}
	@GetMapping("/")
	public String readinessProbe() {
		return "Hello WORLD MicroService: ";
	}

}
