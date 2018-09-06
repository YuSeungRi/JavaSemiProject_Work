package dto;

public class TechDto {
	private int techNo;
	private String techName;
	
	@Override
	public String toString() {
		return "TechDto [techNo=" + techNo + ", techName=" + techName + "]";
	}
	public int getTechNo() {
		return techNo;
	}
	public void setTechNo(int techNo) {
		this.techNo = techNo;
	}
	public String getTechName() {
		return techName;
	}
	public void setTechName(String techName) {
		this.techName = techName;
	}
}
