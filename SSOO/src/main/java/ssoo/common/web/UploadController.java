package ssoo.common.web;

import java.io.File;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadController {

	
//	@GetMapping("")
//	public void uploadForm() {
//		System.out.println("upload Form");
//	}

	//@RequestMapping(value = "common/upload_test.do", method=RequestMethod.POST)
	@ResponseBody
	@PostMapping(value="common/upload_test.do")
	public void uploadFormPost(MultipartFile[] files, Model model){
		System.out.println("진입 !!!");
		System.out.println("files : " + files);
		
		System.out.println(files.length);
		/* 업로드한 파일 불러 오기 */
		for(MultipartFile multi : files) {
			
			multi.getSize();
			
			String oName = multi.getOriginalFilename(); // Original File Name.
			String fileExtension = oName.substring(oName.lastIndexOf("."), oName.length()); // 확장자명 자르기.
			String uploadFolder = "D:\\test\\upload";   // 저장 경로 설정.

			File saveFile = new File(uploadFolder, oName);
			try {
				multi.transferTo(saveFile);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			System.out.println("oName : "+ oName + "fileExtension : " + fileExtension);			
			
		}
	}
	
}
