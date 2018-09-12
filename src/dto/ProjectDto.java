package dto;

/*
 * 작성일 : 2018.08.20
 * 작성자 : 유승리
 */

public class ProjectDto {
	private int projectNo;
	private int locationNo;
	private String projectTitle;
	private String projectStart;
	private String projectEnd; 
	private String projectContent;
	private int projectParticpant;
	private String projectLead;
	private String projectNick;
	private String locationName;
	private String techName;	
	private int participant;
	public int getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}
	public int getLocationNo() {
		return locationNo;
	}
	public void setLocationNo(int locationNo) {
		this.locationNo = locationNo;
	}
	public String getProjectTitle() {
		return projectTitle;
	}
	public void setProjectTitle(String projectTitle) {
		this.projectTitle = projectTitle;
	}
	public String getProjectStart() {
		return projectStart;
	}
	public void setProjectStart(String projectStart) {
		this.projectStart = projectStart;
	}
	public String getProjectEnd() {
		return projectEnd;
	}
	public void setProjectEnd(String projectEnd) {
		this.projectEnd = projectEnd;
	}
	public String getProjectContent() {
		return projectContent;
	}
	public void setProjectContent(String projectContent) {
		this.projectContent = projectContent;
	}
	public int getProjectParticpant() {
		return projectParticpant;
	}
	public void setProjectParticpant(int projectParticpant) {
		this.projectParticpant = projectParticpant;
	}
	public String getProjectLead() {
		return projectLead;
	}
	public void setProjectLead(String projectLead) {
		this.projectLead = projectLead;
	}
	public String getProjectNick() {
		return projectNick;
	}
	public void setProjectNick(String projectNick) {
		this.projectNick = projectNick;
	}
	public String getLocationName() {
		return locationName;
	}
	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}
	public String getTechName() {
		return techName;
	}
	public void setTechName(String techName) {
		this.techName = techName;
	}
	public int getParticipant() {
		return participant;
	}
	public void setParticipant(int participant) {
		this.participant = participant;
	}
	
	@Override
	public String toString() {
		return "ProjectDto [projectNo=" + projectNo + ", locationNo=" + locationNo + ", projectTitle=" + projectTitle
				+ ", projectStart=" + projectStart + ", projectEnd=" + projectEnd + ", projectContent=" + projectContent
				+ ", projectParticpant=" + projectParticpant + ", projectLead=" + projectLead + ", projectNick="
				+ projectNick + ", locationName=" + locationName + ", techName=" + techName + ", participant="
				+ participant + "]";
	}

}
