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
.BaseTest {
	background-color: lightgrey;
	width: 55px;
	border: 25px solid green;
	padding: 25px;
	margin: 25px;
}
</style>
</head>
<body style="align-content: center; background-color: skyblue;">
		<strong><a style="color: blue;" href="/testhome" id="myAdmin"><<< Switch To Test Portal >>></a></strong>
	<svg width="1340" height="180"> <rect x="0" y="20" width="1340"
		height="50"
		style="fill:#f44242;stroke:pink;stroke-width:5;opacity:0.5" /> </svg>
	
	<table align="center">
		<tr>
			<td colspan="5" align="center">
				<h1 style="color: black;">Content Developer Portal</h1>
			</td>
		</tr>
		<tr>
			<td class="BaseTest"><a href="/feedCourseBase"> Insert
					Course Base</a></td>
			<td class="BaseTest"><a href="/feedTestSeries"> Insert Test
					Series</a></td>
			<td class="BaseTest"><a href="/feedExactTest"> Insert Exact
					Test</a></td>
			<td class="BaseTest"><a href="/feedTestSections"> Insert
					Test Sections</a></td>
			<td class="BaseTest"><a href="/feedSectionQuestions"> Insert
					Section Questions</a></td>
		</tr>
</body>
</html>