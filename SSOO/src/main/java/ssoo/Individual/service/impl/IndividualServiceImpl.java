package ssoo.Individual.service.impl;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ssoo.Individual.service.IndividualService;

@Service("IndividualService")
public class IndividualServiceImpl implements IndividualService {

	@Resource(name = "IndividualMapper")
	private IndividualMapper IndividualMapper;
//	List코드
	@Override
	public List<HashMap<String, String>> ListDays(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return IndividualMapper.ListDays(inputMap);
	}
}
