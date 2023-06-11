package product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import util.SQL_Connect;

public class ProductDAO {
	// 모든 Product 찾기
	public List<ProductDTO> findAll(){
		return findAll("");
	}
	
	public List<ProductDTO> findAll(String opt) {
		Connection conn = SQL_Connect.open();
		
		String sql = "SELECT id, name, price, category, summary, content, "
				+ "imgUrl_1, imgUrl_2, imgUrl_3, imgUrl_4 FROM product";
		sql += OptToString(opt);
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<ProductDTO> result = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ProductDTO product = ProductDTO.builder()
						.id(rs.getInt("id"))
						.name(rs.getString("name"))
						.price(rs.getInt("price"))
						.category(rs.getString("category"))
						.summary(rs.getString("summary"))
						.content(rs.getString("content"))
						.imgUrl_1(rs.getString("imgUrl_1"))
						.imgUrl_2(rs.getString("imgUrl_2"))
						.imgUrl_3(rs.getString("imgUrl_3"))
						.imgUrl_4(rs.getString("imgUrl_4"))
						.build();
				result.add(product);
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SQL_Connect.close(conn, pstmt, rs);
		}
		return null;
	}
	
	// 키워드로 Product 찾기
	public List<ProductDTO> findByKeyword(String keyword) {
		return findByKeyword(keyword, "");
	}
	
	public List<ProductDTO> findByKeyword(String keyword, String opt) {
		Connection conn = SQL_Connect.open();
		
		String sql = "SELECT id, name, price, category, summary, content, "
				+ "imgUrl_1, imgUrl_2, imgUrl_3, imgUrl_4 FROM product "
				+ "WHERE name LIKE '%?%'";
		sql += OptToString(opt);
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<ProductDTO> result = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ProductDTO product = ProductDTO.builder()
						.id(rs.getInt("id"))
						.name(rs.getString("name"))
						.price(rs.getInt("price"))
						.category(rs.getString("category"))
						.summary(rs.getString("summary"))
						.content(rs.getString("content"))
						.imgUrl_1(rs.getString("imgUrl_1"))
						.imgUrl_2(rs.getString("imgUrl_2"))
						.imgUrl_3(rs.getString("imgUrl_3"))
						.imgUrl_4(rs.getString("imgUrl_4"))
						.build();
				result.add(product);
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SQL_Connect.close(conn, pstmt, rs);
		}
		return null;
	}
	
	// id로 Product 찾기 (장바구니)
	public ProductDTO findById(int product_id) {
		Connection conn = SQL_Connect.open();
		
		String sql = "SELECT id, name, price, category, summary, content, "
				+ "imgUrl_1, imgUrl_2, imgUrl_3, imgUrl_4 FROM product "
				+ "WHERE id = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, product_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				ProductDTO product = ProductDTO.builder()
						.id(rs.getInt("id"))
						.name(rs.getString("name"))
						.price(rs.getInt("price"))
						.category(rs.getString("category"))
						.summary(rs.getString("summary"))
						.content(rs.getString("content"))
						.imgUrl_1(rs.getString("imgUrl_1"))
						.imgUrl_2(rs.getString("imgUrl_2"))
						.imgUrl_3(rs.getString("imgUrl_3"))
						.imgUrl_4(rs.getString("imgUrl_4"))
						.build();
				return product;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SQL_Connect.close(conn, pstmt, rs);
		}
		return null;
	}
	
	// 카테고로 Product 찾기
		public List<ProductDTO> findByCategory(String category) {
			return findByCategory(category, "");
		}
		
		public List<ProductDTO> findByCategory(String category, String opt) {
			Connection conn = SQL_Connect.open();
			
			String sql = "SELECT id, name, price, category, summary, content, "
					+ "imgUrl_1, imgUrl_2, imgUrl_3, imgUrl_4 FROM product "
					+ "WHERE category=?";
			sql += OptToString(opt);
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			List<ProductDTO> result = new ArrayList<>();
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, category);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					ProductDTO product = ProductDTO.builder()
							.id(rs.getInt("id"))
							.name(rs.getString("name"))
							.price(rs.getInt("price"))
							.category(rs.getString("category"))
							.summary(rs.getString("summary"))
							.content(rs.getString("content"))
							.imgUrl_1(rs.getString("imgUrl_1"))
							.imgUrl_2(rs.getString("imgUrl_2"))
							.imgUrl_3(rs.getString("imgUrl_3"))
							.imgUrl_4(rs.getString("imgUrl_4"))
							.build();
					result.add(product);
				}
				return result;
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				SQL_Connect.close(conn, pstmt, rs);
			}
			return null;
		}
	
	private String OptToString(String opt) {
		switch(opt) {
			case "price_asc":
				return " ORDER BY price ASC";
			case "price_desc":
				return " ORDER BY price DESC";
			default:
				return "";
		}
	}
}
