package ssoo.Login.service.impl;

import java.util.HashMap;
import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("LoginMapper")
public interface LoginMapper {
	// 로그인
	HashMap<String, String> signin(HashMap<String, Object> inputMap) throws Exception;
	
	//회원가입
	HashMap<String, String> signup(HashMap<String, Object> inputMap) throws Exception;
	
	// ID중복체크
	HashMap<String, String> id_chk(HashMap<String, Object> inputMap) throws Exception;
	
	// ID찾기
	HashMap<String, String> find_id(HashMap<String, Object> inputMap) throws Exception;
	
	// PW 찾기
	HashMap<String, String> find_pw(HashMap<String, Object> inputMap) throws Exception;
}
