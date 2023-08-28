package ssoo.Login.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ssoo.Login.service.LoginService;

@Service("LoginService")
public class LoginServiceImpl implements LoginService {
	@Resource(name="LoginMapper")
	private LoginMapper loginMapper;
	
	@Override
	public HashMap<String, String> signin(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return loginMapper.signin(inputMap);
	}
	
	@Override
	public HashMap<String, String> signup(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return loginMapper.signup(inputMap);
	}
	
	@Override
	public HashMap<String, String> id_chk(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return loginMapper.id_chk(inputMap);
	}
	
	
	@Override
	public HashMap<String, String> find_id(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return loginMapper.find_id(inputMap);
	}
	
	
	@Override
	public HashMap<String, String> find_pw(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return loginMapper.find_pw(inputMap);
	}
}