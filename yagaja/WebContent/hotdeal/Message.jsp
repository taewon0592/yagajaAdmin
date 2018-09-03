<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- Message.jsp --%>
<!-- 자바스크립트로 메시지 출력한후 페이지 이동 -->

<c:choose>
	<c:when test="${WHEREIS =='UPDATE' }">
		<c:set var="sucmsg" value="수정성공" />
		<c:set var="failmsg" value="수정실패" />
		<c:set var="sucurl" value="/DataRoom/DataView?idx=${idx }&nowPage=${nowPage }" />
	</c:when>
	<c:otherwise>
		<c:set var="sucmsg" value="삭제성공" />
		<c:set var="failmsg" value="삭제실패" />
		<c:set var="sucurl" value="/DataRoom/DataList?nowPage=${nowPage }" />
	</c:otherwise>
</c:choose>

<script type="text/javascript">
<c:choose>
	<c:when test="${SUC_FAIL == 1 }">
		alert("${sucmsg }");
		location.href="<c:url value='${sucurl}' />";
	</c:when>
	<c:when test="${SUC_FAIL == 0 }">
		alert("${failmsg }");
		location.href="<c:url value='${failurl}' />";
	</c:when>
	<c:otherwise>
		alert("삭제되었습니다");
		history.back();
	</c:otherwise>
</c:choose>
</script>

