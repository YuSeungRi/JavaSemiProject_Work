package Service;

import java.util.ArrayList;

import dao.FileDao;
import dao.FileDaoImpl;
import dto.FileDto;

public class FileService {
	private FileDao dao = new FileDaoImpl();
	
	public void uploadFile(FileDto dto) {
		dao.uploadFile(dto);		
	}
	
	public ArrayList<FileDto> getFileList(int boardNo){ 
		
		return dao.getFileList(boardNo);
	}
	
	public void deleteFile(int fileNo) {
		if(dao.getFileData(fileNo)!=null)
			dao.deleteFile(fileNo);
	}

	public int getFileCount(int boardNo) {
		return dao.boardFileCount(boardNo);
	}

	public String getFileOwner(int fileNo) {
		return dao.getFileOwner(fileNo);
	}
	
}
