package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cart.*;
import user.UserDTO;
import util.*;

@WebServlet("/cart")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CartDAO cartDAO;
       
    public CartController() {
        super();
        cartDAO = new CartDAO();
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
		String user_id;
		
		HttpSession session;
		
		switch(cmd) {
			case "add":
				session = request.getSession();
				
				if (session.getAttribute("principal") == null) {
					Script.back(response, "로그인이 필요한 항목입니다");
					break;
				}
				
				user_id = ((UserDTO)session.getAttribute("principal")).getId()
;				int product_id = Integer.parseInt(request.getParameter("product_id"));

				boolean isCart = cartDAO.isCart(user_id, product_id);
				
				if (isCart) {
					Script.back(response, "이미 카트에 존재합니다");
					break;
				}
				
				int result = cartDAO.addCart(user_id, product_id);
				
				if (result == 1) {
					Script.back(response, "상품이 카트에 담겼습니다");
				} else {
					Script.back(response, "카트담기 실패");
				}
				break;
			case "show":
				session = request.getSession();
				
				if (session.getAttribute("principal") == null) {
					Script.back(response, "로그인이 필요한 항목입니다");
					break;
				}
				
				user_id = ((UserDTO)session.getAttribute("principal")).getId();
				List<CartDTO> cartList = cartDAO.findById(user_id);
				request.setAttribute("cartList", cartList);
				
				dis = request.getRequestDispatcher("/productCart/productcart.jsp");
				dis.forward(request, response);
				break;
			case "delete":
				String[] cart_ids = request.getParameterValues("delcheckbox");
				if (cart_ids != null) {					
						for(String cart_id: cart_ids) {
							cartDAO.rmvCart(Integer.parseInt(cart_id));
						}
				}
				dis = request.getRequestDispatcher("/cart?cmd=show");
				dis.forward(request, response);
				break;
		}
	}
}