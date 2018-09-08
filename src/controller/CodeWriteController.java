package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import Service.CodeService;
import dto.CodeCategoryDto;
import dto.CodeDto;
import dto.FileDto;
import dto.TechDto;

@WebServlet("/code/write.do")
public class CodeWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private CodeService csvc = new CodeService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userEmail = session.getAttribute("userId").toString();
		
		ArrayList<CodeCategoryDto> categoryList = csvc.getAllCategory(userEmail);
		ArrayList<TechDto> techList = csvc.getAllTechList();
		
		request.setAttribute("categoryList", categoryList);
		request.setAttribute("techList", techList);
		
		request.getRequestDispatcher("/code/code_write.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		CodeDto dto = new CodeDto();
				
		// 파일 업로드 작업 시작 
		// 1. 파일 업로드 한거 맞는지 확인 (enctype 이 multipart 인지 확인하는 메서드)
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		// 1-1. multipart/form-data가 아닌 경우.
		if(!isMultipart) {
			//TODO : error 페이지로 리다이렉트
//			out.println("<h1>encType is not multipart!</h1>");
			return;
		}
		// 1-2. multipart/form-data 일 경우 
		// 	파일이 전송되었을 경우 
		
		// 2. 업로드 파일을 처리하는 아이템 팩토리 생성
		DiskFileItemFactory factory = null;
		factory = new DiskFileItemFactory();
		
		// 3. 업로드 아이템이 적당히 작으면 메모리에서 처리
		int maxMem = 1; // 1byte
		factory.setSizeThreshold(maxMem);
		
		// 4. 적당히 큰 아이템이면 임시파일을 만들어서 처리(메모리)
		factory.setRepository(new File(getServletContext().getRealPath("tmp")));
		
		// 5. 업로드 허용기준에 맞는 용량의 파일이면 업로드 수행 
		long maxFile = 1 * 1024 * 1024; // 1MB
		
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setSizeMax(maxFile); // 업로드 용량 제한 설정
		
		// 6. 업로드 데이너 파싱(추출) - 임시파일 업로드 
		List<FileItem> items = null;
		try {
			items = upload.parseRequest(request);
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		
		// 7. 폼필드 처리 
		Iterator<FileItem> iter = items.iterator();
		while(iter.hasNext()) {
			FileItem item = iter.next();
			// 빈파일(비정상파일)이 업로드 되었을 때 처리 안함
			if(item.getSize()<=0)	continue;
			
			if(item.isFormField()) {
				// form-data 일 경우 
				// key, value 쌍으로 저장된 데이터일 경우 
//				out.println("폼 필드 : " + item.getFieldName() + ", 값 : " + item.getString());
				if(item.getFieldName().equals("codeCategory")) {
					dto.setCategoryNo(Integer.parseInt((item.getString("UTF-8")))); // FileItem 한글 깨짐 처리
				}
				if(item.getFieldName().equals("codeLanguage")) {
					dto.setLanguage((item.getString("UTF-8"))); // FileItem 한글 깨짐 처리
				}
				if(item.getFieldName().equals("selectedTech")) {
					System.out.println(item.getString("UTF-8"));
				}
			} else {
				String fileName = item.getName();
				// 파일 데이터일 경우
				File up = new File(getServletContext().getRealPath("upload"), fileName);
			
				try {
					item.write(up);// real path에 지정한 파일로 기록하기(실제 업로드)
					
					item.delete(); //임시파일 삭제하기
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

}
