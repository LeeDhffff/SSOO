package ssoo.Company.service;

import java.util.HashMap;
import java.util.List;

public interface CompanyService {
	
	// 팀 생성
	HashMap<String, String> TEAM_CREATE(HashMap<String, Object> inputMap) throws Exception;
	
	// 팀 조회
	HashMap<String, String> TEAM_SEARCH(HashMap<String, Object> inputMap) throws Exception;
	
	List<HashMap<String,String>> Company_Calendar_Select(HashMap<String, Object> inputMap) throws Exception;
	HashMap<String, String> Company_Calendar_Insert(HashMap<String, Object> inputMap) throws Exception;
	HashMap<String, String> Company_Calendar_Delete(HashMap<String, Object> inputMap) throws Exception;
	
	List<HashMap<String,String>> Company_BK_SEARCH(HashMap<String, Object> inputMap) throws Exception;
	HashMap<String, String> Company_BK_INSERT(HashMap<String, Object> inputMap) throws Exception;
}
