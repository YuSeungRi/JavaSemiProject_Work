package dto;

import java.sql.Date;

/*
 * 작성일 : 2018.08.20
 * 작성자 : 유승리
 */

public class ProjectDto {
	private int projectNo;
	private int locationNo;
	private String projectTitle;
	private Date projectStart;
	private Date projectEnd; 
	private String projectContent;
	private int projectParticpant;
	private String projectLead;
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
	public Date getProjectStart() {
		return projectStart;
	}
	public void setProjectStart(Date projectStart) {
		this.projectStart = projectStart;
	}
	public Date getProjectEnd() {
		return projectEnd;
	}
	public void setProjectEnd(Date projectEnd) {
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
	
	
	@Override
	public String toString() {
		return "ProjectDto [projectNo=" + projectNo + ", locationNo=" + locationNo + ", projectTitle=" + projectTitle
				+ ", projectStart=" + projectStart + ", projectEnd=" + projectEnd + ", projectContent=" + projectContent
				+ ", projectParticpant=" + projectParticpant + ", projectLead=" + projectLead + "]";
	}
	
		
}
