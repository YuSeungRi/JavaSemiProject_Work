package dto;

public class ProjectTechDto {
	private int projectNo;
	private int techNo;
	private String techName;
	public int getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
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
	
	@Override
	public String toString() {
		return "ProjectTechDto [projectNo=" + projectNo + ", techNo=" + techNo + ", techName=" + techName + "]";
	}
	
	
}
