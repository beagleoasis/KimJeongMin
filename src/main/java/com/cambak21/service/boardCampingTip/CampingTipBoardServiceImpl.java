package com.cambak21.service.boardCampingTip;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.BoardVO;
import com.cambak21.domain.ReplyBoardVO;
import com.cambak21.domain.SearchCampingTipVO;
import com.cambak21.dto.CamBoardTipLikeDTO;
import com.cambak21.dto.CamBoardTipModifyDTO;
import com.cambak21.dto.CamBoardTipReplyDTO;
import com.cambak21.dto.CamBoardTipRereplyDTO;
import com.cambak21.dto.CamBoardTipWriteDTO;
import com.cambak21.persistence.boardCampingTip.CampingTipBoardDAO;
import com.cambak21.util.PagingCriteria;

@Service
public class CampingTipBoardServiceImpl implements CampingTipBoardService {
	
	@Inject
	private CampingTipBoardDAO dao;
	
	@Override
	public List<BoardVO> listCampingTipBoard(PagingCriteria cri) throws Exception {
		// 캠핑팁 게시판 전체 조회
		return dao.listCampingTipBoard(cri);
	}

	@Override
	public int totalTipBoard() throws Exception {
		// 캠핑팁 게시판 전체 게시물 개수 가져오기
		return dao.totalTipBoard();
	}
	
	@Override
	public List<BoardVO> tipBoardSearch(SearchCampingTipVO word, PagingCriteria cri) throws Exception {
		// 캠핑팁 게시판 검색
		return dao.tipBoardSearch(word, cri);
	}
	
	@Override
	public int totalTipBoardSearch(SearchCampingTipVO word) throws Exception {
		// 캠핑팁 게시판 검색 결과 개수 가져오기
		return dao.totalTipBoardSearch(word);
	}
	
	@Override
	public boolean upViewCount(int board_no) throws Exception {
		// 캠핑팁 게시판 상세 글 조회 수 + 1
		return dao.upViewCount(board_no);
	}
	
	@Override
	public BoardVO viewCampingTipBoard(int board_no, String board_category) throws Exception {
		// 캠핑팁 게시판 상세 조회
		return dao.viewCampingTipBoard(board_no, board_category);
	}
	
	// @Transactional
	@Override
	public int writeCampingTipBoard(CamBoardTipWriteDTO writeDTO) throws Exception {
		// 게시글 쓰기 insert
		int result = 0;
		
		if(dao.writeCampingTipBoard(writeDTO)) {
			result = dao.searchBoardLastNum(writeDTO);
		}
		
		return result;
	}
	
	@Override
	public boolean modifyCampingTipBoard(CamBoardTipModifyDTO modifyDTO) throws Exception {
		// 게시글 수정 update
		return dao.modifyCampingTipBoard(modifyDTO);
	}
	
	@Override
	public boolean deleteCampingTipBoard(int board_no) throws Exception {
		// 게시글 삭제 delete
		boolean result = false;
		
		// 게시글 삭제 시 해당 게시글의 댓글 먼저 모두 삭제 delete
		dao.deleteCampingTipBoardReply(board_no);
		
		if (dao.deleteCampingTipBoard(board_no)) { // 게시글 삭제
			result = true;
		}
		return result;
	}

	@Override
	public List<ReplyBoardVO> readReplyCampingTipBoard(int board_no) throws Exception {
		// 게시글 상세 보기 시 댓글 select
		return dao.readReplyCampingTipBoard(board_no);
	}

	@Override
	public boolean saveCampingTipReply(CamBoardTipReplyDTO replyDTO) throws Exception {
		// 상세 게시글 댓글 작성 insert
		boolean result = false;
		
		if(dao.saveCampingTipReply(replyDTO)) { // 댓글 insert
			
			if(dao.updateCampingTipReplyRef(dao.getCampingTipReplyNextNum(replyDTO))) { // 저장한 댓글의 replyBoard_ref 값을 가져와서 update
				if(dao.updateCampingTipReplyCnt(replyDTO.getBoard_no())) { // 해당 게시글의 댓글 개수 +1
					result = true;
				}
			}
		}
		return result;
	}

	@Override
	public boolean modifyCampingTipReply(int replyBoard_no, String replyBoard_content) throws Exception {
		// 상세 게시글 댓글 수정 update
		return dao.modifyCampingTipReply(replyBoard_no, replyBoard_content);
	}

	@Override
	public boolean deleteCampingTipReply(int replyBoard_no, int board_no) throws Exception {
		// 상세 게시글 댓글 삭제 delete
		boolean result = false;
		
		if(dao.deleteCampingTipReply(replyBoard_no)) {
			if(dao.deleteCampingTipReplyCount(board_no)) {
				result =true;
			}
		}
		return result;
	}

	@Override
	public List<ReplyBoardVO> readRereplyCampingTipBoard(int board_no) throws Exception {
		// 상세 게시글 대댓글 보기 select
		return dao.readRereplyCampingTipBoard(board_no);
	}
	
	@Override
	public boolean addRereplyCampingTipBoard(CamBoardTipRereplyDTO rereplyDTO) throws Exception {
		// 상세 게시글 대댓글 작성 insert
		boolean result = false;
		
		rereplyDTO.setReplyBoard_refOrder(dao.checkReforderMax(rereplyDTO)); // ReplyBoards 테이블에서 max(replyBoard_refOrder) 확인하여 + 1해서 dto에 set해주기
		
		if(dao.addRereplyCampingTipBoard(rereplyDTO)) { // 대댓글 insert
			if(dao.updateCampingTipReplyCnt(rereplyDTO.getBoard_no())) { // 게시물의 댓글 개수 + 1
				if(dao.upRereplyCount(rereplyDTO)) {
					result = true;
				}
			}
		}
		return result;
	}

	@Override
	public boolean modifyRereplyCampingTipBoard(int replyBoard_no, String replyBoard_content) throws Exception {
		// 상세 게시글 대댓글 수정 update
		return dao.modifyRereplyCampingTipBoard(replyBoard_no, replyBoard_content);
	}

	@Override
	public boolean deleteCampingTipRereply(CamBoardTipRereplyDTO dto) throws Exception {
		// 상세 게시글 대댓글 삭제 delete
		boolean result = false;
		if(dao.deleteCampingTipReply(dto.getReplyBoard_no())) {
			if(dao.deleteCampingTipReplyCount(dto.getBoard_no())) {
				if(dao.downRereplyCount(dto.getReplyBoard_ref())) {
					result =true;
				}
			}
		}
		return result;
	}
	
	@Override
	public int checkReplyCount(int board_no) throws Exception {
		// 상세 게시글 댓글 개수 select
		return dao.checkReplyCount(board_no);
	}

	@Override
	public List<ReplyBoardVO> noRereplyAreaBlock(int board_no) throws Exception {
		// 캠핑팁 상세글 대댓글이 없는 댓글의 구역 체크를 위한 기능
		return dao.noRereplyAreaBlock(board_no);
	}

	@Override
	public int readLikeInfo(int board_no, String member_id) throws Exception {
		// 로그인한 유저의 상세게시글 추천 여부 확인
		return dao.readLikeInfo(board_no, member_id);
	}

	@Override
	public int boardLikeUpdate(CamBoardTipLikeDTO dto) throws Exception {
		// 로그인한 유저가 추천하기, 추천취소 버튼 클릭시 게시글 추천 수 +- 1
		int result = 0;
		if(dao.boardLikeUpdate(dto)) {
			if (dao.boardLikeCntUpdate(dto)) {
				result = dao.totalViewBoardLike(dto);
			}
		}
		return result;
	}

}
