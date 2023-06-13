package user;

import java.sql.*;
import util.SQL_Connect;

public class UserDAO {
	// 회원가입 할 때 사용
		public int insert(UserDTO user) {
			Connection conn = SQL_Connect.open();

			String sql = "INSERT INTO users(id, password, name, email, phone, address, auth)"
					+ "VALUES(?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement pstmt = null;
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, user.getId());
				pstmt.setString(2, user.getPassword());
				pstmt.setString(3, user.getName());
				pstmt.setString(4, user.getEmail());
				pstmt.setString(5, user.getPhone());
				pstmt.setString(6, user.getAddress());
				pstmt.setString(7, user.getAuth());
				return pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} finally {
				SQL_Connect.close(conn, pstmt);
			}
			return -1;
		}

		// 회원가입 시 아이디 체크, 동일한 아이디 있을시 false 리턴
		public boolean idCheck(String id) {
			Connection conn = SQL_Connect.open();

			boolean check;

			String sql = "SELECT * FROM users WHERE id=?";
			PreparedStatement pstmt = null;

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				ResultSet rs = pstmt.executeQuery();
				check = rs.next();
				return !check;
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} finally {
				SQL_Connect.close(conn, pstmt);
			}
			return false;
		}

		// 로그인 할 떄 사용
		public UserDTO login(String id, String password) {
			Connection conn = SQL_Connect.open();

			String sql = "SELECT id, name, auth FROM users WHERE id=? AND password=?";
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, password);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					UserDTO customer = UserDTO.builder()
							.id(rs.getString("id"))
							.name(rs.getString("name"))
							.auth(rs.getString("auth"))
							.build();
					return customer;
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} finally {
				SQL_Connect.close(conn, pstmt, rs);
			}
			return null;
		}
}
