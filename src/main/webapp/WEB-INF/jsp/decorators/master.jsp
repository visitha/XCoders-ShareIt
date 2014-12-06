<%@page import="org.springframework.web.servlet.support.RequestContext"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<c:set var="ROOT" value="${pageContext.request.contextPath}"
	scope="application" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Mortality Review System</title>
<!-- Don't localize brand name: "Mortality Review System"  -->

<%-- <link rel="shortcut icon" href="${ROOT}/resources/img/favicon.ico">
    <link rel="icon" href="${ROOT}/resources/img/favicon.ico" type="image/x-icon"> --%>

<link rel="stylesheet"
	href="${ROOT}/resources/lib/bootstrap/less/bootstrap.css">
<link rel="stylesheet"
	href="${ROOT}/resources/lib/font-awesome/css/font-awesome.css">

<link rel="stylesheet" href="${ROOT}/resources/css/main.css">


<script type="text/javascript"
	src="${ROOT}/resources/lib/jQuery/js/jquery-1.10.1.min.js"></script>

<script>
	function formSubmit() {
		document.getElementById("logoutForm").submit();
	}
</script>

<style>
.placeholder {
	color: #aaa !important;
}

.note {
	border: 1px solid orange;
	padding: 1em;
	background: #ffffe0;
}
</style>

<decorator:getProperty property="page.page-styles" />

<decorator:head />
</head>

<body>
	<div id="mainTopNav" class="navbar navbar-fixed-top navbar-inverse"
		role="navigation">
		<div class="container">

			<div class="row" style="margin-right: 5px; margin-left: 5px;">
				<ul class="nav navbar-nav navbar-left greeting col-xs-5">
					<div class="navbar-header ">
						<!-- Don't localize below brand name: "Mortality Review System"  -->
						<a class="navbar-brand" style="font-size:30px;" href="${ROOT}"><img
							style="width: 45px; height: 45px;" alt=""
							src="${ROOT}/resources/img/logo2.png" />&nbsp;ShareIt</a>
					</div>
				</ul>
				 <ul class="nav navbar-nav navbar-right" style="margin-top:10px;color:rgb(200, 197, 197)">
					 <c:if test="${username != null }">
						<h2>
							Welcome User : ${username} <a></a>
						</h2> 
					 </c:if>
				 </ul>
			</div>
			
			<div class="row">
				<ul class="nav navbar-nav navbar-right">
					<li>
						<span class="navbar-text"> <a
							href="javascript:formSubmit()">Sign Out</a>
						</span>
					</li>
				</ul>
			</div>

			<!-- For login user -->
			<c:url value="/j_spring_security_logout" var="logoutUrl" />
				
			<form action="${logoutUrl}" method="post" id="logoutForm">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
			

		</div>
	</div>

	<div id="body" class="container">
		<decorator:body />
	</div>

</body>
</html>