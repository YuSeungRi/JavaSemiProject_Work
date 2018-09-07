package dao;

import java.util.List;

import board.util.Paging;
import dto.ProjectDto;
import dto.ProjectLocationDto;
import dto.ProjectTechDto;

public interface ProjectDao {	

	// 총 게시글 수 조회
	public int selectCntAll();

	// 페이징 리스트 조회 
	public List<ProjectDto> selectPagingList(Paging paging);
	
	// 기술 리스트 가져오기
	public List<ProjectTechDto> techList();
	
	// 프로젝트 상세보기
	public ProjectDto getProjectBoard(int projectNo);

	// 삭제하기
	public void deleteProject(int projectNo);

	// 새글 작성시 사용할 project_no 할당
	public int newProjectNo();

	// 프로젝트 게시글 작성
	public void createProject(ProjectDto projectDto);

	// 프로젝트 게시글 작성시 기술추가 
	public void createProjectTech(ProjectTechDto techDto);

	// 글이 삭제될때 tech도 삭제
	public void deleteTech(int projectNo);

	// 지역 가져오기
	public List<ProjectLocationDto> getAllLocation();

	// 기술 가져오기
	public List<ProjectTechDto> getAlltech();
	
}
