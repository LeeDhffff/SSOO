package ssoo.Company.service;

import java.util.HashMap;
import java.util.List;

public interface CompanyService {
	List<HashMap<String, String>> ListDays (HashMap<String, Object> inputMap) throws Exception;
}
