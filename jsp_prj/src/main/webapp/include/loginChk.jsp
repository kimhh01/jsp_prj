<%@ page language="java" pageEncoding="UTF-8"%>

<%
if(session.getAttribute("name") == null){
    response.sendRedirect("/jsp_prj/day0619/useSessionA.jsp");
    return;
}
%>