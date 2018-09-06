package dao;

import java.util.ArrayList;

import dto.ReplyDto;

/*
 * 수정일 : 2018.09.06
 * 수정자 : 권미현
 *  - addNewReply, deleteReply : 반환 타입 수정
 */

public interface ReplyDao {
	
	/**
	 * Get Reply List for one board content
	 * @param boardNo
	 * @return ArrayList<ReplyDto>
	 */
	public ArrayList<ReplyDto>getReplyList(int boardNo);
	
	/**
	 * Get Reply list for one's mypage
	 * @param userEmail
	 * @return ArrayList<ReplyDto>
	 */
	public ArrayList<ReplyDto> getMyReply(String userEmail);
	
	/**
	 * Add new Reply
	 * @param dto
	 * @return true : success / false : fail
	 */
	public boolean addNewReply(ReplyDto dto);
	
	/**
	 * Delete Reply
	 * @param replyNo
	 * @return true : success / false : fail
	 */
	public boolean deleteReply(int replyNo);
	
	
}
