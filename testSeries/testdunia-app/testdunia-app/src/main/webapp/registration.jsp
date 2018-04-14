<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon"
	href="${contextPath}/resources/images/favicon.ico" />
<title>GSK - Quiz</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${contextPath}/resources/css/gskStyle.css">
<link href="<c:url value="${contextPath}/resources/css/app.css" />"
	rel="stylesheet" type="text/css">
</head>
<body class="text-center">
	<nav class="navbar navbar-default tembus">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>

			</div>

			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a class="navbar-brand" href="#" style="padding: 1px;"><img
							class="logoImg img-responsive"
							src="${contextPath}/resources/images/logo_gsk.png"></a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="details">
		<h2>GSK - Quiz | Registration</h2>
	</div>
	<div class="container">

		<form:form method="POST" modelAttribute="UserBase"
			action="${contextPath}/registerUser">
			<div class="lc-block">
				
				<c:if test="${not empty error}">
						<h4 style="color: red;">${error}</h4>
				</c:if>
				<div>
					<input type="text" class="style-4" name="fullname"
						placeholder="Full Name" />
				</div>
				<div>
					<input type="text" class="style-4" name="email" placeholder="Email" />
				</div>
				<div>
					<input type="password" class="style-4" name="password"
						placeholder="Password" />
				</div>
				<div>
					<input type="password" class="style-4" name="passwordConfirm"
						placeholder="Retype-password" />
				</div>
				<input type="submit" class="button red small" value="Register" />
			</div>
		</form:form>

	</div>
	<!-- /container -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
