package dao;

import java.util.ArrayList;

import dto.CodeCategoryDto;
import dto.CodeDto;
import dto.TechDto;

public interface CodeDao {
	
	public ArrayList<CodeCategoryDto> getAllCategory(String userEmail);
	
	public int getAllCount(String userEmail);
	
	/**
	 * get CodeList for a category
	 * @param categoryNo
	 * @param userEmail
	 * @return
	 */
	public ArrayList<CodeDto> getCodeList(int categoryNo, String userEmail);
	
	/**
	 * get All CodeList
	 * @param userEmail
	 * @return
	 */
	public ArrayList<CodeDto> getCodeList(String userEmail);

	/**
	 * create new code category
	 * @param categoryName
	 */
	public void createCategory(String categoryName, String userEmail);

	/**
	 * delete a category
	 * @param categoryNo
	 */
	public void deleteCategory(int categoryNo);

	/**
	 * get a code
	 * @param codeNo
	 * @return
	 */
	public CodeDto getCode(int codeNo);
	
	/**
	 * get all tech list
	 * @return
	 */
	public ArrayList<TechDto> getAllTechList();
	
	/**
	 * create new tech
	 * @param techName
	 */
	public void createTech(String techName);
}
