package dto;

public class FileDto {
	private int fileNo;
	private int boardNo;
	private String uploaderEmail;
	private String fileName;
	private String fileStoredName;
	private String fileType;
	
	@Override
	public String toString() {
		return "FileDto [fileNo=" + fileNo + ", boardNo=" + boardNo + ", uploaderEmail=" + uploaderEmail + ", fileName="
				+ fileName + ", fileStoredName=" + fileStoredName + ", fileType=" + fileType + "]";
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getUploaderEmail() {
		return uploaderEmail;
	}

	public void setUploaderEmail(String uploaderEmail) {
		this.uploaderEmail = uploaderEmail;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileStoredName() {
		return fileStoredName;
	}

	public void setFileStoredName(String fileStoredName) {
		this.fileStoredName = fileStoredName;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	
	
		
}
