package ssoo.common.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.databind.ObjectMapper;
import ssoo.common.service.ExcelUploadService;




/**
 * @Class Name : ExcelUploadController.java
 * @Description : ExcelUploadController.Class
 * @Modification 엑셀업로드 Controller
 * @
 * @	수정일             		수정자           		 수정내용
 * @	----------		---------		-------------------------------
 * @    2021.06.17		강주환           	 	 최초생성
 *
 * @author 사람과기술 기술사업부
 * @since 2021. 06.17
 * @version 1.0
 * @see
 *
 *  Copyright (C) by HNT All right reserved.
 */

@Controller
public class ExcelUploadController {
	
	/* 공통 Service */
//	@Resource(name="CommonService")
//	private CommonService CommonService;
	
	/* ExcelUpload Service */
	@Resource(name="ExcelUploadService")
	private ExcelUploadService ExcelUploadService;
	
	//엑셀업로드 Controller
	@RequestMapping(value = "ExcelUploadAjax.do", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String excelUploadAjax(@RequestParam HashMap<String, Object> inputMap, MultipartHttpServletRequest request, MultipartFile upFile) throws Exception {
		
		String path = "";
		String fileName = "";
		
		OutputStream out = null;
		PrintWriter printWriter = null;
		
		String exUpload = "";
		
		/************* 1. 파일을 로컬 Path에 저장한다. ***************/
		try {
			
			fileName = upFile.getOriginalFilename();
			byte[] bytes = upFile.getBytes();
			path = "C:\\excel_upload\\";
					
			File file = new File(path);
		
	        if (!file.exists() || file.isFile()) {
	        	file.mkdirs();
	        }
			System.err.println("fileName==>" + fileName);
			System.err.println("file==>" + file);
			
			if(fileName != null && !fileName.equals("")) {
				if(file.exists()) {
					fileName = System.currentTimeMillis() + "_" + fileName;
					
					file = new File(path + fileName);
				}
			}
			
			out = new FileOutputStream(file);
			
			System.err.println("out==>" + out);
			
			out.write(bytes);
			
			System.out.println("inputMap ==> "+ inputMap);
			
			//엑셀업로드 진행
			exUpload = ExcelUploadService.excelUpload(file, inputMap);
			System.out.println("exUpload : "+exUpload);
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(out != null) {
					out.close();
				}
				if(printWriter != null) {
					printWriter.close();
				}
			} catch(IOException e) {
				e.printStackTrace();
			}
		}

		/************* 1. 파일을 로컬 Path에 저장한다. end ***************/
				
		return exUpload;
		
	}
	//엑셀업로드 Controller
		@RequestMapping(value = "ExcelUploadAjax_update.do", produces="text/plain;charset=UTF-8")
		@ResponseBody
		public String ExcelUploadAjax_update(@RequestParam HashMap<String, Object> inputMap, MultipartHttpServletRequest request, MultipartFile upFile) throws Exception {
			
			String path = "";
			String fileName = "";
			
			OutputStream out = null;
			PrintWriter printWriter = null;
			
			String exUpload = "";
			
			/************* 1. 파일을 로컬 Path에 저장한다. ***************/
			try {
				
				fileName = upFile.getOriginalFilename();
				byte[] bytes = upFile.getBytes();
				path = "C:\\excel_upload\\";
						
				File file = new File(path);
			
		        if (!file.exists() || file.isFile()) {
		        	file.mkdirs();
		        }
				System.err.println("fileName==>" + fileName);
				System.err.println("file==>" + file);
				
				if(fileName != null && !fileName.equals("")) {
					if(file.exists()) {
						fileName = System.currentTimeMillis() + "_" + fileName;
						
						file = new File(path + fileName);
					}
				}
				
				out = new FileOutputStream(file);
				
				System.err.println("out==>" + out);
				
				out.write(bytes);
				
				System.out.println("inputMap ==> "+ inputMap);
				
				//엑셀업로드 진행
				exUpload = ExcelUploadService.excelUploadUpdate(file, inputMap);
				System.out.println("exUpload : "+exUpload);
				
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(out != null) {
						out.close();
					}
					if(printWriter != null) {
						printWriter.close();
					}
				} catch(IOException e) {
					e.printStackTrace();
				}
			}

			/************* 1. 파일을 로컬 Path에 저장한다. end ***************/
					
			return exUpload;
			
		}
	//엑셀양식다운 Controller
	@RequestMapping(value = "excelFormDown.do", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public void excelFormDown(@RequestParam HashMap<String, Object> inputMap, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.err.println("inputMap==>" + inputMap);
		String filePath = "";
		filePath = "D:\\excel_양식\\" + inputMap.get("fileName");
		//filePath = "D:\\excel_양식\\pa0700_c0100Excel.do.xlsx";
		System.out.println("filePath: " + filePath);
		File file = new File(filePath);
		
		System.err.println("filePath==>" + filePath);
		System.err.println("file==>" + file);
		
		String displayFileName = String.valueOf(inputMap.get("fileName"));
		String encodedFilename = "";
		
		System.err.println("displayFileName==>" + displayFileName);
		
		//파일명에 한글이 있거나 공백, 가로등 특수문자가 있는경우 브라우저 별로 인코딩 해서 처리하는 방식이다.
		String header = request.getHeader("User-Agent");
		if ( header.indexOf( "MSIE" ) > -1 ) {
			encodedFilename = URLEncoder.encode( displayFileName, "UTF-8" ).replaceAll( "\\+", "%20" );
		} else if ( header.indexOf( "Trident" ) > -1 ) { 
			encodedFilename = URLEncoder.encode( displayFileName, "UTF-8" ).replaceAll( "\\+", "%20" );
		} else if ( header.indexOf( "Chrome" ) > -1 ) {
			StringBuffer sb = new StringBuffer();
			for ( int i = 0; i < displayFileName.length(); i++ ) {
				char c = displayFileName.charAt( i );
				if ( c > '~' ) {
					sb.append( URLEncoder.encode( "" + c, "UTF-8" ) );
				} else {
					sb.append( c );
				}
			}
			encodedFilename = sb.toString();
		} else if ( header.indexOf( "Opera" ) > -1 ) {
			encodedFilename = "\"" + new String( displayFileName.getBytes( "UTF-8" ), "8859_1" ) + "\"";
		} else if ( header.indexOf( "Safari" ) > -1 ) {
			encodedFilename = "\"" + new String( displayFileName.getBytes( "UTF-8" ), "8859_1" ) + "\"";
			encodedFilename = URLDecoder.decode( encodedFilename );
		} else {
			encodedFilename = "\"" + new String( displayFileName.getBytes( "UTF-8" ), "8859_1" ) + "\"";
			encodedFilename = URLDecoder.decode( encodedFilename );
		}
		
		System.err.println("encodeFileName==>" + encodedFilename);
		
		final String filePathAndName = filePath;
		response.setContentType("application/txt");
		response.setHeader("Content-Disposition", "attachment; fileName="+encodedFilename);
		response.setHeader("Content-Transfer-Encoding", "binary");

		final File fileToDownload = new File(filePathAndName);
		InputStream inputStream = null;  //스트림 객체를
		try {
			inputStream = new FileInputStream(fileToDownload); //파일에서 넣어주고
			IOUtils.copy(inputStream, response.getOutputStream());
			response.flushBuffer();  //응답해준다.
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				inputStream.close();  //닫아준다.
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
}
