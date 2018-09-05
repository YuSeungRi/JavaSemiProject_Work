package dto;

public class CodeCategoryDto {

	private int categoryNo;
	private String categoryName;
	private int categoryCount;
	private String userEmail;
	
	@Override
	public String toString() {
		return "CodeCategoryDto [categoryNo=" + categoryNo + ", categoryName=" + categoryName + ", categoryCount="
				+ categoryCount + ", userEmail=" + userEmail + "]";
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int getCategoryCount() {
		return categoryCount;
	}

	public void setCategoryCount(int categoryCount) {
		this.categoryCount = categoryCount;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
}
