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
			<td width="60%">
				<table align="center">
					<tr>
						<td colspan="5" align="center">
							<h1 style="color: black;">Test Section Portal</h1>
						</td>
					</tr>
				</table>
				<form action="/submitTestSections" method="post"
					id="submitTestSection">
					<table align="center">
						<tr>
							<td colspan="2" align="center"><h2 style="color: red;">${success}</h2></td>
						</tr>
						<tr>
							<td>Course Base</td>
							<td><c:choose>
									<c:when test="${not empty cbSelected}">
										<select name="courseBase" onchange="getTestSeriesColl()">
											<option value="${cbSelected.id}"><c:out
													value="${cbSelected.courseName}" /></option>
									</c:when>
									<c:otherwise>
										<select name="courseBase" onchange="getTestSeriesColl()">
											<option value="">Select</option>
									</c:otherwise>
								</c:choose> <c:forEach items="${cbColl}" var="baseCourse">
									<option value="${baseCourse.id}"><c:out
											value="${baseCourse.courseName}" /></option>
								</c:forEach> </select></td>
						</tr>
						<tr>
							<td>Test Series</td>
							<td><c:choose>
									<c:when test="${not empty tsSelected}">
										<select name="testSeries" onchange="getExactTestColl()">
											<option value="${tsSelected.id}"><c:out
													value="${tsSelected.testName}" /></option>
									</c:when>
									<c:otherwise>
										<select name="testSeries" onchange="getExactTestColl()">
											<option value="">Select</option>
									</c:otherwise>
								</c:choose> <c:forEach items="${tsColl}" var="ets">
									<option value="${ets.id}"><c:out
											value="${ets.testName}" /></option>
								</c:forEach> </select></td>
						</tr>

						<tr>
							<td>Exact Test</td>
							<td><c:choose>
									<c:when test="${not empty etSelected}">
										<select name="exactTest" onchange="getTestSecColl()">
											<option value="${etSelected.id}"><c:out
													value="${etSelected.exactTestName}" /></option>
									</c:when>
									<c:otherwise>
										<select name="exactTest" onchange="getTestSecColl()">
											<option value="">Select</option>
									</c:otherwise>
								</c:choose> <c:forEach items="${etColl}" var="et">
									<option value="${et.id}"><c:out
											value="${et.exactTestName}" /></option>
								</c:forEach> </select></td>
						</tr>

						<tr>
							<td>Test Section Name</td>
							<td><input type="text" name="testSectionName"></td>
						</tr>
						<tr>
							<td><input class="button1" type="submit"
								value="Submit Test Series"></td>
							<td>&nbsp;&nbsp;<a class="button2" href="/contentWriterHome">Back</a></td>
						</tr>
					</table>
				</form>


			</td>
			<c:if test="${not empty tsecColl}">
				<td width="40%" style="background-color: pink;">
					<table width="100%">
						<tr>
							<td align="center">
								<h2 style="color: red;">List of Test Sections are as
									follows :</h2>
							</td>
						</tr>
						<c:forEach items="${tsecColl}" var="testSec">
							<tr>
								<td align="center"><c:out value="${testSec.sectionName}" /></td>
							</tr>
						</c:forEach>
					</table>
				</td>
			</c:if>
		</tr>
	</table>
	<script>
		function getTestSeriesColl() {
			var tForm = document.getElementById("submitTestSection");
			tForm.action = "/getTSWithCBSec";
			tForm.submit();
		}

		function getExactTestColl() {
			var tForm = document.getElementById("submitTestSection");
			tForm.action = "/getExactTestWithTestSeries";
			tForm.submit();
		}

		function getTestSecColl() {
			var tForm = document.getElementById("submitTestSection");
			tForm.action = "/getTestSectionWithExactTest";
			tForm.submit();
		}
	</script>
</body>
</html>