<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>달력</title>

<link rel="shortcut icon"
      href="http://192.168.10.87/jsp_prj/common/images/favicon.ico"/>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
      rel="stylesheet">
      

<style type="text/css">

#wrap {
    width: 1000px;
    height: 900px;
    margin: 0 auto;
}

#header {
    height: 100px;
}

#container {
    height: 700px;
}

#footer {
    height: 100px;
}

a {
    text-decoration: none;
    color: #333;
}

a:hover {
    text-decoration: underline;
    color: #1E4183;
}

/* 달력 영역 */
#calWrap {
    width: 840px;
    margin: 0 auto;
}

#calHeader {
    display: flex;
    align-items: center;
    margin-bottom: 20px;
}

.calTitle {
    font-size: 25px;
    font-weight: bold;
    
}

#calTab {
    width: 100%;
    border-collapse: collapse;
}

#calTab th,
#calTab td {
    border: 1px solid #333;
    text-align: center;
}

#calTab td {
    width: 120px;
    height: 80px;
    vertical-align: top;
    padding-top: 10px;
    font-size: 15px;
    text-align: right;
}

.sunTitle {
    height: 40px;
    background-color: #E72203;
    color: #FFFFFF;
    font-weight: bold;
}

.weekTitle {
    height: 40px;
    font-weight: bold;
}

.satTitle {
    height: 40px;
    background-color: #2626FF;
    color: #FFFFFF;
    font-weight: bold;
}

/* 오늘 날짜 */
.today {
    background-color: #FFFF00;
    font-weight: bold;
}

/* 날짜 색상 */
.sunDay {
    color: #E72203;
}

.satDay {
    color: #2626FF;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	
});

function moveCal(year, month){
    $("#year").val(year);
    $("#month").val(month);

    $("#calfrm").submit();
}
</script>
</head>

<body>

<div id="wrap">

    <div id="header"></div>

    <div id="container">

        <%
		Calendar cal = Calendar.getInstance();
		
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		
		Calendar today = Calendar.getInstance();
		
		if (year != null && month != null) {
		
		    int paramYear = Integer.parseInt(year);
		    int paramMonth = Integer.parseInt(month);
		
		    cal.set(paramYear, paramMonth - 1, 1);
		}
		
		int nowYear = cal.get(Calendar.YEAR);
		int nowMonth = cal.get(Calendar.MONTH) + 1;
		int nowDay = cal.get(Calendar.DAY_OF_MONTH);
		
		Calendar prevCal = (Calendar) cal.clone();
		prevCal.add(Calendar.MONTH, -1);
		
		Calendar nextCal = (Calendar) cal.clone();
		nextCal.add(Calendar.MONTH, 1);
		
		Calendar printCal = (Calendar) cal.clone();
		
		// 이번 달 1일로 설정
		printCal.set(Calendar.DAY_OF_MONTH, 1);
		
		// 이번 달 시작 요일
		int startDayOfWeek = printCal.get(Calendar.DAY_OF_WEEK);
		
		// 이번 달 마지막 날짜
		int lastDay = printCal.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		StringBuilder toDay = new StringBuilder();
		//log(toDay.toString());
		
		toDay.append(today.get(Calendar.YEAR)).append(today.get(Calendar.MONTH)+1);
		StringBuilder selectDay= new StringBuilder();
		selectDay.append(nowYear).append(nowMonth);
		//log(selectDay.toString());
		
		//log(String.valueOf(toDay.toString().equals(selectDay.toString())));
		// 오늘을 표현하기 위한 flag 변수 
		boolean toDayFlag = toDay.toString().equals(selectDay.toString());
		%>
		<form action="calendar2.jsp" method="post" id="calfrm">
		    <input type="hidden" name="year" id="year">
		    <input type="hidden" name="month" id="month">
		</form>
        <div id="calWrap">

            <div id="calHeader">
				<a href="javascript:void(0);"
				   onclick="moveCal(<%=prevCal.get(Calendar.YEAR)%>, <%=prevCal.get(Calendar.MONTH)+1%>)"
				   title="이전달">
				    &lt;&lt;
				</a>

                <a href="calendar2.jsp?year=<%=today.get(Calendar.YEAR)%>&month=<%=today.get(Calendar.MONTH)+1%>">
                <span class="calTitle" title="오늘">
                    <%= nowYear %>.<%= nowMonth %>
                </span>
				</a>

				<a href="javascript:void(0);"
				   onclick="moveCal(<%=nextCal.get(Calendar.YEAR)%>, <%=nextCal.get(Calendar.MONTH)+1%>)"
				   title="다음달">
				    &gt;&gt;
				</a>
            </div>

            <div id="calContainer">

                <table id="calTab">

                    <thead>
                        <tr>
                            <th class="sunTitle">일</th>
                            <th class="weekTitle">월</th>
                            <th class="weekTitle">화</th>
                            <th class="weekTitle">수</th>
                            <th class="weekTitle">목</th>
                            <th class="weekTitle">금</th>
                            <th class="satTitle">토</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>

                        <%
                        // 시작 전 빈 칸 출력
                        for(int blank = 1; blank < startDayOfWeek; blank++){
                        %>
                            <td>&nbsp;</td>
                        <%
                        }

                        // 날짜 출력
                        for(int day = 1; day <= lastDay; day++){

                            printCal.set(Calendar.DAY_OF_MONTH, day);

                            boolean isToday = toDayFlag && (nowDay == day);

                            String dayClass = "";

                            switch(printCal.get(Calendar.DAY_OF_WEEK)){

                                case Calendar.SUNDAY:
                                    dayClass = "sunDay";
                                    break;

                                case Calendar.SATURDAY:
                                    dayClass = "satDay";
                                    break;
                            }

                            if(isToday){
                                dayClass += " today";
                            }
                        %>

                            <td class="<%= dayClass %>">
                                <%= day %>
                            </td>

                        <%
                            // 토요일이면 줄바꿈
                            if(printCal.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY
                                    && day != lastDay){
                        %>

                        </tr>
                        <tr>

                        <%
                            }
                        }

                        // 마지막 주 빈 칸 출력
                        int endDayOfWeek = printCal.get(Calendar.DAY_OF_WEEK);

                        for(int blank = endDayOfWeek + 1;
                                blank <= Calendar.SATURDAY;
                                blank++){
                        %>

                            <td>&nbsp;</td>

                        <%
                        }
                        %>

                        </tr>

                    </tbody>

                </table>

            </div>

        </div>

    </div>

    <div id="footer"></div>

</div>

</body>
</html>