<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.button1 {
	background-color: red;
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}

.button2 {
	background-color: #4CAF50;
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}
</style>
</head>

<body style="align-content: center; background-color: skyblue;">
	<svg width="1340" height="180"> <rect x="0" y="20" width="1340"
		height="50"
		style="fill:#f44242;stroke:pink;stroke-width:5;opacity:0.5" /> </svg>
	<table align="center">
		<tr>
			<td colspan="5">
				<h2 style="color: red;">${success}</h2>
			</td>
		</tr>
		<tr>
			<td colspan="5" align="center">
				<h1 style="color: black;">Test Series Portal</h1>
			</td>
		</tr>
	</table>
	<form action="/submitTestSeries" method="post">
		<table align="center">
			<tr>
				<td>Test Series Name:</td>
				<td><input type="text" name="testSeriesName"></td>
			</tr>
			<tr>
				<td>Course Base</td>
				<td><select name="courseBase">
						<c:forEach items="${cbColl}" var="baseCourse">
							<option value="${baseCourse.id}"><c:out
									value="${baseCourse.courseName}" /></option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td><input class="button1" type="submit"
					value="Submit Test Series"></td>
				<td>&nbsp;&nbsp;<a class="button2" href="/contentWriterHome">Back</a></td>
			</tr>
		</table>
	</form>
</body>
</html>