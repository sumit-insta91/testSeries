<%@include file="homeHeader.jsp" %>

	<!-- TestSeries list -->
	<table width="100%">
		<c:set var="count" value="${1}" />
		<tr>
			<c:forEach items="${testSeriesList}" var="ts">
				<td class="BaseTest"><a href="/enterTestSeries/${ts.id}"><c:out value="${ts.testName}" /></a></td>
				<c:if test="${count%3 == 0}">
					<tr></tr>
				</c:if>
				<c:set var="count" value="${count+1}" />
			</c:forEach>
		</tr>
	</table>


<%@include file="homeFooter.jsp" %>