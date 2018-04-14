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

<style>
textarea {
	width: 250px;
	height: 70px
}
</style>
</head>

<body style="align-content: center; background-color: skyblue;">
	<svg width="1340" height="50"> <rect x="0" y="20" width="1340"
		height="50"
		style="fill:#f44242;stroke:pink;stroke-width:5;opacity:0.5" /> </svg>
	<table align="center">
		<tr>
			<td width="60%" valign="top">
				<table align="center">
					<tr>
						<td colspan="5" align="center">
							<h1 style="color: black;">Section Questions Portal</h1>
						</td>
					</tr>
				</table>
				<form action="/submitSectionQuestions" method="post"
					id="submitTestSection">
					<input type="hidden" name="questionPage" value="questionPage">
					<table align="center">
						<tr>
							<td colspan="2" align="center"><h2 style="color: red;">${success}</h2>

								<input type="hidden" name="queSelect" id="queSelect" value="" /></td>
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
							<td>Test Section</td>
							<td><c:choose>
									<c:when test="${not empty tsecSelected}">
										<select name="testSection" onchange="getSecQuestionColl()">
											<option value="${tsecSelected.id}"><c:out
													value="${tsecSelected.sectionName}" /></option>
									</c:when>
									<c:otherwise>
										<select name="testSection" onchange="getSecQuestionColl()">
											<option value="">Select</option>
									</c:otherwise>
								</c:choose> <c:forEach items="${tsecColl}" var="tSec">
									<option value="${tSec.id}"><c:out
											value="${tSec.sectionName}" /></option>
								</c:forEach> </select></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<h1>Feed Question</h1>
							</td>
						</tr>
						<tr>
							<td>Question Number <input type="text" name="questionNumber"
								size="5"></td>
							<td>Question <textarea name="Question"></textarea></td>
						</tr>
						<tr>
							<td>Option1 <input type="text" name="Option1"></td>
							<td>Option2 <input type="text" name="Option2"></td>
						</tr>
						<tr>
							<td>Option3 <input type="text" name="Option3"></td>
							<td>Option4 <input type="text" name="Option4"></td>
						</tr>
						<tr>
							<td>Option5 <input type="text" name="Option5"></td>
							<td>Correct Answer <input type="text" name="CorrectAns">
								(Please copy the correct answer !)
							</td>
						</tr>

						<tr>
							<td><input class="button1" type="submit"
								value="Submit Test Series"></td>
							<td>&nbsp;&nbsp;<a class="button2" href="/contentWriterHome">Back</a></td>
						</tr>
					</table>
				</form>


			</td>
			<c:if test="${not empty secQueColl}">
				<td width="40%" style="background-color: pink;">
					<table width="100%">
						<tr>
							<td align="center">
								<h2 style="color: red;">List of Questions of this Sections
									are as follows :</h2>
							</td>
						</tr>
						<c:forEach items="${secQueColl}" var="secQue">
							<tr>
								<td align="left" style="padding-left: 25px;">
									<table>
										<tr>
											<td colspan="2" style="color: purple;"><h5>${secQue.queNo}.
													${secQue.question} <a
														onclick="deleteSelectedQuestion(${secQue.id})"> <img
														src="${contextPath}/resources/images/cross.jpg"
														height="15" width="15">
													</a>
												</h5></td>
										</tr>
										<tr>
											<td>(a). ${secQue.opt1}</td>
											<td>(b). ${secQue.opt2}</td>
										</tr>
										<tr>
											<td>(c). ${secQue.opt3}</td>
											<td>(d). ${secQue.opt4}</td>
										</tr>
										<c:if test="${not empty secQue.opt5}">
											<tr>
												<td>(e). ${secQue.opt5}</td>
												<td></td>
											</tr>
										</c:if>
										<tr>
											<td colspan="2" style="color: green;"><h5>Correct
													Ans : ${secQue.correctAns}</h5> <BR> <BR></td>
										</tr>
									</table>
								</td>
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

		function getSecQuestionColl() {
			var tForm = document.getElementById("submitTestSection");
			tForm.action = "/getSectionQuestionWithTestSection";
			tForm.submit();
		}
		function deleteSelectedQuestion(queId) {
			var tForm = document.getElementById("submitTestSection");
			document.getElementById("queSelect").value=queId;
			tForm.action = "/deleteQuestion";
			tForm.submit();
		}
	</script>
</body>
</html>