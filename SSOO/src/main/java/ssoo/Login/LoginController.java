package ssoo.Login;

import java.io.PrintWriter;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import ssoo.TempKey;
import ssoo.Login.service.LoginService;

@Controller
public class LoginController {
	private JavaMailSender javaMailSender;
	
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

		System.out.println("inputMap:"+inputMap);
		HashMap<String, String> LoginList = loginService.signin(inputMap);
		System.out.println(LoginList.get("resultMsg"));

		if(LoginList.get("resultMsg").equals("0")) {
		
			ObjectMapper mapper = new ObjectMapper();
			String jsonStr = mapper.writeValueAsString(LoginList);
			return jsonStr;
		}else {
			HttpSession httpSession = request.getSession(true);
			httpSession.setAttribute("SESSION_COD_MEMB", LoginList.get("ID"));
			httpSession.setAttribute("SESSION_NAM_KOR", LoginList.get("USERNAME"));
			httpSession.setAttribute("SESSION_NICK", LoginList.get("NICKNAME"));
			httpSession.setMaxInactiveInterval(24*60*60);
			
			System.out.println("inputMap:: "+inputMap);
			System.out.println("세션:: "+(String)httpSession.getAttribute("SESSION_COD_MEMB")+(String)httpSession.getAttribute("SESSION_NAM_KOR"));
			
			ObjectMapper mapper = new ObjectMapper();
			String jsonStr = mapper.writeValueAsString(LoginList);
			return jsonStr;
		}
		
	}
	

	@RequestMapping(value = "Logout.do")
	@ResponseBody
	public String Logout(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView();
		HttpSession httpSession = request.getSession(true);
		httpSession.invalidate();
		
		return "";
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
	
	@RequestMapping(value = "emailCheck.do", method=RequestMethod.POST)
	@ResponseBody
	public void mailSending(@RequestParam String email,HttpServletResponse res) {
		System.out.println(email);
		String setfrom = "bear00002@gmail.com";       
	 	String key = new TempKey().getKey(50, false);
	 	
	    String tomail  = email;     // 받는 사람 이메일
	    String title = "인증번호 발송";
	    String content = new StringBuffer().
	    		append("제공되는 키를 회원가입창에 입력해주세요 키값은 : ").
	    		append(key).
	    		append(" 입니다.").
	    		toString();

	    try {
	    	
	     res.setContentType("UTF-8");
		      
		 PrintWriter writer = res.getWriter();
		      
		  writer.print(key);	
	      MimeMessage message = javaMailSender.createMimeMessage();
	      MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	 
	      messageHelper.setFrom(setfrom,"JTM");  // 보내는사람 생략하거나 하면 정상작동을 안함 두번째 인자값은 보낼때의 이름이다.
	      messageHelper.setTo(tomail);     // 받는사람 이메일
	      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	      messageHelper.setText(content);  // 메일 내용
	     
	      javaMailSender.send(message);
	      
	    } catch(Exception e){
	      System.out.println(e);
	    }
	   
	  }
}