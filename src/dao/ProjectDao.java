package dao;

import java.util.List;

import board.util.Paging;
import dto.ProjectDto;
import dto.ProjectTechDto;

public interface ProjectDao {	

	// 총 게시글 수 조회
	public int selectCntAll();

	// 페이징 리스트 조회 
	public List<ProjectDto> selectPagingList(Paging paging);
	
	// 기술 리스트 가져오기
	public List<ProjectTechDto> techList();
	
}
