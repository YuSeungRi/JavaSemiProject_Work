package dto;

public class ProjectLocationDto {
	private int locationNo;
	private String locationName;
	
	public int getLocationNo() {
		return locationNo;
	}
	public void setLocationNo(int locationNo) {
		this.locationNo = locationNo;
	}
	public String getLocationName() {
		return locationName;
	}
	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}
	
	@Override
	public String toString() {
		return "ProjectLocationDto [locationNo=" + locationNo + ", locationName=" + locationName + "]";
	}	
	
}
