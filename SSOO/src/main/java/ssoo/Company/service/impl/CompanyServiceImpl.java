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
	
	// 팀 조회
	@Override
	public HashMap<String, String> TEAM_SEARCH(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return CompanyMapper.TEAM_SEARCH(inputMap);
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
}
