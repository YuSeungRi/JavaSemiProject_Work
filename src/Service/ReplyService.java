package Service;

import java.util.ArrayList;

import dao.ReplyDao;
import dao.ReplyDaoImpl;
import dto.ReplyDto;

/*
 * 수정일 : 2018.09.06
 * 수정자 : 권미현
 *  - addNewReply(댓글입력) 추가
 */

public class ReplyService {
	
	ReplyDao dao = new ReplyDaoImpl();
	
	// 댓글 가져오기(게시글)
	public ArrayList<ReplyDto> getReplyList(int boardNo) {
		
		return dao.getReplyList(boardNo);
	}
	
	// 댓글 입력
	public boolean addNewReply(ReplyDto dto) {
		return dao.addNewReply(dto);
	}
	
}
