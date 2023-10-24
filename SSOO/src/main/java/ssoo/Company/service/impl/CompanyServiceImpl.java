package ssoo.Company.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ssoo.Company.service.CompanyService;

@Service("CompanyService")
public class CompanyServiceImpl implements CompanyService {

	@Resource(name = "CompanyMapper")
	private CompanyMapper CompanyMapper;
	
	// 팀 생성
	@Override
	public HashMap<String, String> TEAM_CREATE(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return CompanyMapper.TEAM_CREATE(inputMap);
	}
	// 팀 가입
	@Override
	public HashMap<String, String> TEAM_JOIN(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return CompanyMapper.TEAM_JOIN(inputMap);
	}
	// 팀 조회
	@Override
	public HashMap<String, String> TEAM_SEARCH(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return CompanyMapper.TEAM_SEARCH(inputMap);
	}
	// 소속팀 조회
	@Override
	public List<HashMap<String, String>> TEAM_SELECT(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return CompanyMapper.TEAM_SELECT(inputMap);
	}
	
	@Override
	public List<HashMap<String, String>> Company_Calendar_Select(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return CompanyMapper.Company_Calendar_Select(inputMap);
	}
	
	@Override
	public HashMap<String, String> Company_Calendar_Insert(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return CompanyMapper.Company_Calendar_Insert(inputMap);
	}
	
	@Override
	public HashMap<String, String> Company_Calendar_Delete(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return CompanyMapper.Company_Calendar_Delete(inputMap);
	}
	
	
	@Override
	public List<HashMap<String, String>> Company_BK_SEARCH(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return CompanyMapper.Company_BK_SEARCH(inputMap);
	}
	
	@Override
	public HashMap<String, String> Company_BK_INSERT(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return CompanyMapper.Company_BK_INSERT(inputMap);
	}
	
	
	@Override
	public List<HashMap<String, String>> Today_Schedule(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return CompanyMapper.Today_Schedule(inputMap);
	}
	
	// 팀 가입
	@Override
	public HashMap<String, String> edit_profile(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return CompanyMapper.edit_profile(inputMap);
	}
	@Override
	public List<HashMap<String, String>> select_profile(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return CompanyMapper.select_profile(inputMap);
	}
	@Override
	public String pwd_profile(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return CompanyMapper.pwd_profile(inputMap);
	}
	
	
	// 공지사항
	@Override
	public HashMap<String, String> NOTICE_INSERT(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return CompanyMapper.NOTICE_INSERT(inputMap);
	}
	
	@Override
	public HashMap<String, String> NOTICE_UPDATE(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return CompanyMapper.NOTICE_UPDATE(inputMap);
	}
	
	@Override
	public HashMap<String, String> NOTICE_DELETE(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return CompanyMapper.NOTICE_DELETE(inputMap);
	}
	
	@Override
	public List<HashMap<String, String>> LIST_NOTICE(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return CompanyMapper.LIST_NOTICE(inputMap);
	}
	
	@Override
	public List<HashMap<String, String>> NOTICE_SELECT(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return CompanyMapper.NOTICE_SELECT(inputMap);
	}
}
