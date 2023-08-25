package ssoo.common.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

public class ExcelRead {
	
	// 엑셀 파일을 읽어온 뒤 데이터를 구성하는 메서드
	public static List<Map<String, String>> read(ExcelReadOption excelReadOption) {		
		
		// 엑셀 파일의 확장자명을 구분하여 워크북 생성
		Workbook wb = ExcelFileType.getWorkbook(excelReadOption.getFilePath());

		Row row = null;			// 행
		Cell cell = null;		// 셀
		Row columnRow = null;	// 첫 행(=테이블의 컬럼 값)
		int sheetCn = wb.getNumberOfSheets(); // 총 시트 수;
		
	    Map<String, String> map = null;		  // 셀의 데이터를 저장하는 Map
	    List<Map<String, String>> result = new ArrayList<Map<String,String>>(); // 행의 데이터를 저장하는 List
	    
	    /* 현재 인덱스 기준이나, 두 개의 다른 엑셀파일의 첫행(컬럼)의 순서가 다를 경우 컬럼명을 기준으로 데이터를 입력하는 방법을 대비해서 작성해둠.
	     * 2022-04-20 장연우 
	    List<String> columnName = new ArrayList<String>(); // 엑셀파일의 첫행(컬럼명)을 담는 리스트
	    Sheet sheet = wb.getSheetAt(0);	    
	    for(int j = 0; j < 12; j++) {
        	columnName.add(sheet.getRow(0).getCell(j).toString());
        	System.out.println("[0]번째행 ["+j+"]번째열의 값: "+sheet.getRow(0).getCell(j).toString());
        	System.out.println(columnName);
        }*/

		for(int sheetnum = 0 ; sheetnum < sheetCn; sheetnum++){ // 총 시트 갯수만큼 반복

		    //Sheet sheet = wb.getSheetAt(sheetnum); 				// 시트 선택
		    Sheet sheet = wb.getSheetAt(0); 				// 시트 선택
		    int numOfRows = sheet.getPhysicalNumberOfRows();	// 시트에 포함된 모든 행의 갯수
		    int numOfCells = 0;
		    String cellName = "";

		    // 해당시트의 모든 행의 갯수만큼 반복 
		    for(int rowIndex = excelReadOption.getStartRow(); rowIndex < numOfRows; rowIndex++){
		        
		    	row = sheet.getRow(rowIndex);	// 해당시트의 rowIndex번째 행의 데이터 - xml형식	    	
		        columnRow = sheet.getRow(0);	// 첫 행(=엑셀파일의 컬럼 값)의 데이터    - xml형식
		          
		        if(row != null){				
		            numOfCells = columnRow.getPhysicalNumberOfCells();  // 첫 행(=엑셀파일의 컬럼 값)의 개수
		            int lastOfCell = numOfCells+1;		            
		            
		            map = new HashMap<String, String>();				// 셀의 데이터를 담을 Map초기화          

//		            System.out.println("셀 불러오기 시작!");
		            for(int cellIndex=0; cellIndex < lastOfCell; cellIndex++){	// 셀의 개수 만큼 반복
	            		
		            	cell = row.getCell(cellIndex);							// 해당 셀의 데이터 값 (ex: E1, 2C6X0041, ...)
		                cellName = ExcelCellRef.getName(cell, cellIndex);		// 해당 셀의 위치 (ex: A, B, C, D, ... , ZZ)
		                		                
		                //System.out.println("cell["+cellIndex+"] : " + cell);
		                //System.out.println("cellName["+cellIndex+"] : " + cellName);

		                if(!excelReadOption.getOutputColumns().contains(cellName)){  // 컬럼이 비어있을 경우 continue
		                    continue;
		                }
		                map.put(cellName, ExcelCellRef.getValue(cell));	// Map에 셀의 데이터 저장		            	
		            	
/*		            	 셀의 개수만큼 반복할 때, 필요한 인덱스의 데이터만 추출하도록 설정.
		            	 * 2022-04-20 장연우
		            	 
		            	if(cellIndex == 0 || cellIndex == 1 || cellIndex == 2 || cellIndex == 5 || cellIndex == 6 || cellIndex == 9) {		            		
		            		cell = row.getCell(cellIndex);							// 해당 셀의 데이터 값 (ex: E1, 2C6X0041, ...)
			                cellName = ExcelCellRef.getName(cell, cellIndex);		// 해당 셀의 위치 (ex: A, B, C, D, ... , ZZ)
			                		                
			                System.out.println("cell["+cellIndex+"] : " + cell);
			                System.out.println("cellName["+cellIndex+"] : " + cellName);

			                if(!excelReadOption.getOutputColumns().contains(cellName)){  // 컬럼이 비어있을 경우 continue
			                    continue;
			                }
			                map.put(cellName, ExcelCellRef.getValue(cell));	// Map에 셀의 데이터 저장
		            	}
		            	 마지막셀에 날짜 데이터 추가 -> 마지막셀 계산 : if(cellIndex == numOfCells-1)
		            	 * 현재 업로드 하는 엑셀 파일마다 마지막 셀의 개수가 상이하기 때문에 DB_Table기준으로 날짜컬럼의 위치로 강제지정해줌.
		            	 * 2022-04-20 장연우
		            	 
		            	if(cellIndex == 11) {	
	            			SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
	            			Date time = new Date();
	            			String time1 = format1.format(time);
	            			
	            			cell = row.getCell(cellIndex);
	            			cellName = ExcelCellRef.getName(cell, cellIndex);
	            			System.out.println("time1: "+ time1);
	            			
	            			map.put(cellName, time1); // Map에 셀의 데이터 저장
	            		}
		            	//System.out.println("cellIndex : " + cellIndex);		                
*/		            }		            
		        }
		        result.add(map); // 모든 셀의 데이터를 리스트에 저장
		    }		    
		}return result;	// 모든 행들의 데이터가 저장된 리스트 값 리턴
		
	}
	
	public int ExcelCoulmnCount(ExcelReadOption excelRO) {
		Row columnRow = null;
		int cntColumn = 0;
		
		//엑셀파일자체
		//엑셀파일을 읽어들인다.
		//FileType.getWorkbook() <-- 파일의 확장자에 따라서 적절하게 가져온다.
		Workbook wb = ExcelFileType.getWorkbook(excelRO.getFilePath());
		
		//엑셀파일에서 첫번째 시트를 가지고 온다.
		Sheet sheet = wb.getSheetAt(0);

		columnRow = sheet.getRow(0);
		cntColumn = columnRow.getPhysicalNumberOfCells();
		
		return cntColumn;
	}
}
