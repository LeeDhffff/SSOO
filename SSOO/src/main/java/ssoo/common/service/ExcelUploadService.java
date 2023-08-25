package ssoo.common.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;

public interface ExcelUploadService {

	// LG계획업로드 페이지
	public String excelUpload(File file, HashMap<String, Object> inputMap) throws Exception;
	
	// 생산실적 페이지
	public String excelUpload2(File file, HashMap<String, Object> inputMap) throws Exception;
	
	public String excelUploadUpdate(File file, HashMap<String, Object> inputMap) throws Exception;
	
	
}
