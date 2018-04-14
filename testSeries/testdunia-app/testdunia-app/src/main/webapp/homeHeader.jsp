<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TestDunia</title>
<style>
/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	position: relative;
	background-color: #fefefe;
	margin: auto;
	padding: 0;
	border: 1px solid #888;
	width: 40%;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	-webkit-animation-name: animatetop;
	-webkit-animation-duration: 0.4s;
	animation-name: animatetop;
	animation-duration: 0.4s
}

/* Add Animation */
@
-webkit-keyframes animatetop {
	from {top: -300px;
	opacity: 0
}

to {
	top: 0;
	opacity: 1
}

}
@
keyframes animatetop {
	from {top: -300px;
	opacity: 0
}

to {
	top: 0;
	opacity: 1
}

}

/* The Close Button */
.close {
	color: white;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.modal-header {
	padding: 2px 8px;
	background-color: #5cb85c;
	color: white;
}

.modal-body {
	padding: 2px 8px;
}

.modal-footer {
	padding: 2px 8px;
	background-color: #5cb85c;
	color: white;
}
</style>


<style>
.BaseTest {
	background-color: lightgrey;
	width: 25px;
	border: 25px solid black;
	padding: 25px;
	margin: 25px;
}
</style>
</head>
<body style="background-color: skyblue;">



	<!-- Trigger/Open The Modal -->
	<c:choose>
		<c:when test="${not empty ub}">
			<a id="profileButton">${ub.fullName}</a>
		</c:when>
		<c:otherwise>
			<a id="myBtn">Login/Register</a>
		</c:otherwise>
	</c:choose>
	
	<strong><a style="color: red;" href="/contentWriterHome" id="myAdmin"><<< Switch To  Admin Portal >>></a></strong>
	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<div class="modal-header">
				<span class="close">&times;</span>
				<h5>Please login to continue !</h5>
			</div>
			<div class="modal-body">
				<p>
					Username : <input type="text">
				</p>
				<p>
					Password : <input type="text">
				</p>
			</div>
			<div class="modal-footer">
				<a onclick="forgotPassword()">Forgot Password ?</a> <a
					href="/registration" class="button green small">Sign Up</a> <input
					type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</div>
		</div>

	</div>


	<img src="${contextPath}/resources/images/homeScreenTop.jsp.jpg"
		height="380" width="1350">
