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
	@Override
	public HashMap<String, String> Individual_Calendar_Insert(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return IndividualMapper.Individual_Calendar_Insert(inputMap);
	}
	@Override
	public String Individual_Calendar_Update(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return IndividualMapper.Individual_Calendar_Update(inputMap);
	}
	@Override
	public List<HashMap<String, String>> ListTodo(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return IndividualMapper.ListTodo(inputMap);
	}
	@Override
	public String Individual_Todo_Insert(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return IndividualMapper.Individual_Todo_Insert(inputMap);
	}
	@Override
	public String Individual_Todo_Update(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return IndividualMapper.Individual_Todo_Update(inputMap);
	}
	@Override
	public List<HashMap<String, String>> ListTodo_Trash(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return IndividualMapper.ListTodo_Trash(inputMap);
	}
	@Override
	public String Individual_Todo_Trash_Insert(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return IndividualMapper.Individual_Todo_Trash_Insert(inputMap);
	}
	@Override
	public String Individual_Todo_Move_Update(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return IndividualMapper.Individual_Todo_Move_Update(inputMap);
	}
	@Override
	public String Individual_Calendar_Delete(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return IndividualMapper.Individual_Calendar_Delete(inputMap);
	}
	@Override
	public String Individual_Todo_Delete(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return IndividualMapper.Individual_Todo_Delete(inputMap);
	}
	@Override
	public HashMap<String, String> ListCharacter(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return IndividualMapper.ListCharacter(inputMap);
	}
	@Override
	public String Character_Insert(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return IndividualMapper.Character_Insert(inputMap);
	}
	@Override
	public String Character_Update(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return IndividualMapper.Character_Update(inputMap);
	}
	@Override
	public List<HashMap<String, String>> ListMission(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return IndividualMapper.ListMission(inputMap);
	}
	@Override
	public String TodaysMission(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return IndividualMapper.TodaysMission(inputMap);
	}
	@Override
	public String TodaysMission_Insert(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return IndividualMapper.TodaysMission_Insert(inputMap);
	}
	@Override
	public String TodaysMission_Update(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return IndividualMapper.TodaysMission_Update(inputMap);
	}
	@Override
	public String TodaysMission_Complete(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return IndividualMapper.TodaysMission_Complete(inputMap);
	}
	@Override
	public String TodaysMission_Delete(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return IndividualMapper.TodaysMission_Delete(inputMap);
	}
}
