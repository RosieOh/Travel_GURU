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

import board.*;
import user.UserDTO;
import util.*;

@WebServlet("/board")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private BoardDAO boardDAO;  
	
    public BoardController() {
        super();
        boardDAO = new BoardDAO();
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
		
		BoardDTO board;
		
		switch(cmd) {
			case "insert":
				HttpSession session = request.getSession();
				board = BoardDTO.builder().user_id(((UserDTO)session.getAttribute("principal")).getId())
										.title(request.getParameter("title"))
										.content(request.getParameter("content"))
										.build();
				int result = boardDAO.insert(board);
				
				if (result == 1) {
					dis = request.getRequestDispatcher("/board?cmd=list");
					dis.forward(request, response);
				} else {
					Script.back(response, "글쓰기 실패");
				}
				break;
			case "list":
				int index;
				
				if(request.getParameter("index") != null) {					
					index = Integer.parseInt(request.getParameter("index"));
				}
				else {
					index = 1;
				}
				
				int boardCnt = boardDAO.countAll();
				List<BoardDTO> boardList = boardDAO.findLimit((index-1) * 5, 5);
				
				request.setAttribute("index", index);
				request.setAttribute("boardCnt", boardCnt);
				request.setAttribute("boardList", boardList);
				
				dis = request.getRequestDispatcher("/Consumer/ConsumerList.jsp");
				dis.forward(request, response);
				break;
			case "view":
				int board_id = Integer.parseInt(request.getParameter("board_id"));
				boardDAO.viewUpdate(board_id);
				board = boardDAO.findById(board_id);
				
				request.setAttribute("board", board);
				
				dis = request.getRequestDispatcher("/Consumer/ConsumerView.jsp");
				dis.forward(request, response);
				break;
		}
	}
}
