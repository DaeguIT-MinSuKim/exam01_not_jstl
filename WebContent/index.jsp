<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String pp = request.getParameter("pp");
	if (pp == null) {
		pp = "join";
	}
%>

<jsp:include page="include/top.jsp" />
<jsp:include page="include/nav.jsp" />
<jsp:include page='<%=pp+".jsp"%>' />
<jsp:include page="include/footer.jsp" />