<%@include file="homeHeader.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	<!-- Base test list -->
	<table width="100%">
		<c:set var="count" value="${1}" />
		<tr>
			<c:forEach var="et" items="${exactTestList}" >
				<td class="BaseTest"><a href="/declarationPage/${et.id}"><c:out value="${et.exactTestName}" /></a></td>
				<c:if test="${count%3 == 0}">
					<tr></tr>
				</c:if>
				<c:set var="count" value="${count+1}" />
			</c:forEach>
		</tr>
	</table>

<%@include file="homeFooter.jsp" %>



