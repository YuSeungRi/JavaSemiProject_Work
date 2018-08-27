package dao;

import java.util.ArrayList;

import dto.ReplyDto;

public interface ReplyDao {
	
	/**
	 * Get Reply List for one board content
	 * @param boardNo
	 * @return
	 */
	public ArrayList<ReplyDto>getReplyList(int boardNo);
	
	/**
	 * Get Reply list for one's mypage
	 * @param userEmail
	 * @return
	 */
	public ArrayList<ReplyDto> getMyReply(String userEmail);
	
	/**
	 * Add new Reply
	 * @param dto
	 * @return
	 */
	public int addNewReply(ReplyDto dto);
	
	/**
	 * Delete Reply
	 * @param replyNo
	 * @return
	 */
	public int deleteReply(int replyNo);
	
	
}
