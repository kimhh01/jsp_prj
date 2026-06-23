<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href = "http://192.168.10.87/jsp_prj/common/images/favicon.ico"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.min.js" integrity="sha384-G/EV+4j2dNv+tEPo3++6LCgdCROaejBqfUeNjuKAiuXbjrxilcCdDz6ZAVfHWe1Y" crossorigin="anonymous"></script>

<style type="text/css">
#wrap {width: 1000px; height: 900px; margin: 0px auto;}
#header {height: 200px;}
#container {height: 600px;}
#footer {height: 100px;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script type="text/javascript">

    $(function(){
        
    });
    
</script>

</head>
<body>
<div id = wrap>
<div id = header></div>
<div id = container>
<ul>
<li>요청방식 : <%=request.getMethod() %></li>
<li>요청URL : <%=request.getRequestURL() %></li>
<!-- queryString은 GET방식에만 존재하고 POST방식에는 존재하지 않음 -->
<li>요청QueryString : <%=request.getQueryString () %></li>
<li>요청protocol : <%=request.getProtocol() %></li>
<li>요청 서버명 : <%=request.getServerName() %></li>
<li>요청 서버포트 : <%=request.getServerPort() %></li>
<li>요청 URI : <%=request.getRequestURI() %></li>
<li>요청 servlet : <%=request.getServletPath() %></li>
<li>요청 parameter : <%=request.getParameter("name") %></li>
<!-- 이름이 같으면 처음 값만 얻음  -->
<li>요청 parameter : <%=request.getParameter("age") %></li>
<!-- 이름이 같으면 배열로 처리함  -->
<li>요청 parameter : <% String[] ageArr=request.getParameterValues("age");
out.print(Arrays.toString(ageArr));%></li>

<li>접속자 IP : <%=request.getRemoteAddr() %></li>
<li>접속자 포트 : <%=request.getRemotePort() %></li>

</ul>
<div>
<a href="http://localhost/jsp_prj/day0616/useRequest.jsp?name=kim&age=20&age=21">요청</a>
<form action="http://localhost/jsp_prj/day0616/useRequest.jsp" method="post">
<input type="hidden" name="name" value="park">
<input type="hidden" name="age" value="24">
<input type="hidden" name="age" value="25">
<button class="btn btn-success">post요청</button>

</form>
</div>
<div>
    <h2>요청 Header의 값들</h2>

    <%
    Enumeration<String> en = request.getHeaderNames();

    out.println("<ul>");

    while (en.hasMoreElements()) {

        String headerName = en.nextElement();

        out.println("<li>");
        out.println(headerName + " : " + request.getHeader(headerName));
        out.println("</li>");
    }

    out.println("</ul>");
    %>
</div>
</div>
<div id = footer></div>
</div>
</body>

</html>