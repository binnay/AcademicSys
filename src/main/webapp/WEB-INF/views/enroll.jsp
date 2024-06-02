<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>수강신청</title>
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

        form {
            width: 50%;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #343a40;
        }

        input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .error {
            color: red;
        }
    </style>
</head>
<body>
<h1>2024학년도 2학기 수강 신청</h1>
<sf:form method="post" action="${pageContext.request.contextPath}/enrolledCourse" modelAttribute="registration">


    <sf:label path="courseTitle">교과목명</sf:label>
    <sf:input path="courseTitle" />
    <sf:errors path="courseTitle" cssClass="error" /><br><br>

    <sf:label path="courseClassification">교과구분</sf:label>
    <sf:input path="courseClassification" />
    <sf:errors path="courseClassification" cssClass="error" /><br><br>

    <sf:label path="professor">담당교수</sf:label>
    <sf:input path="professor" />
    <sf:errors path="professor" cssClass="error" /><br><br>

    <sf:label path="credits">학점</sf:label>
    <sf:input path="credits" />
    <sf:errors path="credits" cssClass="error" /><br><br>

    <input type="submit" value="신청하기">
</sf:form>

</body>
</html>
