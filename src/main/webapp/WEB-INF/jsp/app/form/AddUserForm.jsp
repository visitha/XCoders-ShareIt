<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- Localization variable declarations -->
<spring:message code="userInfo.placeholder.email" var="p_email"
	text="${DEFAULT_TEXT}" />
<spring:message code="userInfo.placeholder.username" var="p_username"
	text="${DEFAULT_TEXT}" />
<spring:message code="userInfo.placeholder.fname" var="p_fname"
	text="${DEFAULT_TEXT}" />
<spring:message code="userInfo.placeholder.mname" var="p_mname"
	text="${DEFAULT_TEXT}" />
<spring:message code="userInfo.placeholder.lname" var="p_lname"
	text="${DEFAULT_TEXT}" />
<spring:message code="userInfo.placeholder.phone" var="p_phone"
	text="${DEFAULT_TEXT}" />
<spring:message code="userInfo.placeholder.streetAddress"
	var="p_streetAddress" text="${DEFAULT_TEXT}" />
<spring:message code="userInfo.placeholder.city" var="p_city"
	text="${DEFAULT_TEXT}" />
<spring:message code="userInfo.placeholder.stateProv" var="p_stateProv"
	text="${DEFAULT_TEXT}" />
<spring:message code="userInfo.placeholder.country" var="p_country"
	text="${DEFAULT_TEXT}" />
<spring:message code="userInfo.placeholder.postalCode"
	var="p_postalCode" text="${DEFAULT_TEXT}" />
<spring:message code="country.select" var="p_countrySelect"
	text="${DEFAULT_TEXT}" />

<!-- Text input-->
<div class="form-group">
	<label class="col-md-4 control-label" for="username"><spring:message
			code="userInfo.label.username" text="Username : " /> *</label>
	<div class="col-md-4">
		<form:input id="username" path="username" maxlength="50" name="username"
			placeholder="Username" style="color: #999;"
			class="form-control input-md" required="" type="text"/>
	</div>
</div>

<!-- Text input-->
<div class="form-group">
	<label class="col-md-4 control-label" for="password"><spring:message
			code="userInfo.label.email" text="Password : " /> *</label>
	<div class="col-md-5">
		<form:input id="password" path="password" maxlength="50" name="password"
			placeholder="Password" class="form-control input-md" required=""
			type="password"/>

	</div>
</div>

<!-- Text input-->
<div class="form-group">
	<label class="col-md-4 control-label" for="emailAddress"><spring:message
			code="userInfo.label.email" text="Email : " /> *</label>
	<div class="col-md-5">
		<form:input id="email" path="email" class="form-control input-md" maxlength="50" name="emailAddress"
			placeholder="Email"/>

	</div>
</div>
<%-- 
<!-- Select Basic -->
<div class="form-group">
	<label class="col-md-4 control-label selectlist" for="salutation"><spring:message
			code="userInfo.label.salutation" text="Salutation : " /></label>
	<div class="col-md-2">
		<select id="salutation" name="salutation"
			class="form-control selectpicker">
			<option value="">
				<spring:message code="userInfo.option.none" text="Mr" />
			</option>
			<option value="Mr.">
				<spring:message code="userInfo.option.mr" text="Mrs" />
			</option>
			<option value="Mrs.">
				<spring:message code="userInfo.option.mrs" text="Miss" />
			</option>
			<option value="Ms.">
				<spring:message code="userInfo.option.ms" text="Rev" />
			</option>
		</select>
	</div>
</div>

<!-- Text input-->
<div class="form-group">
	<label class="col-md-4 control-label" for="firstName"><spring:message
			code="userInfo.label.fname" text="First Name : " /> *</label>
	<div class="col-md-4">
		<input id="firstName" maxlength="30" name="firstName"
			placeholder="First Name" style="color: #999;"
			class="form-control input-md" required="" type="text">
	</div>
</div>

<!-- Text input-->
<div class="form-group">
	<label class="col-md-4 control-label" for="middleName"><spring:message
			code="userInfo.label.mname" text="Middle Name : " /></label>
	<div class="col-md-4">
		<input id="middleName" maxlength="30" name="middleName"
			placeholder="Middle Name" style="color: #999;"
			class="form-control input-md" required="" type="text">

	</div>
</div>

<!-- Text input-->
<div class="form-group">
	<label class="col-md-4 control-label" for="lastName"><spring:message
			code="userInfo.label.lname" text="Last Name : " /> *</label>
	<div class="col-md-4">
		<input id="lastName" maxlength="30" name="lastName"
			placeholder="Last Name" style="color: #999;"
			class="form-control input-md" required="" type="text">

	</div>
</div>

<!-- Text input-->
<div class="form-group">
	<label class="col-md-4 control-label" for="phone"><spring:message
			code="userInfo.label.phone" text="Tele Phone : " /></label>
	<div class="col-md-4">
		<input id="telephone" maxlength="20" name="phone" placeholder="Tele Phone"
			style="color: #999;" class="form-control input-md" required=""
			type="text">

	</div>
</div>

<!-- Text input-->
<div class="form-group">
	<label class="col-md-4 control-label" for="streetAddress"><spring:message
			code="userInfo.label.streetAddress" text="Address : " /></label>
	<div class="col-md-4">
		<input id="address" maxlength="200" name="streetAddress"
			placeholder="Address" style="color: #999;"
			class="form-control input-md" required="" type="text">

	</div>
</div>

<!-- Text input-->
<div class="form-group">
	<label class="col-md-4 control-label" for="country"><spring:message
			code="userInfo.label.country" text="Country : " /></label>
	<div class="col-md-4">
		<select id="country" name="country" class="form-control selectpicker">
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
			code="userInfo.label.chooseRoles" text="User Roles : " /> *</label>
	<div class="col-md-4">

		<c:forEach items="${userRoles}" var="userRole">
			<div class="input-group input-group-lg">
				<div class="checkbox">
					<label for="roles-8"> <input name="roles" id="roles-8"
						value="${userRole.role_id}" type="checkbox"> <spring:message
							code="userInfo.label.ctlAdmin" text="${userRole.spring_role}" />
					</label>
				</div>
			</div>
		</c:forEach>
	</div>
</div> --%>

<input type="hidden" id="userId" name="userId" />