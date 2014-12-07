<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript">
	$('#addNewUserButton').click(function() {
		alert("clicked");
	});
</script>
</head>
<body>
	<h1>Title : ${title}</h1>
	</br>

	<div id="newUserAddition" class="col-xs-12">
		<div class="well">
			<form:form id="addUserForm" method="POST"
				action="/ShareIt4/createUser" commandName="userForm"
				class="form-horizontal">
				<legend>
					Add a new user to this site<span class="text-muted"
						style="padding-left: 15px; font-size: 50%;"><em>(<span
							class="required"> * </span> denotes a required field )
					</em></span>
				</legend>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="username"><spring:message
							code="userInfo.label.username" text="" />Username : *</label>
					<div class="col-md-4">
						<form:input id="username" path="username" maxlength="50"
							name="username" placeholder="Username" style="color: #999;"
							class="form-control input-md" required="" type="text" />
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="password"><spring:message
							code="userInfo.label.email" text="" />Password : *</label>
					<div class="col-md-5">
						<form:input id="password" path="password" maxlength="50"
							name="password" placeholder="Password"
							class="form-control input-md" required="" type="password" />

					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="emailAddress"><spring:message
							code="userInfo.label.email" text=" " />Email : *</label>
					<div class="col-md-5">
						<form:input id="email" path="email" class="form-control input-md"
							maxlength="50" name="emailAddress" required="" placeholder="Email" />

					</div>
				</div>

				<!-- Select Basic -->
				<div class="form-group">
					<label class="col-md-4 control-label selectlist" for="salutation"><spring:message
							code="userInfo.label.salutation" text=" " />Salutation :</label>
					<div class="col-md-2">
						<select id="salutation" name="salutation"
							class="form-control selectpicker">
							<option value="">Mr</option>
							<option value="Mr.">Mrs</option>
							<option value="Mrs.">Miss</option>
							<option value="Ms.">Rev</option>
						</select>
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="firstName"><spring:message
							code="userInfo.label.fname" text="" />First Name : *</label>
					<div class="col-md-4">
						<input id="firstName" maxlength="30" name="firstName"
							placeholder="First Name" style="color: #999;"
							class="form-control input-md" required="" type="text">
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="middleName"><spring:message
							code="userInfo.label.mname" text="Middle Name : " />Middle Name :</label>
					<div class="col-md-4">
						<input id="middleName" maxlength="30" name="middleName"
							placeholder="Middle Name" style="color: #999;"
							class="form-control input-md" type="text">

					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="lastName"><spring:message
							code="userInfo.label.lname" text="Last Name : " />Last Name : *</label>
					<div class="col-md-4">
						<input id="lastName" maxlength="30" name="lastName"
							placeholder="Last Name" style="color: #999;"
							class="form-control input-md" required="" type="text">

					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="telephone"><spring:message
							code="userInfo.label.phone" text=" " />Tele Phone :</label>
					<div class="col-md-4">
						<input id="telephone" maxlength="20" name="telephone"
							placeholder="Tele Phone" style="color: #999;"
							class="form-control input-md" type="text">

					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="address"><spring:message
							code="userInfo.label.streetAddress" text=" " />Address :</label>
					<div class="col-md-4">
						<input id="address" maxlength="200" name="address"
							placeholder="Address" style="color: #999;"
							class="form-control input-md" type="text">

					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="country"><spring:message
							code="userInfo.label.country" text=" " />Country :</label>
					<div class="col-md-4">
						<select id="country" name="country"
							class="form-control selectpicker">
							<option value="">Select a Country</option>
							<option value="Sri Lanka">Sri Lanka</option>
							<option value="Australia">Australia</option>
							<option value="USA">USA</option>
							<option value="England">England</option>
							<option value="South Africa">South Africa</option>
							<option value="Ethyopia">Ethyopia</option>
							<option value="Somalia">Somalia</option>
						</select>

					</div>
				</div>

				<!-- Multiple Checkboxes -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="roles"><spring:message
							code="userInfo.label.chooseRoles" text=" " />User Roles : *</label>
					<div class="col-md-4">

						<c:forEach items="${userRoles}" var="userRole">
							<div class="input-group input-group-lg">
								<div class="checkbox">
									<label for="roles-8"> <input name="roles" id="roles-8"
										value="${userRole.spring_role}" type="checkbox">${userRole.role_name}
									</label>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>

				<!-- Button -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="addNewUserButton"></label>
					<div class="col-md-4">
						<button type="submit" id="addNewUserButton"
							 class="btn btn-primary">Create
							User</button>
					</div>
				</div>
			</form:form>
		</div>
	</div>

</body>
</html>