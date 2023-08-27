package ssoo.Individual.service;

import java.util.HashMap;
import java.util.List;

public interface IndividualService {
	
//	LIST코드
	List<HashMap<String, String>> ListDays (HashMap<String, Object> inputMap) throws Exception;
	
	HashMap<String, String> Individual_Calendar_Insert(HashMap<String, Object> inputMap) throws Exception;
	
	String Individual_Calendar_Update(HashMap<String, Object> inputMap) throws Exception;
	
	String Individual_Calendar_Delete(HashMap<String, Object> inputMap) throws Exception;
	

	List<HashMap<String, String>> ListTodo(HashMap<String, Object> inputMap) throws Exception;
	
	List<HashMap<String, String>> ListTodo_Trash(HashMap<String, Object> inputMap) throws Exception;
	
	String Individual_Todo_Insert(HashMap<String, Object> inputMap) throws Exception;
	
	String Individual_Todo_Update(HashMap<String, Object> inputMap) throws Exception;
	
	String Individual_Todo_Delete(HashMap<String, Object> inputMap) throws Exception;
	
	String Individual_Todo_Move_Update(HashMap<String, Object> inputMap) throws Exception;

	String Individual_Todo_Trash_Insert(HashMap<String, Object> inputMap) throws Exception;
	
	HashMap<String, String> ListCharacter(HashMap<String, Object> inputMap) throws Exception;
	
	String Character_Insert(HashMap<String, Object> inputMap) throws Exception;
	
	String Character_Update(HashMap<String, Object> inputMap) throws Exception;
}
