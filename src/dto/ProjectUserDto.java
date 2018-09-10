package dto;

public class ProjectUserDto {

	private String projectUserNick;
	private String projectUserMail;
	private int projectNo; 
	private int participate;
	public String getProjectUserNick() {
		return projectUserNick;
	}
	public void setProjectUserNick(String projectUserNick) {
		this.projectUserNick = projectUserNick;
	}
	public String getProjectUserMail() {
		return projectUserMail;
	}
	public void setProjectUserMail(String projectUserMail) {
		this.projectUserMail = projectUserMail;
	}
	public int getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}
	public int getParticipate() {
		return participate;
	}
	public void setParticipate(int participate) {
		this.participate = participate;
	}
	@Override
	public String toString() {
		return "ProjectUserDto [projectUserNick=" + projectUserNick + ", projectUserMail=" + projectUserMail
				+ ", projectNo=" + projectNo + ", participate=" + participate + "]";
	}
	

	
	
}
