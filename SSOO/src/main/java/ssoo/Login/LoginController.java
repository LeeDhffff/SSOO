package ssoo.Login;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import ssoo.Login.service.LoginService;

@Controller
public class LoginController {
	@Resource(name = "LoginService")
	private LoginService loginService;
	
	@RequestMapping("/Login.do")
	public String Login() {
		return "login/Login";
	}

	@RequestMapping("/Join.do")
	public String Join() {
		return "login/Join";
	}
	
	@RequestMapping("/Find.do")
	public String Find() {
		return "login/Find";
	}
	
	@RequestMapping(value = "/signIn.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String signin(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		HashMap<String, String> LoginList = loginService.signin(inputMap);
		System.out.println(LoginList.get("resultMsg"));

		if(LoginList.get("resultMsg").equals("0")) {
		
			ObjectMapper mapper = new ObjectMapper();
			String jsonStr = mapper.writeValueAsString(LoginList);
			return jsonStr;
		}else {
			HttpSession httpSession = request.getSession(true);
			httpSession.setAttribute("SESSION_COD_MEMB", LoginList.get("ID"));
			httpSession.setMaxInactiveInterval(24*60*60);
			
			System.out.println("inputMap:: "+inputMap);
			System.out.println("세션:: "+(String)httpSession.getAttribute("SESSION_COD_MEMB")+(String)httpSession.getAttribute("SESSION_NAM_KOR"));
			
			ObjectMapper mapper = new ObjectMapper();
			String jsonStr = mapper.writeValueAsString(LoginList);
			return jsonStr;
		}
		
	}
	
	@RequestMapping(value = "/signUp.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String signUp(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request,
			HttpSession session) throws Exception{
		HashMap<String, String> ListDays = loginService.signup(inputMap);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(ListDays);
		
		return jsonStr;
	}
	
	@RequestMapping(value = "/id_chk.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String id_chk(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		HashMap<String, String> LoginList = loginService.id_chk(inputMap);
		System.out.println(LoginList.get("resultMsg"));

		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(LoginList);
		return jsonStr;
	}
	
	@RequestMapping(value = "/find_id.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String find_id(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		HashMap<String, String> LoginList = loginService.find_id(inputMap);
		System.out.println(LoginList.get("resultMsg"));

		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(LoginList);
		return jsonStr;
	}
	
	@RequestMapping(value = "/find_pw.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String find_pw(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		HashMap<String, String> LoginList = loginService.find_pw(inputMap);
		System.out.println(LoginList.get("resultMsg"));

		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(LoginList);
		return jsonStr;
	}
}