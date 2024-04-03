package com.naeddoco.nsmwspring.model.provisionDownloadCouponModel;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Repository("provisionDownloadCouponDAO")
@Slf4j
public class ProvisionDownloadCouponDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	private static final String SELECTALL = "";
	
	private static final String SELECTONE = "";

	private static final String INSERT = "INSERT INTO PROVISION_DOWNLOAD_COUPON "
										+ "(COUPON_ID, IMAGE_ID, DEPLOY_DEADLINE, DEPLOY_STATUS) "
										+ "VALUES (?,?,?,?)";
	// 쿠폰 이미지 변경시 IMAGE_ID도 변경
	private static final String UPDATE_IMAGE_ID = "UPDATE PROVISION_DOWNLOAD_COUPON "
										+ "SET IMAGE_ID = ? "
										+ "WHERE PROVISION_DOWNLOAD_COUPON_ID = ?";
	
	// 다운로드쿠폰 정보 변경
	private static final String UPDATE = "UPDATE PROVISION_DOWNLOAD_COUPON "
										+ "SET DEPLOY_DEADLINE = ?, "
										+ "DEPLOY_STATUS = ? "
										+ "WHERE PROVISION_DOWNLOAD_COUPON_ID = ? ";
	
	
	// 배포상태 '중단'으로 변경
	private static final String UPDATE_DEPLOY_STATUS = "UPDATE PROVISION_DOWNLOAD_COUPON "
													 + "SET DEPLOY_STATUS = 'STOP' "
													 + "WHERE PROVISION_DOWNLOAD_COUPON_ID = ?";
	
	private static final String DELETE = "";

	/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

	public List<ProvisionDownloadCouponDTO> selectAll(ProvisionDownloadCouponDTO provisionDownloadCouponDTO) {

		log.trace("selectAll 진입");

		if (provisionDownloadCouponDTO.getSearchCondition().equals("")) {

			log.trace(" 진입 ");

			try {

				return (List<ProvisionDownloadCouponDTO>) jdbcTemplate.query(SELECTALL, new ProvisionDownloadCouponRowMapper());

			} catch (Exception e) {

				log.error(" 예외/실패 ");

				return null;

			}

		}

		log.error("selectAll 실패");

		return null;

	}

	/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

	public ProvisionDownloadCouponDTO selectOne(ProvisionDownloadCouponDTO provisionDownloadCouponDTO) {
		
//		log.debug("[로그] 처리 진입");
//		
//		if(provisionGradeCouponDTO.getSearchCondition().equals("")) {
//			
//			log.debug("[로그]처리 진입");
//			
//			Object[] args = { provisionDownloadCouponDTO.getProvisionDownloadCouponID() };
//
//			try {
//
//				return jdbcTemplate.queryForObject(SELECTONE, args, new ProvisionDownloadCouponRowMapper());
//
//			} catch (Exception e) {
//				
//				log.debug("[로그] 예외 발생");
//
//				return null;
//
//			}
//			
//		}
//		
//		log.debug("[로그] 처리 실패");
		
		return null;

	}

	/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

	public boolean insert(ProvisionDownloadCouponDTO provisionDownloadCouponDTO) {

		log.trace("insert 처리 진입");

		int result = 0;

		if (provisionDownloadCouponDTO.getSearchCondition().equals("insertAdminCouponGradeData")) {
			log.trace("insertAdminCouponGradeData 처리 진입");
			
			result = jdbcTemplate.update(INSERT, provisionDownloadCouponDTO.getCouponID(),
												 provisionDownloadCouponDTO.getImageID(), 
												 provisionDownloadCouponDTO.getDeployDeadline(), 
												 provisionDownloadCouponDTO.getDeployStatus());
			
			if (result <= 0) {

				log.error("insertAdminCouponGradeData 실패");
				return false;

			}

			log.trace("insertAdminCouponGradeData 성공");
			return true;
		}
		
		log.error("insert 실패");
		return false;
	}

	/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

	public boolean update(ProvisionDownloadCouponDTO provisionDownloadCouponDTO) {

		log.trace("update 진입");

		if (provisionDownloadCouponDTO.getSearchCondition().equals("updateAdminCouponDownloadImageID")) {

			log.trace("updateAdminCouponDownloadImageID 진입");

			int result = jdbcTemplate.update(UPDATE_IMAGE_ID, provisionDownloadCouponDTO.getImageID(),
															  provisionDownloadCouponDTO.getProvisionDownloadCouponID());

			if(result <= 0) {
				log.error("updateAdminCouponDownloadImageID 실패");
				return false;

			}

			log.trace("updateAdminCouponDownloadImageID 성공");
			return true;

		}
		else if (provisionDownloadCouponDTO.getSearchCondition().equals("updateAdminCouponDownloadData")) {

			log.trace("updateAdminCouponDownloadData 진입");

			int result = jdbcTemplate.update(UPDATE, provisionDownloadCouponDTO.getDeployDeadline(),
													 provisionDownloadCouponDTO.getDeployStatus(),
													 provisionDownloadCouponDTO.getProvisionDownloadCouponID());

			if(result <= 0) {
				log.error("updateAdminCouponDownloadData 실패");
				return false;

			}

			log.trace("updateAdminCouponDownloadData 성공");
			return true;

		}
		else if (provisionDownloadCouponDTO.getSearchCondition().equals("stopAdminCouponDownloadData")) {

			log.trace("stopAdminCouponDownloadData 진입");

			int result = jdbcTemplate.update(UPDATE_DEPLOY_STATUS, provisionDownloadCouponDTO.getProvisionDownloadCouponID());

			if(result <= 0) {
				log.error("stopAdminCouponDownloadData 실패");
				return false;

			}

			log.trace("stopAdminCouponDownloadData 성공");
			return true;
		}
		
		log.error("update 실패");
		return false;
	}
	
	
	public boolean delete(ProvisionDownloadCouponDTO provisionDownloadCouponDTO) {
			return false;

	}


}

/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

@Slf4j
class ProvisionDownloadCouponRowMapper implements RowMapper<ProvisionDownloadCouponDTO> {

	@Override
	public ProvisionDownloadCouponDTO mapRow(ResultSet rs, int rowNum) throws SQLException {

		log.trace("ProvisionDownloadCouponRowMapper 처리 진입");

		ProvisionDownloadCouponDTO data = new ProvisionDownloadCouponDTO();

		data.setProvisionDownloadCouponID(rs.getInt("PDC.PROVISION_DOWNLOAD_COUPON_ID"));
		data.setAncCouponName(rs.getString("C.COUPON_NAME"));
		data.setAncCreateDate(rs.getTimestamp("C.CREATE_DATE"));
		data.setAncDistributeDate(rs.getTimestamp("C.DISTRIBUTE_DATE"));
		data.setAncExpirationDate(rs.getTimestamp("C.EXPIRATION_DATE"));
		data.setAncCategoryName(rs.getString("CATEGORY_NAME"));
		data.setAncCouponType(rs.getString("C.COUPON_TYPE"));
		data.setAncDiscount(rs.getInt("DISCOUNT"));
		data.setAncAmount(rs.getInt("AMOUNT_LIMIT"));
		data.setDeployStatus(rs.getString("PDC.DEPLOY_STATUS"));
		data.setDeployDeadline(rs.getTimestamp("PDC.DEPLOY_DEADLINE"));
		data.setAncImageID(rs.getInt("I.IMAGE_ID"));
		data.setAncImagePath(rs.getString("I.IMAGE_PATH"));

		log.trace("ProvisionDownloadCouponRowMapper 처리 완료");

		return data;

	}

}
