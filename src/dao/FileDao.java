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
	
	/**
	 * get count files in a board post. 
	 * @param boardNo
	 * @return
	 */
	public int boardFileCount(int boardNo);
	
	/**
	 * delete a file
	 * @param fileNo
	 */
	public void deleteFile(int fileNo);
	
	/**
	 * get a file info
	 * @param fileNo
	 * @return
	 */
	public FileDto getFileData(int fileNo);
	
}
