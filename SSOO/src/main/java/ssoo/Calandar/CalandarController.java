package ssoo.Calandar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CalandarController {
	
	@RequestMapping("/Calandar")
	public String Calandar() {
		
		return "Calandar/Calandar";
	}
}