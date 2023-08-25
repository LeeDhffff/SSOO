package ssoo.Individual.service.impl;

import java.util.HashMap;
import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("IndividualMapper")
public interface IndividualMapper {
//	LIST코드
	List<HashMap<String, String>> ListDays(HashMap<String, Object> inputMap) throws Exception;
}
