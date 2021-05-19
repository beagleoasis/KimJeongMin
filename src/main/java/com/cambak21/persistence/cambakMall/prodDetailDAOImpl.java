package com.cambak21.persistence.cambakMall;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.BucketVO;
import com.cambak21.domain.NonUserBucketVO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.dto.InsertintoBucketDTO;
import com.cambak21.dto.InsertintoNonUserBucketDTO;
import com.cambak21.dto.mallMainTopCountDTO;

@Repository
public class prodDetailDAOImpl implements prodDetailDAO {
	
	@Inject
	private SqlSession ses;
	private static String namespace="com.cambak21.mappers.cambakMallMapper";
	
	@Override
	public ProductsVO getProdDetail(int product_id) throws Exception {
		return ses.selectOne(namespace + ".getProdDetail", product_id);
	}

	@Override
	public int insertBucket(InsertintoBucketDTO insertBucket) throws Exception {
		return ses.insert(namespace + ".insertBucket", insertBucket);
	}

	@Override
	public BucketVO checkBucket(String member_id, int product_id) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("member_id", member_id);
		params.put("product_id", product_id);
		
		return ses.selectOne(namespace + ".checkBucket", params);
	}

	@Override
	public int updateBucketQty(InsertintoBucketDTO updateBucket) throws Exception {
		return ses.update(namespace + ".updateBucketQty", updateBucket);
	}

	@Override
	public int checkBucketQty(String member_id) throws Exception {
		return ses.selectOne(namespace + ".checkBucketQty", member_id);
	}

	@Override
	public NonUserBucketVO checkNonUserBucket(String nonUserBucket_ssid, int product_id) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("nonUserBucket_ssid", nonUserBucket_ssid);
		params.put("product_id", product_id);
		
		return ses.selectOne(namespace + ".checkNonUserBucket", params);
	}

	@Override
	public int checkNonUserBucketQty(String nonUserBucket_ssid) throws Exception {
		return ses.selectOne(namespace + ".checkNonUserBucketQty", nonUserBucket_ssid);
	}

	@Override
	public int insertNonUserBucket(InsertintoNonUserBucketDTO insertNonUserBucket) throws Exception {
		return ses.insert(namespace + ".insertNonUserBucket", insertNonUserBucket);
	}

	@Override
	public int updateNonUserBucketQty(InsertintoNonUserBucketDTO updateNonUserBucket) throws Exception {
		return ses.update(namespace + ".updateNonUserBucketQty", updateNonUserBucket);
	}

	@Override
	public List<mallMainTopCountDTO> getTopReview() throws Exception {
		return ses.selectList(namespace + ".getTopReview");
	}

	@Override
	public int updateAddBucketQty(InsertintoBucketDTO updateAddBucket) throws Exception {
		return ses.update(namespace + ".updateAddBucketQty", updateAddBucket);
	}

}
