<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page import="day0612.TestDTO"%>
<%@page import="day0612.TestService"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="scriptLet의 사용"
    %>
<% 
// method 내 정의하는 Java 코드 작성.  변수선언, 연산자 사용, 제어문, 객체 생성
String name="홍길동";%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= name%>님 안녕하세요</title>
<link rel="shortcut icon" href = "http://192.168.10.87/jsp_prj/common/images/favicon.ico"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.min.js" integrity="sha384-G/EV+4j2dNv+tEPo3++6LCgdCROaejBqfUeNjuKAiuXbjrxilcCdDz6ZAVfHWe1Y" crossorigin="anonymous"></script>

<style type="text/css">
#wrap {width: 1000px; height: 900px; margin: 0px auto;}
#header {height: 200px;}
#container {height: 600px;}
#footer {height: 100px;}

.age {font-weight: blod;}
.age2 {font-size: large;}
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
    <%
    //_jspService() 안쪽으로 코드가 생성된다. 
    int age=222; // 지역변수
	
    String css = "age";
    if(new Random().nextBoolean()){
		css = "age2";
		
	
    }
    %><div>
    나이는 <span class="<%=css%>"><%= age%></span> 살 입니다.
	</div>
<table class="table table-hover">
    <thead>
        <tr>
            <th>번호</th>
            <th>이름</th>
            <th>나이</th>
            <th>비고</th>
        </tr>
        </thead>
        <tbody>
        	<%
        	TestService ts = new TestService();
        	List<TestDTO> list = ts.searchMember();
        	
        	TestDTO tDTO = null;
        	for (int i=0; i<list.size(); i++){
        		tDTO = list.get(i);
        	%>
        	<tr>
        		<td> <%=i+1 %> </td>
        		<td> <%=tDTO.getName() %> </td>
        		<td> <%=tDTO.getAge()%> </td>
        		<td> <button class="btn btn-warning btn-sm">삭제</button></td>
        		</tr>
        		<%} %>
        	<%
        	int num = 0;
			for (int i=0; i<=100; i++){
				num += i;
			}
        	%>
        	<%= "1부터 100까지 합: "+num %>
        </tbody>
</table>
<!-- 올해를 기준으로 (2026) 이전 2년 이후 2년을 옵션으로 보여주느느 select을 
Calendar를 사용하여 만들기  -->
<select>
	<%
	Calendar cal = Calendar.getInstance();
	
	int currentYear = cal.get(Calendar.YEAR);
	
	for (int y = currentYear+2; y>=currentYear-2; y--){
		
	%>
	
	<option <%=(y==currentYear)? "selected='selected'":"" %>>
	<%=y%>
	</option>
	<%} %>
</select>
<select>
	<%
	int lastMonth = cal.getActualMaximum(Calendar.MONTH);
	int currentMonth = (cal.get(Calendar.MONTH))+1;
	
	for (int m = 1; m<=lastMonth; m++){
	%>
	<option <%=(m==currentMonth)? "selected='selected'":"" %>>
	<%=m %>
	</option>
	<%} %>
</select>

	<%
	int lastDay = cal.getActualMaximum(Calendar.DATE);
	int currentDay = cal.get(Calendar.DATE);
	%>
	
	<select name="day">
	<%
	for(int d = 1; d <= lastDay; d++){
	%>
	    <option value="<%=d%>"
	        <%= (d == currentDay) ? "selected='selected'" : "" %>>
	        <%=d%>
	    </option>
	<%
	}
	%>
	</select>
	
	<!-- 0점에서 부터 10점까지 선택 할 수 있는 라디오 버튼 11개  -->
	<div>
	<%
	for (int i=0; i<11; i++){
	%>
	<input type="radio" name="score" value="<%=i %>"
	<%=(i == 5)? "checked='checked'":"" %>>
	<%=i+"점" %>
	<%} %>
	</div>
	<!-- 아래 이미지가 강아지 또는 google.png, naver.png, daum.png가 보여지도록 -->
	<%
	String [] imgs = {
			"default_img2",
		    "google",
		    "naver",
		    "daum"
	};
	
	String printImg = imgs[new Random().nextInt(imgs.length)];
	%>
	<img alt="" src="../common/images/<%=printImg%>.png">
</div>
<div id = footer></div>
</div>
</body>

</html>