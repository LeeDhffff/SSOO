package ssoo.Main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	

	@RequestMapping("/Main")
	public String Main() {
		return "index";
	}
	

	@RequestMapping("/mypage")
	public String mypage() {
		return "mypage/mypage";
	}
	
	@RequestMapping("/store")
	public String store() {
		return "store/main";
	}
	
	@RequestMapping("/customercenter")
	public String customer_center() {
		return "cc/main";
	}
}