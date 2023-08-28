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
//	List코드
	@Override
	public List<HashMap<String, String>> ListDays(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return CompanyMapper.ListDays(inputMap);
	}
}
