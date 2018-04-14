<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>
<html lang="en">
<head>
<link rel="shortcut icon" type="image/x-icon" href="${contextPath}/resources/images/favicon.ico" />
  <title>GSK - Quiz</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <link rel="stylesheet" href="${contextPath}/resources/css/gskStyle.css">

<style>
	#quiz_form fieldset:not(:first-of-type) {
    	display: none;
  	}
</style>

</head>
<body class="text-center">
  <nav class="navbar navbar-default tembus">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>

      </div>

      <div class="collapse navbar-collapse" id="myNavbar">
        <ul class="nav navbar-nav">
          <li><a class="navbar-brand" href="#" style="padding: 1px;"><img class="logoImg img-responsive" src="${contextPath}/resources/images/logo_gsk.png"></a></li>
          <li class="active"><a href="#">Home</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
          <li>
      <a href="#"><span class="glyphicon glyphicon-user"></span>Welcome ${pageContext.request.userPrincipal.name}</a>
       </li>
        <li>
      <a id="logoutLink" onclick="document.forms['logoutForm'].submit()"><span class="glyphicon glyphicon-log-out" ></span> Logout </a>
      </li>
        </ul>
      </div>
    </div>
  </nav>
 <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
   </c:if>
   
 <div class="container" style="padding:7%">
 <h2>Sorry Please <label class="btn btn-default customRadio" style="border-radius: 20px; margin: 10px;"><a href="/user/user-dashboard" class="startButton">Try Again</a></label></h2>
  
</div> <!-- end container -->

 <script src="https://code.jquery.com/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/app.js"></script>
</body>
</html>