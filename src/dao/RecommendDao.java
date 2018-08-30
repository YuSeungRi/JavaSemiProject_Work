package dao;

import dto.BoardDto;

public interface RecommendDao {

	// 추천 수 구하기
	public int selectCountRecommend(BoardDto dto);
	
	// 추천 넣기 
	public void insertRecommend(BoardDto dto);
	
	// 추천 삭제
	public void deleteRecommend(BoardDto dto);
	
	// 총 추천 수 구하기
	public int selectTotalRecommend(BoardDto dto);

}
