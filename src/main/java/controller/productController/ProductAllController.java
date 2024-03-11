package controller.productController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import model.productModel.ProductDAO;
import model.productModel.ProductDTO;

@Controller
public class ProductAllController {

	@RequestMapping("/productAllPage")
	// productDTO는 Command 객체 사용
	public String productAll(ProductDTO productDTO) {
		
		
		// 이동할 페이지명
		return "productAllPage";
	}
}
