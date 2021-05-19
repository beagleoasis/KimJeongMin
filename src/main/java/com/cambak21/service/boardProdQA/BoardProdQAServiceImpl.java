package com.cambak21.service.boardProdQA;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.ProdQAVO;
import com.cambak21.domain.ProdQAsLikeVO;
import com.cambak21.dto.ProdQAInsertDTO;
import com.cambak21.dto.ProdQAUpdateDTO;
import com.cambak21.persistence.boardProdQA.BoardProdQADAO;
import com.cambak21.util.PagingCriteria;

@Service
public class BoardProdQAServiceImpl implements BoardProdQAService {
	@Inject
	private BoardProdQADAO dao;

	@Override
	public List<ProdQAVO> prodQAListAll(int product_id, int prodQA_refOrder, PagingCriteria cri, String prodQA_category) throws Exception {
		return dao.prodQAListAll(product_id, prodQA_refOrder, cri, prodQA_category);
	}

	@Override
	public boolean insertProdQA(ProdQAInsertDTO insertQA) throws Exception {
		boolean result = false;
				
		int i = dao.insertProdQA(insertQA);
		
		if(i == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public boolean checkSecretPwd(String prodQA_secretPassword, int prodQA_no) throws Exception {
		boolean result = false;
		
		int i = dao.checkSecretPwd(prodQA_secretPassword, prodQA_no);
		
		if(i == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public boolean deleteProdQA(int prodQA_no) throws Exception {
		boolean result = false;
		
		int i = dao.deleteProdQA(prodQA_no);
		
		if(i == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public boolean updateProdQA(ProdQAUpdateDTO updateQA) throws Exception {
		boolean result = false;
		
		int i = dao.updateProdQA(updateQA);
		
		if(i == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public ProdQAUpdateDTO prodQADetail(int product_id, int prodQA_no) throws Exception {
		return dao.prodQADetail(product_id, prodQA_no);
	}

	@Override
	public int totalProdQACnt(int product_id, int prodQA_refOrder, String prodQA_category) throws Exception {
		return dao.totalProdQACnt(product_id, prodQA_refOrder, prodQA_category);
	}

	@Override
	public boolean prodQAViewCnt(int prodQA_no) throws Exception {
		boolean result = false;
		
		int i = dao.prodQAViewCnt(prodQA_no);
		
		if(i == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public boolean prodQALikeCnt(int prodQA_no) throws Exception {
		boolean result = false;
		
		int i = dao.prodQALikeCnt(prodQA_no);
		
		if(i == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public int getMaxNo() throws Exception {
		int result = 0;
		
		if (dao.getQANum() != 0) {
			result = dao.getMaxNo();
		}
		
		return result;
	}

	@Override
	public boolean prodQAInsertLike(ProdQAsLikeVO vo) throws Exception {
		boolean result = false;
		
		int i = dao.prodQAInsertLike(vo);
		
		if(i == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public boolean prodQADeleteLike(ProdQAsLikeVO vo) throws Exception {
		boolean result = false;
		
		int i = dao.prodQADeleteLike(vo);
		
		if(i == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public List<ProdQAVO> prodQAReplyListAll(int prodQA_no) throws Exception {
		return dao.prodQAReplyListAll(prodQA_no);
	}

	@Override
	public List<ProdQAsLikeVO> getLikes(String member_id) throws Exception {
		return dao.getLikes(member_id);
	}

	@Override
	public int getMaxRefOrder(int prodQA_no) throws Exception {
		return dao.getMaxRefOrder(prodQA_no);
	}

	@Override
	public int getMaxStep(int prodQA_no) throws Exception {
		return dao.getMaxStep(prodQA_no);
	}

	@Override
	public int getRef(int prodQA_no) throws Exception {
		return dao.getRef(prodQA_no);
	}

	@Override
	public int getReplyCnt(int prodQA_no) throws Exception {
		return dao.getReplyCnt(prodQA_no);
	}

	@Override
	public int getRestProdQty(int product_id) throws Exception {
		return dao.getRestProdQty(product_id);
	}

}
