package ssoo.Company.service.impl;

import java.util.HashMap;
import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("CompanyMapper")
public interface CompanyMapper {
	// 팀 생성
	HashMap<String, String> TEAM_CREATE(HashMap<String, Object> inputMap) throws Exception;
	// 팀 가입
	HashMap<String, String> TEAM_JOIN(HashMap<String, Object> inputMap) throws Exception;
	// 팀 조회
	HashMap<String, String> TEAM_SEARCH(HashMap<String, Object> inputMap) throws Exception;
	// 소속팀 조회
	List<HashMap<String,String>> TEAM_SELECT(HashMap<String, Object> inputMap) throws Exception;
	
	List<HashMap<String,String>> Company_Calendar_Select(HashMap<String, Object> inputMap) throws Exception;
	HashMap<String, String> Company_Calendar_Insert(HashMap<String, Object> inputMap) throws Exception;
	HashMap<String, String> Company_Calendar_Delete(HashMap<String, Object> inputMap) throws Exception;
	
	List<HashMap<String,String>> Company_BK_SEARCH(HashMap<String, Object> inputMap) throws Exception;
	HashMap<String, String> Company_BK_INSERT(HashMap<String, Object> inputMap) throws Exception;
	
	List<HashMap<String,String>> Today_Schedule(HashMap<String, Object> inputMap) throws Exception;
	
	HashMap<String, String> edit_profile(HashMap<String, Object> inputMap) throws Exception;
	List<HashMap<String,String>> select_profile(HashMap<String, Object> inputMap) throws Exception;

	String pwd_profile(HashMap<String, Object> inputMap) throws Exception;
	
	// 공지사항
	HashMap<String, String> NOTICE_INSERT(HashMap<String, Object> inputMap) throws Exception;
	HashMap<String, String> NOTICE_UPDATE(HashMap<String, Object> inputMap) throws Exception;
	HashMap<String, String> NOTICE_DELETE(HashMap<String, Object> inputMap) throws Exception;
	List<HashMap<String,String>> LIST_NOTICE(HashMap<String, Object> inputMap) throws Exception;
	List<HashMap<String,String>> NOTICE_SELECT(HashMap<String, Object> inputMap) throws Exception;
}
