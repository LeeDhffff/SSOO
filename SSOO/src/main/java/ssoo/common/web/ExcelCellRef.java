package ssoo.common.web;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.util.CellReference;

public class ExcelCellRef {
	
	/**
	 * Cell에 해당하는 Column Name을 가져온다(A,B,C...)
	 * 만약 Cell이 Null이라면 int cellIndex의 값으로 Column Name을 가져온다.
	 * @Param cell
	 * @Param cellIndex
	 * @return
	 */
	
	public static String getName(Cell cell, int cellIndex) {
		int cellNum = 0;
		if(cell != null) {
			cellNum = cell.getColumnIndex();
		} else {
			cellNum = cellIndex;
		}
		return CellReference.convertNumToColString(cellNum);
	}
	
	@SuppressWarnings("deprecation")
	public static String getValue(Cell cell) {
		String value = "";
		
		
		if(cell == null) {
			value = null;
		} else {
			if(cell.getCellType() == Cell.CELL_TYPE_FORMULA) {
				value = cell.getCellFormula();
			} else if(cell.getCellType() == Cell.CELL_TYPE_NUMERIC) { 
				if(DateUtil.isCellDateFormatted(cell)) {		// Excel 파일에서 날짜 서식은 NUMERIC 타입으로 전송된다. 
					Date date = cell.getDateCellValue();		// 날짜 서식의 값을 Date에 담는다.
					value = new SimpleDateFormat("yyyy-MM-dd").format(date); // yyyy-MM-dd형태의 Date형으로 변환하여 값을 대입한다.
				/* 엑셀 업로드시, 소수점 아래 2자리가 0 또는 00이 아닌 값이 있을 경우에만 float타입으로 변환!! 2022-08-10 장연우 */
				}else if(Integer.parseInt(cell.toString().substring(cell.toString().lastIndexOf(".")+1)) != 0 || Integer.parseInt(cell.toString().substring(cell.toString().lastIndexOf(".")+1)) != 00){
					System.out.println("cell : "+ cell.toString().substring(cell.toString().lastIndexOf(".")+1));
					value = ""+(float)cell.getNumericCellValue()+"";	// 일반 숫자일 경우, 소수점을 없애기 위해 int형으로 형변환 해준다.
				}else {
					value = ""+(int)cell.getNumericCellValue()+"";	// 일반 숫자일 경우, 소수점을 없애기 위해 int형으로 형변환 해준다.
				}
			} else if(cell.getCellType() == Cell.CELL_TYPE_STRING) {
				value = cell.getStringCellValue();
			} else if(cell.getCellType() == Cell.CELL_TYPE_BOOLEAN) {
				value = cell.getBooleanCellValue() + "";
			} else if(cell.getCellType() == Cell.CELL_TYPE_ERROR) {
				value = cell.getErrorCellValue() + "";
			} else if(cell.getCellType() == Cell.CELL_TYPE_BLANK) {
				value = null;
			} else {
				value = cell.getStringCellValue();
			}
			//System.out.println("value : "+ value);
		}
		
		return value;
	}
}
