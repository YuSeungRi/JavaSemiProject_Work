package dao;

import java.util.ArrayList;

import dto.FileDto;

public interface FileDao {
	
	/**
	 * Insert upload file data.
	 * @param dto
	 */
	public void uploadFile(FileDto dto);
	
	/**
	 * get file list for a board post.
	 * @param boardNo
	 * @return ArrayList
	 */
	public ArrayList<FileDto> getFileList(int boardNo);
	
	
	
	
}
