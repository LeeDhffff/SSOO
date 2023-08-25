package ssoo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {
	// 프로필
	@RequestMapping("/profile")
	public String profile() {
		return "mypage/profile";
	}
	
	// 계정설정
	@RequestMapping("/account")
	public String account() {
		return "mypage/account";
	}
	
	// 테마설정
	@RequestMapping("/theme")
	public String theme() {
		return "mypage/theme";
	}
	
	// 결제정보
	@RequestMapping("/paymentInfo")
	public String payment() {
		return "mypage/payment";
	}
}