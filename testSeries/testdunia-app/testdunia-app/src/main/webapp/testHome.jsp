<%@include file="homeHeader.jsp" %>

	<!-- Base test list -->
	<table width="100%">
		<c:set var="count" value="${1}" />
		<tr>
			<c:forEach items="${courseBaseList}" var="baseCourse">
				<td class="BaseTest"><a href="/enterCourseBase/${baseCourse.id}"><c:out value="${baseCourse.courseName}" /></a></td>
				<c:if test="${count%3 == 0}">
					<tr></tr>
				</c:if>
				<c:set var="count" value="${count+1}" />
			</c:forEach>
		</tr>
	</table>

<%@include file="homeFooter.jsp" %>



