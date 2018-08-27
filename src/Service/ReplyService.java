package Service;

import java.util.ArrayList;

import dao.ReplyDao;
import dao.ReplyDaoImpl;
import dto.ReplyDto;

public class ReplyService {
	
	ReplyDao dao = new ReplyDaoImpl();
	
	public ArrayList<ReplyDto> getReplyList(int boardNo) {
		
		return dao.getReplyList(boardNo);
	}
	
}
