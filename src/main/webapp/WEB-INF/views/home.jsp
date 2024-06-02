<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>학사 정보 시스템</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f8f9fa;
    }

    h1 {
      text-align: center;
      margin-top: 50px;
      color: #343a40;
    }

    .container {
      width: 60%;
      margin: 50px auto;
      background-color: #fff;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .menu {
      list-style-type: none;
      padding: 0;
    }

    .menu li {
      margin-bottom: 10px;
    }

    .menu a {
      display: block;
      padding: 10px;
      background-color: #007bff;
      color: #fff;
      text-decoration: none;
      border-radius: 5px;
      text-align: center;
    }

    .menu a:hover {
      background-color: #0056b3;
    }

    .logout-link {
      display: block;
      text-align: center;
      margin-top: 20px;
    }

    .logout-link a {
      color: #dc3545;
      text-decoration: none;
    }

    .logout-link a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>

<div class="container">
  <h1>학사 정보 시스템</h1>
  <ul class="menu">
    <li><a href="${pageContext.request.contextPath}/course">학년별 이수 학점 조회</a></li>
    <li><a href="${pageContext.request.contextPath}/enroll">수강 신청하기</a></li>
    <li><a href="${pageContext.request.contextPath}/registration">수강 신청 조회</a></li>
  </ul>

  <c:if test="${pageContext.request.userPrincipal.name != null}">
    <div class="logout-link">
      <a href="javascript:document.getElementById('logout').submit()">Logout</a>
    </div>
  </c:if>

  <form id="logout" action="<c:url value="/logout" />" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
  </form>
</div>

</body>
</html>
