<%@page import="exam01_not_jstl.dao.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="exam01_not_jstl.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String updateStr = request.getParameter("update");
	
	int custNo = Integer.parseInt(request.getParameter("custNo"));
	String custName = request.getParameter("custName");
	String address = request.getParameter("address");
	String phone = request.getParameter("phone");
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	Date joinDate = sdf.parse(request.getParameter("joinDate"));
	
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");
	
	Member member = new Member(custNo, custName, phone, address, joinDate, grade, city);
	int res = -1;
	if (updateStr.equalsIgnoreCase("y")){
		res = MemberDao.getInstance().updateMember(member);
	}else{
		res = MemberDao.getInstance().insertMember(member);
	}
	
%>

<script>
	location.href = "/exam01_not_jstl/index.jsp?pp=list";
</script>





