<%@page import="org.springframework.web.servlet.support.RequestContext"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
<title>ShareIt</title>
<!-- Don't localize brand name: "Mortality Review System"  -->

<%-- <link rel="shortcut icon" href="${ROOT}/resources/img/favicon.ico">
    <link rel="icon" href="${ROOT}/resources/img/favicon.ico" type="image/x-icon"> --%>

<link rel="stylesheet"
	href="${ROOT}/resources/lib/bootstrap/less/bootstrap.css">
<link rel="stylesheet"
	href="${ROOT}/resources/lib/font-awesome/css/font-awesome.css">
<link rel="stylesheet"
	href="${ROOT}/resources/lib/bootstrap/css/datepicker.css">
<link rel="stylesheet" href="${ROOT}/resources/css/main.css">


<script type="text/javascript"
	src="${ROOT}/resources/lib/jQuery/js/jquery-1.10.1.min.js"></script>
<script type="text/javascript"
	src="${ROOT}/resources/lib/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${ROOT}/resources/lib/bootstrap/js/bootstrap-datepicker.js"></script>
<script type="text/javascript"
	src="${ROOT}/resources/lib/bootstrap-select/js/bootstrap-select.js"></script>

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
						<a class="navbar-brand" style="font-size: 30px;" href="${ROOT}"><img
							style="width: 45px; height: 45px;" alt=""
							src="" />&nbsp;ShareIt</a>
					</div>
				</ul>
				<ul class="nav navbar-nav navbar-right"
					style="margin-top: 10px; color: rgb(200, 197, 197)">
					<c:if test="${username != null }">
						<h2>
							Welcome : ${username} <a></a>
						</h2>
					</c:if>
				</ul>
			</div>

			<c:if test="${username != null }">
				<div class="row">
					<ul class="nav navbar-nav navbar-left greeting col-xs-11">
						<nav class="navbar navbar-default" role="navigation">
						<div class="container-fluid">
							<!-- Brand and toggle get grouped for better mobile display -->

							<!-- Collect the nav links, forms, and other content for toggling -->
							<div class="collapse navbar-collapse"
								id="bs-example-navbar-collapse-1">
								<ul class="nav navbar-nav">
									<li class="active"><a href="${ROOT}/welcome">Home <span
											class="sr-only">(current)</span></a></li>

									<li class="dropdown"><a href="#" class="dropdown-toggle"
										data-toggle="dropdown" role="button" aria-expanded="false">Share
											Case <span class="caret"></span>
									</a>
										<ul class="dropdown-menu" role="menu">
											<li><a href="${ROOT}/getCreateCasePage">Create new
													Case</a></li>
											<li class="divider"></li>
											<li><a href="${ROOT}/myCases">View My Cases</a></li>
											<li class="divider"></li>
											<li><a href="#">Search</a></li>
										</ul></li>

									<li class="dropdown"><a href="#" class="dropdown-toggle"
										data-toggle="dropdown" role="button" aria-expanded="false">Administration
											<span class="caret"></span>
									</a>
										<ul class="dropdown-menu" role="menu">
											<li><a href="#">Modify User Profile</a></li>
										</ul></li>
										<li class=""><a href="${ROOT}/aboutUs">What We Do <span
											class="sr-only">(current)</span></a></li>
											<li class=""><a href="${ROOT}/contactUs">Contact Us <span
											class="sr-only">(current)</span></a></li>
								</ul>
								<form:form id="addUserForm" method="GET"
									action="/ShareIt4/filterCase" commandName="userForm"
									class="form-horizontal navbar-form navbar-right">
									<div class="form-group" style="padding-right: 20px;">
										<select id="filterType" name="filterType"
											class="form-control selectpicker">
											<option value="">Select Filter Type</option>
											<option value="1">Donations</option>
											<option value="2">Disasters</option>
											<option value="3">Buy</option>
											<option value="4">Sell</option>
											<option value="5">Finalized Cases</option>
										</select>
									</div>
									<button type="submit" class="btn btn-default">Submit</button>
								</form:form>
							</div>
							<!-- /.navbar-collapse -->
						</div>
						<!-- /.container-fluid --> </nav>
					</ul>

					<ul class="nav navbar-nav navbar-right">
						<li><span class="navbar-text"> <a
								href="javascript:formSubmit()">Sign Out</a>
						</span></li>
					</ul>
				</div>
			</c:if>

			<!-- For login user -->
			<c:url value="/j_spring_security_logout" var="logoutUrl" />

			<form action="${logoutUrl}" method="post" id="logoutForm">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>


		</div>
	</div>
	<div>
		<div id="body" class="container">
			<decorator:body />
		</div>
	</div>


</body>
</html>