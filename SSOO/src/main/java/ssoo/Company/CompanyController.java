package ssoo.Company;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CompanyController {
	@RequestMapping("/company/main.do")
	public String Main() {
		
		return "company/main";
	}
	
	@RequestMapping("/company/calendar.do")
	public String Calendar() {
		
		return "company/calendar";
	}
}
