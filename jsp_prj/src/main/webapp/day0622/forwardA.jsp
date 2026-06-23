<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
// 업무처리한 결과
String name = "테스트";
String [] job = {"SI-개발","SM-유지보수","QA-테스트","SE-엔지니어","OP-운영"};
request.setAttribute("name", name);
request.setAttribute("jobArr", job);

String addr = "서울시 강남구 대치동";
String addr2 = "서울시 강남구 역삼동";

%>

<jsp:forward page="forwardB.jsp"/>
<jsp:param value="<%=addr %>" name="addr"/>
<jsp:param value="<%=addr2 %>" name="addr2"/>