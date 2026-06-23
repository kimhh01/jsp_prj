
<%@page import="kr.co.sist.user.member.MemberService"%>
<%@page import="kr.co.sist.user.member.MemberDTO"%>
<%@ page language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");

// 수신 동의
String smsReceiveYN = request.getParameter("smsReceiveYN");
String emailReceiveYN = request.getParameter("emailReceiveYN");

// 회원 정보
String memberCode = request.getParameter("memberCode");
String password = request.getParameter("password");
String name = request.getParameter("name");
String email = request.getParameter("email");

// 전화번호
String phone1 = request.getParameter("phone1");
String phone2 = request.getParameter("phone2");
String phone3 = request.getParameter("phone3");

// 주소
String zipcode = request.getParameter("zipcode");
String address = request.getParameter("address");
String address2 = request.getParameter("address2");

// 취미
String[] hobby = request.getParameterValues("hobby");

// 접속 IP
String ip = request.getRemoteAddr();

// null 처리
int smsYN = "1".equals(smsReceiveYN) ? 1 : 0;
int emailYN = "1".equals(emailReceiveYN) ? 1 : 0;

// DTO 생성
MemberDTO mDTO = new MemberDTO();

mDTO.setMemberCode(memberCode);
mDTO.setPassword(password);
mDTO.setName(name);
mDTO.setEmail(email);

mDTO.setPhone1(phone1);
mDTO.setPhone2(phone2);
mDTO.setPhone3(phone3);

mDTO.setZipcode(zipcode);
mDTO.setAddress(address);
mDTO.setAddress2(address2);

mDTO.setSmsReceiveYN(smsYN);
mDTO.setEmailReceiveYN(emailYN);

mDTO.setHobby(hobby);
mDTO.setIp(ip);

// 회원 등록
MemberService ms = new MemberService();

boolean flag = false;

try {
	flag = ms.addMember(mDTO);
} catch (Exception e) {
	e.printStackTrace();
}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>회원가입 완료 | BallPick</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/kr.user.member/member.css">

</head>

<body>

	<main class="member-page">

		<section class="member-shell">

			<h1 class="member-title">회원가입</h1>

			<div class="member-steps" aria-label="회원가입 단계">

				<div class="member-step">
					<span class="member-step-number">1</span>약관동의
				</div>

				<div class="member-step">
					<span class="member-step-number">2</span>정보입력
				</div>

				<div class="member-step active">
					<span class="member-step-number">3</span>가입완료
				</div>

			</div>

			<div class="member-result">

				<% if(flag){ %>

					<div class="member-result-icon">✓</div>
					<jsp:useBean id="mDTO" class="kr.co.sist.user.member.MemberDTO"/>
					<jsp:setProperty property="*" name="mDTO"/>
					<jsp:setProperty property="ip" name="mDTO"value="<%=request.getRemoteAddr() %>"/>
					<h2>${param.name }님, 환영합니다.</h2>

					<p>
						회원가입이 정상적으로 완료되었습니다.
					</p>

					<div class="member-result-summary">

						<p>
							<strong>회원코드 :</strong>
							<%=memberCode%>
						</p>

						<p>
							<strong>이메일 :</strong>
							<%=email%>
						</p>

						<p>
							<strong>전화번호 :</strong>
							<%=phone1%>-<%=phone2%>-<%=phone3%>
						</p>

					</div>

				<% } else { %>

					<div class="member-result-icon">✕</div>

					<h2>회원가입 실패</h2>

					<p>
						<%=name%>님의 회원가입 처리 중 오류가 발생했습니다.
					</p>

				<% } %>

			</div>

			<div class="member-actions">

				<a class="member-button member-button-light"
					href="<%=request.getContextPath()%>/main.do">
					메인으로
				</a>

				<% if(flag){ %>

					<a class="member-button"
						href="#void">
						로그인
					</a>

				<% } %>

			</div>

		</section>

	</main>

</body>
</html>
```
