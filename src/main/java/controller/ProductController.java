package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import product.*;
import util.*;

@WebServlet("/product")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO productDAO;
       
    public ProductController() {
        super();
        productDAO = new ProductDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
    	response.setContentType("text/html; charset=utf-8");
    	response.setCharacterEncoding("utf-8");
    	
		String cmd = request.getParameter("cmd");
		RequestDispatcher dis;
		
		ProductDTO product;
		
		switch(cmd) {
		case "serch":
			List<ProductDTO> searchedProductList = new ArrayList<>();
			String keyword = request.getParameter("keyword");
			
			searchedProductList = productDAO.findByKeyword(keyword);
			request.setAttribute("searchedProductList", searchedProductList);
			
			dis = request.getRequestDispatcher("/product/search.jsp");
			dis.forward(request, response);
			break;
		case "info":
			List<ProductDTO> asiaProductList = new ArrayList<>();
			List<ProductDTO> americaProductList = new ArrayList<>();
			List<ProductDTO> europeProductList = new ArrayList<>();
			List<ProductDTO> middleasiaProductList = new ArrayList<>();
			List<ProductDTO> oceaniaProductList = new ArrayList<>();
			
			asiaProductList = productDAO.findByCategory("아시아");
			americaProductList = productDAO.findByCategory("미주");
			europeProductList = productDAO.findByCategory("유럽");
			middleasiaProductList = productDAO.findByCategory("중동");
			oceaniaProductList = productDAO.findByCategory("오세아니아");
			
			request.setAttribute("asiaProductList", asiaProductList);
			request.setAttribute("americaProductList", americaProductList);
			request.setAttribute("europeProductList", europeProductList);
			request.setAttribute("middleasiaProductList", middleasiaProductList);
			request.setAttribute("oceaniaProductList", oceaniaProductList);
			
			dis = request.getRequestDispatcher("/product/productInfo.jsp");
			dis.forward(request, response);
			break;
		}
	}
}
