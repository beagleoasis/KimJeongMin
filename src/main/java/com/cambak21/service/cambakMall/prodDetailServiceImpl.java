package com.cambak21.service.cambakMall;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.BucketVO;
import com.cambak21.domain.NonUserBucketVO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.dto.InsertintoBucketDTO;
import com.cambak21.dto.InsertintoNonUserBucketDTO;
import com.cambak21.dto.mallMainTopCountDTO;
import com.cambak21.persistence.cambakMall.prodDetailDAO;

@Service
public class prodDetailServiceImpl implements prodDetailService {
	
	@Inject
	private prodDetailDAO dao;
	
	@Override
	public ProductsVO getProdDetail(int product_id) throws Exception {
		return dao.getProdDetail(product_id);
	}

	@Override
	public boolean insertBucket(InsertintoBucketDTO insertBucket) throws Exception {
		boolean result = false;
		
		int i = dao.insertBucket(insertBucket);
		
		if(i == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public BucketVO checkBucket(String member_id, int product_id) throws Exception {		
		return dao.checkBucket(member_id, product_id);
	}

	@Override
	public boolean updateBucketQty(InsertintoBucketDTO updateBucket) throws Exception {
		boolean result = false;
		
		int i = dao.updateBucketQty(updateBucket);
		
		if(i == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public int checkBucketQty(String member_id) throws Exception {
		return dao.checkBucketQty(member_id);
	}

	@Override
	public NonUserBucketVO checkNonUserBucket(String nonUserBucket_ssid, int product_id) throws Exception {
		return dao.checkNonUserBucket(nonUserBucket_ssid, product_id);
	}

	@Override
	public int checkNonUserBucketQty(String nonUserBucket_ssid) throws Exception {
		return dao.checkNonUserBucketQty(nonUserBucket_ssid);
	}

	@Override
	public boolean insertNonUserBucket(InsertintoNonUserBucketDTO insertNonUserBucket) throws Exception {
		boolean result = false;
		
		int i = dao.insertNonUserBucket(insertNonUserBucket);
		
		if(i == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public boolean updateNonUserBucketQty(InsertintoNonUserBucketDTO updateNonUserBucket) throws Exception {
		boolean result = false;
		
		int i = dao.updateNonUserBucketQty(updateNonUserBucket);
		
		if(i == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public List<mallMainTopCountDTO> getTopReview() throws Exception {
		return dao.getTopReview();
	}

	@Override
	public boolean updateAddBucketQty(InsertintoBucketDTO updateAddBucket) throws Exception {
		boolean result = false;
		
		int i = dao.updateAddBucketQty(updateAddBucket);
		
		if(i == 1) {
			result = true;
		}
		
		return result;
		
	}

}
