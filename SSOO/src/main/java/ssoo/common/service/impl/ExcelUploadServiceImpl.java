package ssoo.common.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import ssoo.common.service.ExcelUploadService;
import ssoo.common.web.ExcelRead;
import ssoo.common.web.ExcelReadOption;

@Service("ExcelUploadService")
public class ExcelUploadServiceImpl extends EgovAbstractServiceImpl implements ExcelUploadService {

	@Resource(name = "ExcelUploadMapper")
	private ExcelUploadMapper ExcelUploadMapper;
	
	@Override
	public String excelUpload(File file, HashMap<String, Object> inputMap) {
		
		ExcelReadOption excelReadOption = new ExcelReadOption();
		
		//파일경로 추가
		excelReadOption.setFilePath(file.getAbsolutePath());
		
		//시작행
		excelReadOption.setStartRow(1);
		
		//첫행(컬럼)의 갯수를 가져와 업로드할 컬럼을 세팅한다
		ExcelRead ex = new ExcelRead();
		int columnCnt = ex.ExcelCoulmnCount(excelReadOption);
		List<String> columnSet = new ArrayList<String>();
				
		char ca = ' ';
		char ca1 = ' ';
		char ca2 = ' ';
		
		String charA = "";
		String charB= "";
		
		String alpha = "";
		String alpha1 = "";

		
		//알파벳 출력 반복문
		for (int i = 0; i < columnCnt; i++) {
			if(i <= 25) {
				//A - Z 까지
				ca = (char) (65+i);
				alpha = Character.toString(ca);
				columnSet.add(alpha);
			} else if(i > 25) {
				//AA - AZ까지
				ca1 = 65;
				ca2 = (char) (39+i);
				charA = Character.toString(ca1);
				charB = Character.toString(ca2);
				alpha1 = charA + charB;
				columnSet.add(alpha1);
			}
			
		}
		
		//추출할 컬럼명 추가
		excelReadOption.setOutputColumns(columnSet);		
		
		List<Map<String, String>> excelContent = ExcelRead.read(excelReadOption);
		
		//System.out.println("excelContent==>" + excelContent);
	
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		String mapKey = "";
		Object mapValue = "";

		//paramMap.put("excelContent", excelContent);
		
		String exUpload = "";
				
		try {
			//hashMap 형태로 파싱하여 DB로 전달한다.
			for (int i = 0; i < excelContent.size(); i++) {
				for(Entry<String, String> elem: excelContent.get(i).entrySet()) {					
					mapKey = elem.getKey();
					mapValue= elem.getValue();
					/*if((mapKey.equals("A") && mapValue.equals("Total")) || 
					   (mapKey.equals("A") && mapValue.equals("Sum"))) {
						continue;
					}*/
					paramMap.put(mapKey, mapValue);								
					//System.out.println("mapKey : "+ mapKey);
					//System.out.println("mapValue : "+ mapValue);
										
				}				
				paramMap.put("CNT", columnCnt);
				paramMap.put("DBTABLE", inputMap.get("Table"));
				//paramMap.put("DBTABLE", "testMain");	//paramMap.put("DBTABLE", inputMap.get("Table"));
				paramMap.put("COD_ORDER", inputMap.get("COD_ORDER"));
//				System.out.println("getTable : "+ inputMap.get("Table"));
//				System.out.println("inputMap : "+ inputMap);
//				System.out.println("inputMap.get(COD_ORDER) :"+ inputMap.get("COD_ORDER"));
//				System.out.println("CNT==>" + columnCnt);
//				System.out.println("paramMap==>" + paramMap);
				
				exUpload = ExcelUploadMapper.excelUpload(paramMap);
				
//				System.err.println(exUpload);
			}
			System.out.println("exUpload : "+exUpload);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return exUpload;		
	}
	
	@Override
	public String excelUpload2(File file, HashMap<String, Object> inputMap) {
		
		ExcelReadOption excelReadOption = new ExcelReadOption();
		
		//파일경로 추가
		excelReadOption.setFilePath(file.getAbsolutePath());
		
		//시작행
		excelReadOption.setStartRow(1);
		
		//첫행(컬럼)의 갯수를 가져와 업로드할 컬럼을 세팅한다
		ExcelRead ex = new ExcelRead();
		int columnCnt = ex.ExcelCoulmnCount(excelReadOption);
		List<String> columnSet = new ArrayList<String>();
		
		char ca = ' ';
		char ca1 = ' ';
		char ca2 = ' ';
		
		String charA = "";
		String charB= "";
		
		String alpha = "";
		String alpha1 = "";

		
		//알파벳 출력 반복문
		for (int i = 0; i < columnCnt; i++) {
			if(i <= 25) {
				//A - Z 까지
				ca = (char) (65+i);
				alpha = Character.toString(ca);
				columnSet.add(alpha);
			} else if(i > 25) {
				//AA - AZ까지
				ca1 = 65;
				ca2 = (char) (39+i);
				charA = Character.toString(ca1);
				charB = Character.toString(ca2);
				alpha1 = charA + charB;
				columnSet.add(alpha1);
			}
			
		}
		
		//추출할 컬럼명 추가
		excelReadOption.setOutputColumns(columnSet);		
		
		List<Map<String, String>> excelContent = ExcelRead.read(excelReadOption);
		
		//System.out.println("excelContent==>" + excelContent);
	
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		String mapKey = "";
		Object mapValue = "";

		//paramMap.put("excelContent", excelContent);
		
		String exUpload = "";
		
		try {
			//hashMap 형태로 파싱하여 DB로 전달한다.
			for (int i = 0; i < excelContent.size(); i++) {
				for(Entry<String, String> elem: excelContent.get(i).entrySet()) {					
					mapKey = elem.getKey();
					mapValue= elem.getValue();
					if((mapKey.equals("A") && mapValue.equals("Total")) || 
					   (mapKey.equals("A") && mapValue.equals("Sum"))) {
						continue;
					}					
					paramMap.put(mapKey, mapValue);
					System.out.println("mapKey : "+ mapKey);
					System.out.println("mapValue : "+ mapValue);
				}			
				paramMap.put("CNT", columnCnt);
				paramMap.put("DBTABLE", "");	//paramMap.put("DBTABLE", inputMap.get("Table"));
				paramMap.put("COD_ORDER", inputMap.get("COD_ORDER"));
				
				System.out.println("inputMap : "+ inputMap);
				//System.out.println("inputMap.get(COD_ORDER) :"+ inputMap.);
				System.out.println("CNT==>" + columnCnt);
				System.out.println("paramMap==>" + paramMap);
				
				exUpload = ExcelUploadMapper.excelUpload2(paramMap);
				
				//System.err.println(exUpload);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return exUpload;		
	}

	@Override
	public String excelUploadUpdate(File file, HashMap<String, Object> inputMap) throws Exception {

		ExcelReadOption excelReadOption = new ExcelReadOption();
		
		//파일경로 추가
		excelReadOption.setFilePath(file.getAbsolutePath());
		
		//시작행
		excelReadOption.setStartRow(1);
		
		//첫행(컬럼)의 갯수를 가져와 업로드할 컬럼을 세팅한다
		ExcelRead ex = new ExcelRead();
		int columnCnt = ex.ExcelCoulmnCount(excelReadOption);
		List<String> columnSet = new ArrayList<String>();
				
		char ca = ' ';
		char ca1 = ' ';
		char ca2 = ' ';
		
		String charA = "";
		String charB= "";
		
		String alpha = "";
		String alpha1 = "";

		
		//알파벳 출력 반복문
		for (int i = 0; i < columnCnt; i++) {
			if(i <= 25) {
				//A - Z 까지
				ca = (char) (65+i);
				alpha = Character.toString(ca);
				columnSet.add(alpha);
			} else if(i > 25) {
				//AA - AZ까지
				ca1 = 65;
				ca2 = (char) (39+i);
				charA = Character.toString(ca1);
				charB = Character.toString(ca2);
				alpha1 = charA + charB;
				columnSet.add(alpha1);
			}
			
		}
		
		//추출할 컬럼명 추가
		excelReadOption.setOutputColumns(columnSet);		
		
		List<Map<String, String>> excelContent = ExcelRead.read(excelReadOption);
		
		//System.out.println("excelContent==>" + excelContent);
	
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		String mapKey = "";
		Object mapValue = "";

		//paramMap.put("excelContent", excelContent);
		
		String exUpload = "";
				
		try {
			//hashMap 형태로 파싱하여 DB로 전달한다.
			for (int i = 0; i < excelContent.size(); i++) {
				for(Entry<String, String> elem: excelContent.get(i).entrySet()) {					
					mapKey = elem.getKey();
					mapValue= elem.getValue();
					/*if((mapKey.equals("A") && mapValue.equals("Total")) || 
					   (mapKey.equals("A") && mapValue.equals("Sum"))) {
						continue;
					}*/
					paramMap.put(mapKey, mapValue);								
					//System.out.println("mapKey : "+ mapKey);
					//System.out.println("mapValue : "+ mapValue);
										
				}				
				paramMap.put("CNT", columnCnt);
				paramMap.put("DBTABLE", inputMap.get("Table"));
				//paramMap.put("DBTABLE", "testMain");	//paramMap.put("DBTABLE", inputMap.get("Table"));
				paramMap.put("COD_ORDER", inputMap.get("COD_ORDER"));
//				System.out.println("getTable : "+ inputMap.get("Table"));
//				System.out.println("inputMap : "+ inputMap);
//				System.out.println("inputMap.get(COD_ORDER) :"+ inputMap.get("COD_ORDER"));
//				System.out.println("CNT==>" + columnCnt);
//				System.out.println("paramMap==>" + paramMap);
				
				exUpload = ExcelUploadMapper.excelUploadUpdate(paramMap);
				
//				System.err.println(exUpload);
			}
			System.out.println("exUpload : "+exUpload);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return exUpload;	
	}	
	
}
