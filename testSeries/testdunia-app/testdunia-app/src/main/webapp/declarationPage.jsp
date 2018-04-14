<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body style="background-color: grey;">
<form action="/startTest" method="post">
	<table width="100%">
		<tr>
			<td align="left" colspan="2"
				style="background-color: #ffeded; padding-left: 50px; font-weight: 16px;color:blue"><h2>
					${test.exactTestName}</h2></td>
		</tr>
		<tr>
			<td width="75%"
				style="background-color: lightgreen; padding-left: 40px;">

				<h3 align="left">Declaration :</h3> Who can register for the
				course? NPTEL online courses are open to everyone. The courses in
				programming, data structures<BR> and algorithms are aimed at
				undergraduate college students (any engineering or science stream)<BR>
				in their 2nd year or above.<BR> <BR> What will be the
				duration of the course?<BR> The course duration will be for
				about 10 to 11 weeks.<BR> <BR> How do I sign up?<BR>
				All you need is access to a computer with a current browser and an
				Internet connection.<BR> Log on to:
				xyzabcdefgh and follow the sign-up procedures.<BR>
				<BR> What should I do after I sign up?<BR> After sign-up,
				you have to watch the lecture videos and attempt the assignments
				every week regularly.<BR> <BR> How are certificates
				issued?<BR> Certificates will be issued based on an in-person
				proctored online examination which will be conducted <BR> after
				the course concludes. A nominal fee is applicable to take the
				in-person proctored examination.<BR> <BR> Registration for
				the proctored exam will commence two weeks after the start of the
				online course.<BR> Are the classes free?<BR> Yes. Access
				to the online course resources is free. A nominal fee is applicable
				if you want to take the <BR> in-person proctored online
				examination<BR> <BR> Is there a last date for signing up?<BR>
				Yes, you need to sign up before a last date for every offering of
				the course. The last date will be displayed <BR> prominently in
				the portal.<BR> 
				<br>
				<br>
				<input type="checkbox" id="declareCheck" name="declareCheck" onchange="checkDeclaration()">
				I hereby declare that I have read the rules and regualtions.
				<BR>
				<BR>
				<input type="submit"  style="margin-left: 350px;" disabled="disabled" id="declareButton" name="declareButton" value="Declare & Start Test">
				
				<BR>
				<BR>
				<input type="hidden" name="exactTestId" value="${test.id}">
			</td>
			<td valign="top" width="40%" style="background-color: lightgrey;">
				<img style="width: 200px;height: 200px;margin-left: 80px;margin-top: 50px;" src="${contextPath}/resources/images/face.jpg"></td>
		<tr>
	</table>
</body>

<script>
	function checkDeclaration(){
		if(document.getElementById("declareCheck").checked){
			document.getElementById("declareButton").disabled=false;
		}else{
			document.getElementById("declareButton").disabled=true;
		}
	}
</script>

</html>