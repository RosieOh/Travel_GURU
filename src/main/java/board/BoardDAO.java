package board;

import java.sql.*;
import java.util.*;
import java.text.SimpleDateFormat;

import util.SQL_Connect;

public class BoardDAO {
	SimpleDateFormat sdf = new SimpleDateFormat( "MM-dd HH:mm" , Locale.KOREA );
	
	public int insert(BoardDTO board) {
		Connection conn = SQL_Connect.open();

		String sql = "INSERT INTO board(user_id, title, content) VALUES(?, ?, ?)";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getUser_id());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getContent());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			SQL_Connect.close(conn, pstmt);
		}
		return -1;
	}
	public List<BoardDTO> findAll() {
		Connection conn = SQL_Connect.open();

		String sql = "SELECT board.id, board.user_id, users.name, board.title, board.content, board.viewcount, board.createdate "
				+ "FROM board INNER JOIN users ON board.user_id = users.id"
				+ "WHERE board.isdeleted = false";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BoardDTO> result = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardDTO board = BoardDTO.builder()
						.id(rs.getInt("id"))
						.user_id(rs.getString("name"))
						.user_name(rs.getString("name"))
						.title(rs.getString("title"))
						.content(rs.getString("content"))
						.viewCount(rs.getInt("viewcount"))
						.createDate(sdf.format(rs.getTimestamp("createdate")))
						.build();
				result.add(board);
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SQL_Connect.close(conn, pstmt, rs);
		}
		return null;
	}
	
	public List<BoardDTO> findLimit(int start, int length) {
		Connection conn = SQL_Connect.open();

		String sql = "SELECT board.id, board.user_id, users.name, board.title, board.content, board.viewcount, board.createdate "
				+ "FROM board INNER JOIN users ON board.user_id = users.id "
				+ "WHERE board.isdeleted = false ORDER BY board.id DESC LIMIT ?, ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BoardDTO> result = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, length);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardDTO board = BoardDTO.builder()
						.id(rs.getInt("id"))
						.user_id(rs.getString("name"))
						.user_name(rs.getString("name"))
						.title(rs.getString("title"))
						.content(rs.getString("content"))
						.viewCount(rs.getInt("viewcount"))
						.createDate(sdf.format(rs.getTimestamp("createdate")))
						.build();
				result.add(board);
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SQL_Connect.close(conn, pstmt, rs);
		}
		return null;
	}
	
	public BoardDTO findById(int board_id) {
		Connection conn = SQL_Connect.open();

		String sql = "SELECT board.id, board.user_id, users.name, board.title, board.content, board.viewcount, board.createdate "
				+ "FROM board INNER JOIN users ON board.user_id = users.id "
				+ "WHERE board.id=?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				BoardDTO board = BoardDTO.builder()
						.id(rs.getInt("id"))
						.user_id(rs.getString("name"))
						.user_name(rs.getString("name"))
						.title(rs.getString("title"))
						.content(rs.getString("content"))
						.viewCount(rs.getInt("viewcount"))
						.createDate(sdf.format(rs.getTimestamp("createdate")))
						.build();
				return board;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SQL_Connect.close(conn, pstmt, rs);
		}
		return null;
	}
	
	public int countAll() {
		Connection conn = SQL_Connect.open();
		
		String sql = "SELECT COUNT(*)FROM board";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SQL_Connect.close(conn, pstmt, rs);
		}
		return -1;
	}
	
	public int viewUpdate(int board_id) {
		Connection conn = SQL_Connect.open();
		
		String sql = "UPDATE board SET viewcount = viewcount + 1 where id = ?";
		
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_id);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SQL_Connect.close(conn, pstmt);
		}
		return -1;
	}
}
