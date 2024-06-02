<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>수강 신청 완료</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
        }

        h3 {
            text-align: center;
            margin-top: 50px;
            color: #007bff;
        }

        table {
            width: 50%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 10px;
            border-bottom: 1px solid #dee2e6;
        }

        th {
            background-color: #007bff;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        /* 추가된 스타일 */
        .registration-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #007bff;
            text-decoration: none;
        }

        .registration-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<h3>2024년 2학기 수강 신청이 완료되셨습니다.</h3>
<table>
    <tr>
        <th>교과목명</th>
        <th>교과구분</th>
        <th>담당교수</th>
        <th>학점</th>
    </tr>
    <tr>
        <td>${registration.courseTitle}</td>
        <td>${registration.courseClassification}</td>
        <td>${registration.professor}</td>
        <td>${registration.credits}</td>
    </tr>
</table>
<a class="registration-link" href="${pageContext.request.contextPath}/registration"> 수강 신청 조회 바로 가기 </a>
</body>
</html>
