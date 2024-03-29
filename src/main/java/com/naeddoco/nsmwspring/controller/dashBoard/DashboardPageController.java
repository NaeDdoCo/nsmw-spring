package com.naeddoco.nsmwspring.controller.dashBoard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.naeddoco.nsmwspring.model.dailySalesStatsModel.DailySalesStatsDTO;
import com.naeddoco.nsmwspring.model.dailySalesStatsModel.DailySalesStatsService;

@Controller
public class DashboardPageController {
	
	@Autowired
	private DailySalesStatsService dailySalesStatsService;
	
	@GetMapping("/dashboard")
	public String dashboardPage(DailySalesStatsDTO dailySalesStatsDTO, Model model) {
		
		System.out.println("[log] Controller dashboardPage요청");
		
		dailySalesStatsDTO.setSearchCondition("selectDashboardDatas");
		
		List<DailySalesStatsDTO> dailySalesStatsList = dailySalesStatsService.selectAll(dailySalesStatsDTO);
		
		dailySalesStatsList = dailySalesStatsService.selectAll(dailySalesStatsDTO);
		
		model.addAttribute("dashboardDailySalesStats", dailySalesStatsList);
		
		return "admin/dashboard";
	}
}