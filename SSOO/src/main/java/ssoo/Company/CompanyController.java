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
	
	@RequestMapping(value = "/Company/TEAM_CREATE.do", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String TEAM_CREATE(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception{
		HashMap<String, String> team = CompanyService.TEAM_CREATE(inputMap);
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(team);
		
		return jsonStr;
	}
	
	@RequestMapping(value = "/Company/TEAM_SEARCH.do", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String TEAM_SEARCH(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		HashMap<String, String> LoginList = CompanyService.TEAM_SEARCH(inputMap);
		System.out.println(LoginList.get("resultMsg"));

		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(LoginList);
		return jsonStr;
	}
	
	
	@RequestMapping(value = "/Company/Calendar_Select.do", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Company_Calendar_Select(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		List<HashMap<String, String>> LoginList = CompanyService.Company_Calendar_Select(inputMap);
		System.out.println(LoginList);

		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(LoginList);
		return jsonStr;
	}
	
	@RequestMapping(value = "/Company/Calendar_Insert.do", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Company_Calendar_Insert(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception{
		HashMap<String, String> team = CompanyService.Company_Calendar_Insert(inputMap);
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(team);
		
		return jsonStr;
	}
	
	@RequestMapping(value = "/Company/Calendar_Delete.do", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Company_Calendar_Delete(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception{
		HashMap<String, String> team = CompanyService.Company_Calendar_Delete(inputMap);
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(team);
		
		return jsonStr;
	}
	
	@RequestMapping(value = "/Company/BK_SEARCH.do", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Company_BK_SEARCH(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		List<HashMap<String, String>> LoginList = CompanyService.Company_BK_SEARCH(inputMap);
		System.out.println(LoginList);

		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(LoginList);
		return jsonStr;
	}
	
	@RequestMapping(value = "/Company/BK_INSERT.do", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Company_BK_INSERT(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception{
		HashMap<String, String> team = CompanyService.Company_BK_INSERT(inputMap);
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(team);
		
		return jsonStr;
	}
}
