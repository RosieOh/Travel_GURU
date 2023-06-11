package review;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import util.SQL_Connect;

public class ReviewDAO {
	public int insert(ReviewDTO review) {
		Connection conn = SQL_Connect.open();
		
		String sql = "INSERT INTO review(customer_id, product_id, detail) VALUES(?, ?, ?)";
		
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, review.getCustomer_id());
			pstmt.setInt(2, review.getProduct_id());
			pstmt.setString(3, review.getDetail());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SQL_Connect.close(conn, pstmt);
		}
		return -1;
	}
	
	public List<ReviewDTO> findMine(int userId) {
		Connection conn = SQL_Connect.open();
		
		String sql = "SELECT r.id, r.detail, r.createDate, r.updateDate, c.name "
				+ "FROM review r INNER JOIN customer c ON r.customer_id = c.customer_id "
				+ "WHERE r.customer_id = ? ORDER BY r.createDate DESC";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ReviewDTO> result = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ReviewDTO review = ReviewDTO.builder()
						.id(rs.getInt("r.id"))
						.detail(rs.getString("r.detail").replaceAll("<p>", "").replaceAll("</p>", ""))
						.createDate(rs.getTimestamp("r.createDate"))
						.updateDate(rs.getTimestamp("r.createDate"))
						.customer_name(rs.getString("c.name"))
						.build();
				result.add(review);
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SQL_Connect.close(conn, pstmt, rs);
		}
		return null;
	}
	
	public List<ReviewDTO> findByProdId(int prodId) {
		Connection conn = SQL_Connect.open();
		
		String sql = "SELECT r.id, r.detail, r.createDate, r.updateDate, c.name "
				+ "FROM review r INNER JOIN customer c ON r.customer_id = c.customer_id "
				+ "WHERE r.product_id = ? ORDER BY r.createDate DESC";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ReviewDTO> result = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, prodId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ReviewDTO review = ReviewDTO.builder()
						.id(rs.getInt("r.id"))
						.detail(rs.getString("r.detail").replaceAll("<p>", "").replaceAll("</p>", ""))
						.createDate(rs.getTimestamp("r.createDate"))
						.updateDate(rs.getTimestamp("r.createDate"))
						.customer_name(rs.getString("c.name"))
						.build();
				result.add(review);
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SQL_Connect.close(conn, pstmt, rs);
		}
		return null;
	}
	
	public int countByProdId(int prodId) {
		Connection conn = SQL_Connect.open();
		
		String sql = "SELECT count(id) FROM review WHERE product_id = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, prodId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt("count(id)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SQL_Connect.close(conn, pstmt, rs);
		}
		return -1;
	}
}
