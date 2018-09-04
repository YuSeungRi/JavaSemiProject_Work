package Service;

import java.util.List;

import board.util.Paging;
import dao.ProjectDao;
import dao.ProjectDaoImpl;
import dto.ProjectDto;
import dto.ProjectTechDto;

public class ProjectService {
	
	private ProjectDao projectDao = new ProjectDaoImpl();

	public int getTotal() {
		return projectDao.selectCntAll();
	}

	public List getPagingList(Paging paging) {
		return projectDao.selectPagingList(paging);
	}
	
	public List<ProjectTechDto> techList() {
		return projectDao.techList();
	}

	public ProjectDto getProjectBoard(int projectNo) {		
		return projectDao.getProjectBoard(projectNo);
	}
}
