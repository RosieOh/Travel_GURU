package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.*;
import util.*;

@WebServlet("/user")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
       
    public UserController() {
        super();
        userDAO = new UserDAO();
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
		
		String id;
		boolean idUniqle;
		UserDTO user;
		
		switch(cmd) {
			case "idCheck":
				id = request.getParameter("user_id");
				idUniqle = userDAO.idCheck(id);
				request.setAttribute("idUniqle", idUniqle);
				dis = request.getRequestDispatcher("signup/idCheck.jsp");
				dis.forward(request, response);
				break;
			case "join":
				user = UserDTO.builder().id(request.getParameter("id"))
									.password(SHA256.toSHA256(request.getParameter("password")))
									.name(request.getParameter("name"))
									.email(request.getParameter("email"))
									.phone(request.getParameter("phone"))
									.address(request.getParameter("address"))
									.auth("user")
									.build();
				int result = userDAO.insert(user);
				
				if (result == 1) {
					user = userDAO.login(user.getId(), user.getPassword());
					HttpSession session = request.getSession();
					session.setAttribute("principal", user);
					dis = request.getRequestDispatcher("index.jsp");
					dis.forward(request, response);
				} else {
					Script.back(response, "회원가입 실패");
				}
				break;
			case "login":
				id = request.getParameter("id");
				idUniqle = userDAO.idCheck(id);
				
				if (idUniqle) {
					Script.back(response, "존재하지 않는 아이디입니다");
					break;
				}
				
				user = userDAO.login(request.getParameter("id"),
						SHA256.toSHA256(request.getParameter("password")));
				
				if (user == null) {
					Script.back(response, "비밀번호가 일치하지 않습니다");
				} else {
					HttpSession session = request.getSession();
					session.setAttribute("principal", user);
					dis = request.getRequestDispatcher("index.jsp");
					dis.forward(request, response);
				}
				break;
			case "logout":
				HttpSession session = request.getSession();
				session.invalidate();
				dis = request.getRequestDispatcher("index.jsp");
				dis.forward(request, response);
				break;
			
		}
	}
}
