package com.naeddoco.nsmwspring.model.orderInfoModel;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naeddoco.nsmwspring.model.productCategoryModel.ProductCategoryDAO;
import com.naeddoco.nsmwspring.model.productCategoryModel.ProductCategoryDTO;

@Service("orderInfoService")
public class OrderInfoServiceImpl implements OrderInfoService {

	@Autowired
	private OrderInfoDAO orderInfoDAO;
	
	@Override
	public List<OrderInfoDTO> selectAll(OrderInfoDTO orderInfoDTO) {
		return orderInfoDAO.selectAll(orderInfoDTO);
	}
	
}