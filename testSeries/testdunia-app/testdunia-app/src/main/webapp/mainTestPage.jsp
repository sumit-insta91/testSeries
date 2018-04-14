<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.sectionButton {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 4px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 1px;
	cursor: pointer;
	border-radius: 6px;
}

.queNumberButton {
	background-color: #87dfff; /* sky blue */
	padding: 15px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 1px;
	cursor: pointer;
	border-radius: 15px;
	border-color: #e259c2;
	border-style: solid;
}

.submitButton {
	background-color: blue; /* sky blue */
	padding: 15px;
	color: white;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 1px;
	cursor: pointer;
	border-radius: 15px;
	border-color: #e259c2;
	border-style: solid;
}

.backButton {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 1px;
	cursor: pointer;
	border-radius: 6px;
}

.nextButton {
	background-color: red; /* Green */
	border: none;
	color: white;
	padding: 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 1px;
	cursor: pointer;
	border-radius: 6px;
}
</style>
</head>
<body style="background-color: grey;" onload="onload()">
	<form action="/submitTest" name="userTest" id="userTest" method="post">
		<input type="hidden" name="queColl" value="${secQueColl}">
		<table width="100%" height="100%">
			<tr>
				<td align="left" colspan="2"
					style="background-color: #ffeded; padding-left: 50px; font-weight: 16px; color: blue"><h2>
						${test.exactTestName}</h2> <input type="hidden" name="testId"
					value="${test.id}" /></td>
			</tr>
			<tr>
				<td width="100%" style="color: black; background-color: lightgreen;"
					valign="top">
					<table width="100%">
						<tr>
							<input type="hidden" name="sectionColl" value="${sectionColl}">
							<c:forEach items="${sectionColl}" var="sc">
								<td class="sectionButton" align="center" width="24%"><a
									class="sectionButton" type="button"
									onclick="getSectionQuestions(${sc.id})" value="${sc.id}">${sc.sectionName}</a>
									<input type="hidden" name="sectionId" id="sectionId"
									value="${sc.id}" /></td>
							</c:forEach>
						</tr>
						<tr>
							<td colspan="4"></td>
						</tr>
					</table> <BR> <BR> <BR> <BR>
					<table align="center">
						<tr>
							<td align="center">
								<!-- <table>
									<tr>
										<td colspan="2"><div id="questionDiv"></div></td>
									</tr>
									<tr>
										<td><div id="opt1"></div></td>
										<td><div id="opt2"></div></td>
									</tr>
									<tr>
										<td><div id="opt3"></div></td>
										<td><div id="opt4"></div></td>
									</tr>
								</table>--> <c:forEach items="${secQueColl}" var="sq">
									<c:if test="${sq.queNo eq 1}">
										<table>
											<tr>
												<td colspan="2">${sq.queNo}.${sq.question}
													</div>
												</td>
											</tr>
											<tr>
												<td><input type="checkbox" value="${sq.opt1}">(a).
													${sq.opt1}</td>
												<td><input type="checkbox" value="${sq.opt2}">(b).
													${sq.opt2}</td>
											</tr>
											<tr>
												<td><input type="checkbox" value="${sq.opt3}">(c).
													${sq.opt3}</td>
												<td><input type="checkbox" value="${sq.opt4}">(d).
													${sq.opt4}</td>
											</tr>
											<tr>
												<td align="left">
													<button class="backButton"><< Back</button>
												</td>
												<td align="right">
													<button class="nextButton">Next >></button>
												</td>
											</tr>
										</table>
									</c:if>
								</c:forEach>

							</td>
						</tr>
					</table>
				</td>
				<c:set var="count" value="${1}" />
				<td valign="top" width="40%" style="background-color: lightgrey;">
					<table>
						<tr>
							<td colspan="3"><img
								style="width: 200px; height: 200px; margin-left: 30px; margin-top: 50px; margin-right: 30px"
								src="${contextPath}/resources/images/face.jpg"></td>
						</tr>
						<tr>
							<c:forEach items="${secQueColl}" var="sq">
								<td align="center"><a class="queNumberButton" onclick=""><c:out
											value="${sq.queNo}" /></a></td>
								<c:if test="${count%3 == 0}">
									<tr></tr>
								</c:if>
								<c:set var="count" value="${count+1}" />
							</c:forEach>
						</tr>
						<tr>
						<td colspan="3" align="center">
						<button class="submitButton">Submit</button>
						</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
	<script type="text/javascript">
			function getSectionQuestions(secId) {
				var tForm = document.getElementById("userTest");
				document.getElementById("sectionId").value=secId;
				tForm.action = "/getSectionQuestions";
				tForm.submit();
			}
			
			function onload(){
				/* alert("inside onload");
				var queCol=document.getElementsByName("queColl");
				alert(""+queCol[0].value);
				for(var i=0;i<queCol.length;i++){
					document.getElementById("questionDiv").innerHTML=queCol[i].queNo+". "+queCol[i].question;
					document.getElementById("opt1").innerHTML="(a). "+queCol[i].opt1;
					document.getElementById("opt2").innerHTML="(b). "+queCol[i].opt2;
					document.getElementById("opt3").innerHTML="(c). "+queCol[i].opt3;
					document.getElementById("opt4").innerHTML="(d). "+queCol[i].opt4;
					break;
				} */
			}
	</script>
</body>
</html>