package ssoo.Login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	@RequestMapping("/Login")
	public String Login() {
		return "login/Login";
	}

	@RequestMapping("/Join")
	public String Join() {
		return "login/Join";
	}
}