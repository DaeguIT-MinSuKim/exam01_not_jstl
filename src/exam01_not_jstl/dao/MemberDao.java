package exam01_not_jstl.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import exam01_not_jstl.ds.JdbcUtil;
import exam01_not_jstl.dto.Member;

public class MemberDao {
	private static final MemberDao instance = new MemberDao();

	private MemberDao() {
	}

	public static MemberDao getInstance() {
		return instance;
	}

	public List<Member> selectMemberByAll() {
		String sql = "select custno, custname, phone, address, joindate, grade, city " + "from MEMBER_TBL_02";
		try (Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			if (rs.next()) {
				List<Member> list = new ArrayList<>();
				do {
					list.add(getMember(rs));
				} while (rs.next());
				return list;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	private Member getMember(ResultSet rs) throws SQLException {
		int custNo = rs.getInt("custno");
		String custName = rs.getString("custname");
		String phone = rs.getString("phone");
		String address = rs.getString("address");
		Date joinDate = rs.getDate("joinDate");
		String grade = rs.getString("grade");
		String city = rs.getString("city");
		return new Member(custNo, custName, phone, address, joinDate, grade, city);
	}

	public int insertMember(Member member) {
		String sql = "insert into member_tbl_02(custno, custname, phone, address, joindate, grade, city) "
				+ "values (?, ?, ?, ?, ?, ?, ?)";
		try (Connection con = JdbcUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, member.getCustNo());
			pstmt.setString(2, member.getCustName());
			pstmt.setString(3, member.getPhone());
			pstmt.setString(4, member.getAddress());
			pstmt.setTimestamp(5, new Timestamp(member.getJoinDate().getTime()));
			pstmt.setString(6, member.getGrade());
			pstmt.setString(7, member.getCity());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int updateMember(Member member) {
		String sql = "update member_tbl_02 "
				   + "   set custname=?, phone=?, address=?, joinDate=?, grade=?, city=? "
				   + " where custno = ?";
		try (Connection con = JdbcUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, member.getCustName());
			pstmt.setString(2, member.getPhone());
			pstmt.setString(3, member.getAddress());
			pstmt.setTimestamp(4, new Timestamp(member.getJoinDate().getTime()));
			pstmt.setString(5, member.getGrade());
			pstmt.setString(6, member.getCity());
			pstmt.setInt(7, member.getCustNo());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	public Member selectMemberByNo(int custNo) {
		String sql = "select custno, custname, phone, address, joindate, grade, city" 
	               + "  from member_tbl_02"
				   + " where custno = ?";
		try (Connection con = JdbcUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setInt(1, custNo);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return getMember(rs);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public int nextCustNo() {
		String sql = "SELECT max(custno) + 1 FROM MEMBER_TBL_02";
		try (Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
}
