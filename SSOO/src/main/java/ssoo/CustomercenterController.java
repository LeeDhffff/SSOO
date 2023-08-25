package ssoo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomercenterController {
	@RequestMapping("/notice")
	public String notice() {
		return "index";
	}
	
	@RequestMapping("/qna")
	public String qna() {
		return "index";
	}
	
	@RequestMapping("/faq")
	public String faq() {
		return "index";
	}
	
	@RequestMapping("/policy")
	public String policy() {
		return "cc/policy";
	}
}