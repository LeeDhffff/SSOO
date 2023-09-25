package ssoo.Individual;

import java.io.File;
import java.text.SimpleDateFormat;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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

		System.out.println("개인_달력 조회 input: " + inputMap);
		List<HashMap<String, String>> ListDays = IndividualService.ListDays(inputMap);
		System.out.println("개인_달력 조회 result: " + ListDays);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(ListDays);
		return jsonStr;
	}
	
	@RequestMapping(value = "Individual_Calendar_Insert.do", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Individual_Calendar_Insert(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request,
			HttpSession session) throws Exception {

		System.out.println("개인_달력 등록 input: " + inputMap);
		HashMap<String, String> ListDays = IndividualService.Individual_Calendar_Insert(inputMap);
		System.out.println("개인_달력 등록 result: " + ListDays);

		
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(ListDays);
		
		return jsonStr;
	}
	

	@RequestMapping(value = "Individual_Calendar_Update.do", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Individual_Calendar_Update(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request,
			HttpSession session) throws Exception {

		System.out.println("개인_달력 수정 input: " + inputMap);
		String ListDays = IndividualService.Individual_Calendar_Update(inputMap);
		System.out.println("개인_달력 수정 result: " + ListDays);

		return ListDays;
	}
	

	@RequestMapping(value = "Individual_Calendar_Delete.do", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Individual_Calendar_Delete(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request,
			HttpSession session) throws Exception {

		System.out.println("개인_달력 삭제 input: " + inputMap);
		String ListDays = IndividualService.Individual_Calendar_Delete(inputMap);
		System.out.println("개인_달력 삭제 result: " + ListDays);

		return ListDays;
	}
	

	@RequestMapping(value = "ListTodo.do", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String ListTodo(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request,
			HttpSession session) throws Exception {

		System.out.println("개인_Todo 조회 input: " + inputMap);
		List<HashMap<String, String>> ListDays = IndividualService.ListTodo(inputMap);
		System.out.println("개인_Todo 조회 result: " + ListDays);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(ListDays);
		return jsonStr;
	}
	


	@RequestMapping(value = "ListTodo_Trash.do", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String ListTodo_Trash(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request,
			HttpSession session) throws Exception {

		System.out.println("개인_Todo 휴지통 조회 input: " + inputMap);
		List<HashMap<String, String>> ListDays = IndividualService.ListTodo_Trash(inputMap);
		System.out.println("개인_Todo 휴지통 조회 result: " + ListDays);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(ListDays);
		return jsonStr;
	}
	
	
	@RequestMapping(value = "Individual_Todo_Insert.do", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Individual_Todo_Insert(@RequestParam("uploadFile") List<MultipartFile> uploadFile, @RequestParam HashMap<String, Object> inputMap, HttpServletRequest request, MultipartHttpServletRequest mRequest,
			HttpSession session) throws Exception {


		System.out.println("uploadFile.size : "+uploadFile.size());
		
		String path1 = "D:\\upload\\todoFile";
		File savePath1 = new File(path1);
		if(!savePath1.exists()) savePath1.mkdir();

		
		SimpleDateFormat now = new SimpleDateFormat("yyyyMMddhhmmss");		
		
		for(int i=0; i<uploadFile.size(); i++) {
			
			String today = now.format(System.currentTimeMillis());
			String oName = uploadFile.get(i).getOriginalFilename();
			String ext = oName.substring(oName.lastIndexOf(".")+1);
			if(!oName.equals("")) {
				oName = today+"_"+oName.substring(oName.lastIndexOf("\\")+1);
			}
			System.out.println("oName : " + oName + ", " + "확장자 : " + ext);

			inputMap.put("PATH_TODO", path1);

			File saveFile = new File(path1, oName);
			try {
				if(!oName.equals("")) {
					uploadFile.get(i).transferTo(saveFile);
					inputMap.put("PATH_TODO_NM", oName);
					inputMap.put("FILE_NAME", uploadFile.get(i).getOriginalFilename());
					System.out.println("업로드 성공 :" + "PATH_TODO");
				}
				else {
					System.out.println("해당파일 없음 :" + "PATH_TODO");
				}
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}				
		}	
		if(uploadFile.size() == 0) {
			inputMap.put("PATH_TODO", "");
			inputMap.put("PATH_TODO_NM", "");
			inputMap.put("FILE_NAME", "");
		}
		
		System.out.println("개인_Todo 등록 input: " + inputMap);
		String ListDays = IndividualService.Individual_Todo_Insert(inputMap);
		System.out.println("개인_Todo 등록 result: " + ListDays);

		
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(ListDays);
		
		return jsonStr;
	}
	
	@RequestMapping(value = "Individual_Todo_Update.do", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Individual_Todo_Update(@RequestParam("uploadFile") List<MultipartFile> uploadFile, @RequestParam HashMap<String, Object> inputMap, HttpServletRequest request, MultipartHttpServletRequest mRequest,
			HttpSession session) throws Exception {

		System.out.println("uploadFile.size : "+uploadFile.size());
		
		String path1 = "D:\\upload\\todoFile";
		File savePath1 = new File(path1);
		if(!savePath1.exists()) savePath1.mkdir();

		
		SimpleDateFormat now = new SimpleDateFormat("yyyyMMddhhmmss");		
		
		for(int i=0; i<uploadFile.size(); i++) {
			
			String today = now.format(System.currentTimeMillis());
			String oName = uploadFile.get(i).getOriginalFilename();
			String ext = oName.substring(oName.lastIndexOf(".")+1);
			if(!oName.equals("")) {
				oName = today+"_"+oName.substring(oName.lastIndexOf("\\")+1);
			}
			System.out.println("oName : " + oName + ", " + "확장자 : " + ext);

			inputMap.put("PATH_TODO", path1);

			File saveFile = new File(path1, oName);
			try {
				if(!oName.equals("")) {
					uploadFile.get(i).transferTo(saveFile);
					inputMap.put("PATH_TODO_NM", oName);
					inputMap.put("FILE_NAME", uploadFile.get(i).getOriginalFilename());
					System.out.println("업로드 성공 :" + "PATH_TODO");
				}
				else {
					System.out.println("해당파일 없음 :" + "PATH_TODO");
				}
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}				
		}	
		if(uploadFile.size() == 0) {
			inputMap.put("PATH_TODO", "");
			inputMap.put("PATH_TODO_NM", "");
			inputMap.put("FILE_NAME", "");
		}
		
		System.out.println("개인_Todo 수정 input: " + inputMap);
		String ListDays = IndividualService.Individual_Todo_Update(inputMap);
		System.out.println("개인_Todo 수정 result: " + ListDays);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(ListDays);
		
		return jsonStr;
	}

	@RequestMapping(value = "Individual_Todo_Delete.do", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Individual_Todo_Delete(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request,
			HttpSession session) throws Exception {

		System.out.println("개인_Todo 삭제 input: " + inputMap);
		String ListDays = IndividualService.Individual_Todo_Delete(inputMap);
		System.out.println("개인_Todo 삭제 result: " + ListDays);

		
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(ListDays);
		
		return jsonStr;
	}
	
	@RequestMapping(value = "Individual_Todo_Move_Update.do", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Individual_Todo_Move_Update(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request,
			HttpSession session) throws Exception {

		System.out.println("개인_Todo 이동 input: " + inputMap);
		String ListDays = IndividualService.Individual_Todo_Move_Update(inputMap);
		System.out.println("개인_Todo 이동 result: " + ListDays);

		
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(ListDays);
		
		return jsonStr;
	}
	
	@RequestMapping(value = "Individual_Todo_Trash_Insert.do", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Individual_Todo_Trash_Insert(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request,
			HttpSession session) throws Exception {

		System.out.println("개인_Todo 등록 input: " + inputMap);
		String ListDays = IndividualService.Individual_Todo_Trash_Insert(inputMap);
		System.out.println("개인_Todo 등록 result: " + ListDays);

		
		return ListDays;
	}
	
	

	@RequestMapping(value = "ListMission.do", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String ListMission(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request,
			HttpSession session) throws Exception {

		System.out.println("개인_미션 조회 input: " + inputMap);
		List<HashMap<String, String>> ListDays = IndividualService.ListMission(inputMap);
		System.out.println("개인_미션 조회 result: " + ListDays);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(ListDays);
		return jsonStr;
	}
	
	

	@RequestMapping(value = "ListCharacter.do", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String ListCharacter(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request,
			HttpSession session) throws Exception {

		System.out.println("개인_캐릭터 조회 input: " + inputMap);
		HashMap<String, String> ListDays = IndividualService.ListCharacter(inputMap);
		System.out.println("개인_캐릭터 조회 result: " + ListDays);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(ListDays);
		return jsonStr;
	}
	
	@RequestMapping(value = "Character_Insert.do", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Character_Insert(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request,
			HttpSession session) throws Exception {

		System.out.println("개인_캐릭터 등록 input: " + inputMap);
		String ListDays = IndividualService.Character_Insert(inputMap);
		System.out.println("개인_캐릭터 등록 result: " + ListDays);

		
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(ListDays);
		
		return jsonStr;
	}
	
	@RequestMapping(value = "Character_Update.do", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Character_Update(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request,
			HttpSession session) throws Exception {

		System.out.println("개인_캐릭터 수정 input: " + inputMap);
		String ListDays = IndividualService.Character_Update(inputMap);
		System.out.println("개인_캐릭터 수정 result: " + ListDays);

		
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(ListDays);
		
		return jsonStr;
	}
	
	@RequestMapping(value = "TodaysMission.do", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String TodaysMission(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request,
			HttpSession session) throws Exception {

		System.out.println("오늘의 미션 input: " + inputMap);
		String ListDays = IndividualService.TodaysMission(inputMap);
		System.out.println("오늘의 미션 result: " + ListDays);

		
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(ListDays);
		
		return jsonStr;
	}

	@RequestMapping(value = "TodaysMission_Insert.do", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String TodaysMission_Insert(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request,
			HttpSession session) throws Exception {

		System.out.println("미션 등록 input: " + inputMap);
		String ListDays = IndividualService.TodaysMission_Insert(inputMap);
		System.out.println("미션 등록 result: " + ListDays);

		
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(ListDays);
		
		return jsonStr;
	}

	@RequestMapping(value = "TodaysMission_Update.do", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String TodaysMission_Update(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request,
			HttpSession session) throws Exception {

		System.out.println("미션 수정 input: " + inputMap);
		String ListDays = IndividualService.TodaysMission_Update(inputMap);
		System.out.println("미션 수정 result: " + ListDays);

		
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(ListDays);
		
		return jsonStr;
	}


	@RequestMapping(value = "TodaysMission_Delete.do", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String TodaysMission_Delete(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request,
			HttpSession session) throws Exception {

		System.out.println("미션 삭제 input: " + inputMap);
		String ListDays = IndividualService.TodaysMission_Delete(inputMap);
		System.out.println("미션 삭제 result: " + ListDays);

		
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(ListDays);
		
		return jsonStr;
	}

	
	@RequestMapping(value = "TodaysMission_Complete.do", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String TodaysMission_Complete(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request,
			HttpSession session) throws Exception {

		System.out.println("미션 성공 input: " + inputMap);
		String ListDays = IndividualService.TodaysMission_Complete(inputMap);
		System.out.println("미션 성공 result: " + ListDays);

		
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(ListDays);
		
		return jsonStr;
	}
}