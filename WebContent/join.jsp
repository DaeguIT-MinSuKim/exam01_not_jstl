<%@page import="java.text.SimpleDateFormat"%>
<%@page import="exam01_not_jstl.dao.MemberDao"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	MemberDao memberDao = MemberDao.getInstance();
	int custNo = memberDao.nextCustNo();
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	String joinDate = sdf.format(new Date());
%>
	<section>
		<h2>홈쇼핑 회원 등록</h2>
		
		<form action="/exam01_not_jstl/write.jsp?update=n" method="post" id="join">
			<table border="1">
			    <tr>
			        <td>회원번호(자동발생)</td>
			        <td><input type="text" name="custNo" id="custNo" value="<%=custNo %>" readonly="readonly"></td>
			    </tr>
			    <tr>
			        <td>회원성명</td>
			        <td><input type="text" name="custName" id="custName" ></td>
			    </tr>
			    <tr>
			        <td>회원전화</td>
			        <td><input type="text" name="phone" id="phone" ></td>
			    </tr>
			    <tr>
			        <td>회원주소</td>
			        <td><input type="text" name="address" id="address" ></td>
			    </tr>
			    <tr>
			        <td>가입일자</td>
			        <td><input type="text" name="joinDate" id="joinDate" 
			                   value="<%=joinDate%>" 
			                   readonly="readonly">
			        </td>
			    </tr>
			    <tr>
			        <td>고객등급</td>
			        <td><input type="text" name="grade" id="grade" ></td>
			    </tr>
			    <tr>
			        <td>도시코드</td>
			        <td><input type="text" name="city" id="city" ></td>
			    </tr>
			</table>
	 		<div class="btn_group">
			    <button type="submit" onclick="register();return false">등록</button>
			    <button type="button" onclick="location='list.do'">조회</button>
			</div> 
		</form>
	</section>