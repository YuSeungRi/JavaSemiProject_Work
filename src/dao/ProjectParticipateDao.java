package dao;

import java.util.List;

import dto.ProjectDto;
import dto.ProjectUserDto;

public interface ProjectParticipateDao {

	// 참가자 수 구하기
	public int selectCountParticipate(ProjectDto projectDto);
	
	// 참가하기  
	public void insertParticipate(ProjectDto projectDto);
	
	// 참가 취소 
	public void deleteParticipate(ProjectDto projectDto);
	
	// 총 참가 수 구하기
	public int selectTotalParticipate(ProjectDto projectDto);

	// 참가자 목록
	public List<ProjectUserDto> participateList(int projectNo);

	
}
