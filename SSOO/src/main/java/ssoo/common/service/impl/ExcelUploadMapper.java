package ssoo.common.service.impl;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("ExcelUploadMapper")
public interface ExcelUploadMapper {

	// LG계획업로드 페이지
	String excelUpload(Map<String, Object> paramMap) throws Exception;
	
	// 생산실적 페이지
	String excelUpload2(Map<String, Object> paramMap) throws Exception;

	String excelUploadUpdate(Map<String, Object> paramMap) throws Exception;
	
	
	
  
}
