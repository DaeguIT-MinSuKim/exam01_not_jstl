<%@page import="exam01_not_jstl.dto.Member"%>
<%@page import="java.util.List"%>
<%@page import="exam01_not_jstl.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	MemberDao memberDao = MemberDao.getInstance();
	List<Member> list = memberDao.selectMemberByAll();
%>
	<section>
		<h2>회원 목록 조회/수정</h2>
		<table border="1">
			<colgroup>
				<col width="10%"><col width="10%"><col width="15%"><col width="30%">
				<col width="15%"><col width="10%"><col width="10%">
			</colgroup>
			<thead>
				<tr>
				    <td>회원번호</td><td>회원성명</td><td>회원전화</td><td>회원주소</td>
				    <td>가입일자</td><td>고객등급</td><td>도시코드</td>
				</tr>
			</thead>
			<tbody>
			<% for(Member member : list){ %>
				<tr>
					<td><a href="/exam01_not_jstl/index.jsp?pp=update&custNo=<%=member.getCustNo() %>" ><%=member.getCustNo() %></a></td>
					<td><%=member.getCustName() %></td>
					<td><%=member.getPhone() %> </td>
					<td><%=member.getAddress() %></td>
					<td><%=member.getJoinDate() %></td>
					<td>
					<% if (member.getGrade().equals("A")){ %>
						VIP
					<% }else if (member.getGrade().equals("B")){ %>
					    일반
					<% }else {%>
						직원
					<%} %>
					</td>
					<td><%=member.getCity() %></td>
				</tr>
			<% } %>	
		
			</tbody>
		</table>
	</section>