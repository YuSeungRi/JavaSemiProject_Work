package dao;

import java.util.ArrayList;

import dto.CodeCategoryDto;
import dto.CodeDto;

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
	
}
