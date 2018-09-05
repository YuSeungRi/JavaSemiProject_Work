package dto;

import java.util.ArrayList;

public class CodeDto {
	private int codeNo;
	private int categoryNo;
	private String codeTitle;
	private String codeContent;
	private String codeSource;
	private String userEmail;
	private ArrayList<String> tech;
	
	
	@Override
	public String toString() {
		return "CodeDto [codeNo=" + codeNo + ", categoryNo=" + categoryNo + ", codeTitle=" + codeTitle
				+ ", codeContent=" + codeContent + ", codeSource=" + codeSource + ", userEmail=" + userEmail + "]";
	}
	public int getCodeNo() {
		return codeNo;
	}
	public void setCodeNo(int codeNo) {
		this.codeNo = codeNo;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getCodeTitle() {
		return codeTitle;
	}
	public void setCodeTitle(String codeTitle) {
		this.codeTitle = codeTitle;
	}
	public String getCodeContent() {
		return codeContent;
	}
	public void setCodeContent(String codeContent) {
		this.codeContent = codeContent;
	}
	public String getCodeSource() {
		return codeSource;
	}
	public void setCodeSource(String codeSource) {
		this.codeSource = codeSource;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public ArrayList<String> getTech() {
		return tech;
	}
	public void setTech(ArrayList<String> tech) {
		this.tech = tech;
	}
	
}
