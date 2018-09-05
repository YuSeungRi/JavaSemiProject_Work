package controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import Service.BoardService;
import Service.FileService;
import dto.FileDto;
import dto.RecruitDto;

/*
 * 작성일 : 2018.08.30
 * 작성자 : 권미현
 * 
 * 	구인구직_작성
 * 
 * 수정일 : 2018.09.05
 * 수정자 : 권미현
 *  - 한글 깨짐 처리
 */

@WebServlet("/recruit/write.do")
public class RecruitmentWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private BoardService service = new BoardService();
	private FileService fileService = new FileService();
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user = (String) request.getSession().getAttribute("userId");

//		System.out.println("RecruitmentWriteController_작성자(userId) : " + user);
		
		request.getRequestDispatcher("/Recruit/recruitboard_write.jsp").forward(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8"); 
		
		RecruitDto dto = new RecruitDto();
		
		dto.setBoardNo(service.getNewBoardNo()); // 먼저 board_no 를 받는다.
		dto.setBoardCategory("Recruit");
		dto.setBoardUser((String) request.getSession().getAttribute("userId"));


		
		// 파일 업로드 작업 시작
		// 1. 파일 업로드한 거 맞는지 확인 (enctype 이 multipart 인지 확인하는 메소드)
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		
		// 1-1. multipart/form-data 가 아닌 경우.
		if(!isMultipart) {
			//TODO : error 페이지로 리다이렉트
//			out.println("<h1>encType is not multipart!</h1>"); // 오류 메시지
			return;
		}
		// 1-2. multipart/form-data 일 경우
		// 파일이 전송 되었을 경우
		
		
		// 2. 업로드 파일을 처리하는 아이템 팩토리 생성
		DiskFileItemFactory factory = null;
		factory = new DiskFileItemFactory();
		
		
		// 3. 업로드 아이템이 적당히 작으면 메모리에서 처리
		int maxMem = 1 * 1024 * 1024; // 1MB
		factory.setSizeThreshold(maxMem); // 메모리에 저장할 수 있는 최대 크기 지정
		
		
		// 4. 적당히 큰 아이템이면 임시파일을 만들어서 처리(메모리)
		factory.setRepository(new File(getServletContext().getRealPath("tmp")));
		
		
		// 5. 업로드 허용 기준에 맞는 용량의 파일이면 업로드 수행
		long maxFile = 10 * 1024 * 1024; // 10MB
		
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setSizeMax(maxFile); // 업로드 용량 제한 설정
		
		
		// 6. 업로드 데이터 파싱(추출) - 임시 파일 업로드
		List<FileItem> items = null;
		try {
			items = upload.parseRequest(request);
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		
		
		// 7. 폼 필드 처리
		Iterator<FileItem> iter = items.iterator();
		
		while(iter.hasNext()) {
			FileItem item = iter.next();
			
			// 빈 파일(비정상파일)이 업로드 되었을 때 처리 안 함.
			if(item.getSize()<=0) continue; // 다음 반복으로 넘어감.
			
			if(item.isFormField()) {
				// form-data 일 경우
				// key, value 쌍으로 저장된 데이터일 경우
//				System.out.println("RecruitmentWriteController_폼 필드 : " + item.getFieldName() + ", 값 : " + item.getString("UTF-8"));
				if(item.getFieldName().equals("title")) {
					dto.setBoardTitle(item.getString("UTF-8")); // FileItem 한글 깨짐 처리
				}
				if(item.getFieldName().equals("summernote")) {
					dto.setBoardContent(item.getString("UTF-8")); // FileItem 한글 깨짐 처리
				}
				if(item.getFieldName().equals("status")) {
					// --- 구인구직_상태 ---
					String status = item.getString();
					if (status.equals("jobOffer")) {
						dto.setRecruitStatus("구인");
					} else if (status.equals("jobHunt")) {
						dto.setRecruitStatus("구직");
					}
					// -----------------
				}
			} else {
				// java.util.UUID
				// UUID : 범용 고유 식별자
				UUID uid = UUID.randomUUID();
				System.out.println("RecruitmentWriteController_UUID : " + uid);
				String u = uid.toString().split("-")[0];
				System.out.println("RecruitmentWriteController_UUID.toString().split(\"-\")[0] : " + u);
				
				String fileName = item.getName();
				System.out.println("RecruitmentWriteController_fileName : " + fileName);
				String storedFileName = fileName + "_" + u;
				String[] fileSplit = fileName.split("\\.");
				System.out.println("RecruitmentWriteController_fileSplit : " + fileSplit);
				
				FileDto fileDto = new FileDto();
				fileDto.setBoardNo(dto.getBoardNo());
				fileDto.setUploaderEmail(dto.getBoardUser());
				fileDto.setFileName(fileName);
				fileDto.setFileStoredName(storedFileName);
				fileDto.setFileType(fileSplit[fileSplit.length-1]);
				
				// 파일 데이터일 경우
				File up = new File(getServletContext().getRealPath("upload"), storedFileName);
				
				try {
					item.write(up); // Real Path 에 지정한 파일로 기록하기(실제 업로드)
					fileService.uploadFile(fileDto); // DB에 기록
					
					item.delete(); // 임시파일 삭제하기
				} catch (Exception e) {
					e.printStackTrace();
				}
			
			}
		} // while문 end
		
		
		boolean success = service.createBoardRecruit(dto);
//		System.out.println("RecruitmentWriteController_success : " + success);
//		System.out.println("RecruitmentWriteController_" + dto);
		
		// 리다이렉트 - 구인구직 게시판
		response.sendRedirect("/recruit/recruit.do");
		
	}

}
