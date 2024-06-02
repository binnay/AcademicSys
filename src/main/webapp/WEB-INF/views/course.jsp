<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>학년별 이수 학점 조회</title>
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

        table {
            width: 80%;
            margin: 30px auto;
            border-collapse: collapse;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 10px;
            border: 1px solid #dee2e6;
            text-align: center;
        }

        th {
            background-color: #007bff;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        tr:hover {
            background-color: #e9ecef;
        }

        a {
            text-decoration: none;
            color: #007bff;
        }

        a:hover {
            text-decoration: underline;
        }

        .total-credits {
            text-align: right;
            padding-right: 20px;
            font-weight: bold;
        }
    </style>
</head>
<body>
<h1>학년별 이수 학점 조회</h1>
<table>
    <tr>
        <th>년도</th>
        <th>학기</th>
        <th>취득 학점</th>
        <th>상세 보기</th>
    </tr>
    <c:set var="previousYear" value="0"/>
    <c:set var="previousSemester" value="0"/>
    <c:set var="totalCredits" value="0"/>
    <c:set var="grandTotalCredits" value="0"/>
    <c:forEach var="course" items="${courses}" varStatus="status">
        <!-- 2024년 1학기까지만 합산하기 위한 조건문 -->
        <c:if test="${course.year < 2024 || (course.year == 2024 && course.semester <= 1)}">
            <c:if test="${course.year != previousYear || course.semester != previousSemester}">
                <c:if test="${!status.first}">
                    <tr>
                        <td>${previousYear}</td>
                        <td>${previousSemester}</td>
                        <td>${totalCredits}</td>
                        <td><a href="<c:url value='/courseDetails?year=${previousYear}&semester=${previousSemester}'/>">링크</a></td>
                    </tr>
                    <c:set var="totalCredits" value="0"/>
                </c:if>
                <c:set var="previousYear" value="${course.year}"/>
                <c:set var="previousSemester" value="${course.semester}"/>
            </c:if>
            <!-- 총 학점 계산 -->
            <c:set var="totalCredits" value="${totalCredits + course.credits}"/>
            <c:set var="grandTotalCredits" value="${grandTotalCredits + course.credits}"/>
        </c:if>
    </c:forEach>
    <c:if test="${not empty courses}">
        <tr>
            <td colspan="2" class="total-credits">전체 학점 총합</td>
            <td>${grandTotalCredits}</td>
            <td></td>
        </tr>
    </c:if>
</table>
</body>
</html>
