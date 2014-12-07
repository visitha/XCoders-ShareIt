<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<head>
<title>Login Page</title>
<style>
.error {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #a94442;
	background-color: #f2dede;
	border-color: #ebccd1;
}

.msg {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #31708f;
	background-color: #d9edf7;
	border-color: #bce8f1;
}

#login-box {
	width: 300px;
	padding: 20px;
	margin: 100px auto;
	background: #fff;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border: 1px solid #000;
}
</style>
</head>
<body onload='document.loginForm.username.focus();'>

	<h1>Spring Security Login Form (Database Authentication)</h1>

	<div class="container" style="width: 50%;">
		<div id="login-box">

			<h3>Login with Username and Password</h3>

			<c:if test="${not empty error}">
				<div class="error">${error}</div>
			</c:if>
			<c:if test="${not empty msg}">
				<div class="msg">${msg}</div>
			</c:if>

			<form name='loginForm'
				action="<c:url value='/j_spring_security_check' />" method='POST'>
				<div class="form-group">
					Username: <input type='text' class="form-control" name='username'>
				</div>
				<div class="form-group">
					Password: <input type='password' class="form-control"
						name='password'>
				</div>
				<div class="form-group">
					<input name="submit" type="submit" value="submit"
						class="btn btn-lg btn-primary btn-block" />
				</div>

				<div class="form-group text-center">
					<a href="${ROOT}">Create Account</a> | <a
						href="${ROOT}">Forgot Username</a>
				</div>

				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />

			</form>
		</div>
	</div>

</body>
</html>