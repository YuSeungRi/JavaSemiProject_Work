package Service;

import java.util.List;

import board.util.Paging;
import dao.ProjectDao;
import dao.ProjectDaoImpl;
import dto.ProjectDto;
import dto.ProjectLocationDto;
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

	public List<ProjectTechDto> techList(int projectNo) {
		return projectDao.techList(projectNo);
	}
	
	public ProjectDto getProjectBoard(int projectNo) {		
		return projectDao.getProjectBoard(projectNo);
	}

	public void deleteProject(int projectNo) {
		projectDao.deleteProject(projectNo);
	}

	public int getNewProjectNo() {
		return projectDao.newProjectNo();
	}

	public void write(ProjectDto projectDto) {
		projectDao.createProject(projectDto);
	}

	public void techWrite(ProjectTechDto techDto) {
		projectDao.createProjectTech(techDto);
	}

	public void deleteTech(int projectNo) {
		projectDao.deleteTech(projectNo);
	}

	public List<ProjectLocationDto> getAllLocation() {
		return projectDao.getAllLocation();
	}

	public List<ProjectTechDto> getAlltech() {
		return projectDao.getAlltech();
	}

	public void update(ProjectDto projectDto) {
		projectDao.update(projectDto);
	}

//	public void techUpdate(ProjectTechDto techDto) {
//		projectDao.techUpdate(techDto);		
//	}
}
