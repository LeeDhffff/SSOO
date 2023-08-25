package ssoo.Individual;

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

import ssoo.Individual.service.IndividualService;

@Controller
public class IndividualController {

	@Resource(name = "IndividualService")
	private IndividualService IndividualService;
	
	@RequestMapping("/Individual")
	public String Individual() {
		
		return "individual/Individual";
	}
	

	@RequestMapping(value = "ListDays.do", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String ListDays(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request,
			HttpSession session) throws Exception {

		System.out.println("ListDays: " + inputMap);
		List<HashMap<String, String>> ListDays = IndividualService.ListDays(inputMap);
		System.out.println("ListDays: " + ListDays);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(ListDays);
		return jsonStr;
	}

	
}