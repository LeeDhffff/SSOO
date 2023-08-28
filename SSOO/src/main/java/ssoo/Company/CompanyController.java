package ssoo.Company;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import ssoo.Company.service.CompanyService;

@Controller
public class CompanyController {
	
	@Resource(name = "CompanyService")
	private CompanyService CompanyService;
	
	@RequestMapping("/Company/main.do")
	public String Main() {
		
		return "company/main";
	}
	
	@RequestMapping("/Company/calendar.do")
	public String Calendar() {
		
		return "company/calendar";
	}
	
	// DB 테스트
	/*@RequestMapping(value = "/Company/test.do", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String ListDays(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request,
			HttpSession session) throws Exception {

		System.out.println("ListDays: " + inputMap);
		List<HashMap<String, String>> ListDays = CompanyService.ListDays(inputMap);
		System.out.println("ListDays: " + ListDays);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(ListDays);
		return jsonStr;
	}*/
}
