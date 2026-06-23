<%@page import="day0622.CounterDTO"%>
<%@page import="day0622.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
CounterDTO cDTO = (CounterDTO)request.getAttribute("cDTO");
CounterDTO cDTO2 = (CounterDTO)session.getAttribute("cDTO");
CounterDTO cDTO3 = (CounterDTO)application.getAttribute("cDTO");
%>
request : <%=cDTO%> <br>
session : <%=cDTO2%> <br>
application : <%=cDTO3%>