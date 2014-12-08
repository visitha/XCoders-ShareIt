<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="iTag" tagdir="/WEB-INF/tags" %>

<!-- Localization variable declarations -->
<spring:message code="userInfo.placeholder.email" var="p_email" text="${DEFAULT_TEXT}"/>
<spring:message code="userInfo.placeholder.username" var="p_username" text="${DEFAULT_TEXT}"/>
<spring:message code="userInfo.placeholder.fname" var="p_fname" text="${DEFAULT_TEXT}"/>
<spring:message code="userInfo.placeholder.mname" var="p_mname" text="${DEFAULT_TEXT}"/>
<spring:message code="userInfo.placeholder.lname" var="p_lname" text="${DEFAULT_TEXT}"/>
<spring:message code="userInfo.placeholder.phone" var="p_phone" text="${DEFAULT_TEXT}"/>
<spring:message code="userInfo.placeholder.streetAddress" var="p_streetAddress" text="${DEFAULT_TEXT}"/>
<spring:message code="userInfo.placeholder.city" var="p_city" text="${DEFAULT_TEXT}"/>
<spring:message code="userInfo.placeholder.stateProv" var="p_stateProv" text="${DEFAULT_TEXT}"/>
<spring:message code="userInfo.placeholder.country" var="p_country" text="${DEFAULT_TEXT}"/>
<spring:message code="userInfo.placeholder.postalCode" var="p_postalCode" text="${DEFAULT_TEXT}"/>
<spring:message code="country.select" var="p_countrySelect" text="${DEFAULT_TEXT}"/>

<spring:message code="userInfo.label.email" var="l_emailAddress" text="${DEFAULT_TEXT}"/>
<spring:message code="userInfo.label.username" var="l_username" text="${DEFAULT_TEXT}"/>
<spring:message code="userInfo.label.fname" var="l_firstName" text="${DEFAULT_TEXT}"/>
<spring:message code="userInfo.label.mname" var="l_middleName" text="${DEFAULT_TEXT}"/>
<spring:message code="userInfo.label.lname" var="l_lastName" text="${DEFAULT_TEXT}"/>
<spring:message code="userInfo.label.phone" var="l_phone" text="${DEFAULT_TEXT}"/>
<spring:message code="userInfo.label.streetAddress" var="l_streetAddress" text="${DEFAULT_TEXT}"/>
<spring:message code="userInfo.label.city" var="l_city" text="${DEFAULT_TEXT}"/>
<spring:message code="userInfo.label.stateProv" var="l_state" text="${DEFAULT_TEXT}"/>
<spring:message code="userInfo.label.postalCode" var="l_postalCode" text="${DEFAULT_TEXT}"/>
<spring:message code="userInfo.label.country" var="l_country" text="${DEFAULT_TEXT}"/>

<!-- Text input-->
<iTag:input path="emailAddress" maxlength="50" label="${l_emailAddress}" placeholder="${p_email}" inputWidthClass="col-xs-4" required="true" type="text"/>
<iTag:input path="username" maxlength="50" label="${l_username}" placeholder="${p_username}" inputWidthClass="col-xs-4" required="true" type="text" readonly="${isUserProfile ? 'false' : 'true'}"/>

<%-- MRS-335 Fixed the setting of the salutation for the dropdown --%>
<!-- Select Basic -->
<div class="form-group">
    <label class="col-md-4 control-label selectlist" for="salutation"><spring:message code="userInfo.label.salutation" text="${DEFAULT_TEXT}"/></label>
    <div class="col-md-4">
        <form:select path="salutation" id="salutation" name="salutation" class="form-control selectpicker">
            <form:option value="" ><spring:message code="userInfo.option.none" text="${DEFAULT_TEXT}"/></form:option>
            <form:option value="Mr." ><spring:message code="userInfo.option.mr" text="${DEFAULT_TEXT}"/></form:option>
            <form:option value="Mrs." ><spring:message code="userInfo.option.mrs" text="${DEFAULT_TEXT}"/></form:option>
            <form:option value="Ms." ><spring:message code="userInfo.option.ms" text="${DEFAULT_TEXT}"/></form:option>
            <form:option value="Miss" ><spring:message code="userInfo.option.miss" text="${DEFAULT_TEXT}"/></form:option>
            <form:option value="Dr." ><spring:message code="userInfo.option.dr" text="${DEFAULT_TEXT}"/></form:option>
            <form:option value="Prof" ><spring:message code="userInfo.option.prof" text="${DEFAULT_TEXT}"/></form:option>
        </form:select>
    </div>
</div>

<iTag:input path="firstName" maxlength="30" label="${l_firstName}" placeholder="${p_fname}" inputWidthClass="col-xs-4" required="true" type="text"/>
<iTag:input path="middleName" maxlength="30" label="${l_middleName}" placeholder="${p_mname}" inputWidthClass="col-xs-4" type="text"/>
<iTag:input path="lastName" maxlength="30" label="${l_lastName}" placeholder="${p_lname}" inputWidthClass="col-xs-4" required="true" type="text"/>
<iTag:input path="phone" maxlength="20" label="${l_phone}" placeholder="${p_phone}" inputWidthClass="col-xs-4" type="text"/>
<iTag:input path="streetAddress" maxlength="200" label="${l_streetAddress}" placeholder="${p_streetAddress}" inputWidthClass="col-xs-4" type="text"/>
<iTag:input path="city" maxlength="50" label="${l_city}" placeholder="${p_city}" inputWidthClass="col-xs-4" type="text"/>
<iTag:input path="state" maxlength="50" label="${l_state}" placeholder="${p_stateProv}" inputWidthClass="col-xs-4" type="text"/>
<iTag:select path="country" cssClass="selectpicker" label="${l_country}" inputWidthClass="col-xs-4" items="${countries}" />
<iTag:input path="postalCode" maxlength="20" label="${l_postalCode}" placeholder="${p_postalCode}" inputWidthClass="col-xs-4" type="text"/>


<c:if test="${not isUserProfile}">
<!-- Multiple Checkboxes -->
<div class="form-group">
    <label class="col-md-4 control-label" for="roles"><spring:message code="userInfo.label.chooseRoles" text="${DEFAULT_TEXT}"/> *</label>
    <div class="col-md-4">
        <div class="checkbox">
            <label for="roles-1">
                <input name="roles" id="roles-1" value="1" type="checkbox">
                <spring:message code="userInfo.label.nurseReviewer" text="${DEFAULT_TEXT}"/>
            </label>
        </div>
        <div class="checkbox">
            <label for="roles-2">
                <input name="roles" id="roles-2" value="2" type="checkbox">
                <spring:message code="userInfo.label.phyReviewer" text="${DEFAULT_TEXT}"/>
            </label>
        </div>
        <div class="checkbox">
            <label for="roles-3">
                <input name="roles" id="roles-3" value="3" type="checkbox">
                <spring:message code="userInfo.label.committeeReviewer" text="${DEFAULT_TEXT}"/>
            </label>
        </div>
        <div class="checkbox">
            <label for="roles-4">
                <input name="roles" id="roles-4" value="4" type="checkbox">
                <spring:message code="userInfo.label.siteCoordinator" text="${DEFAULT_TEXT}"/>
            </label>
        </div>
        <div class="checkbox">
            <label for="roles-5">
                <input name="roles" id="roles-5" value="5" type="checkbox">
                <spring:message code="userInfo.label.siteAdmin" text="${DEFAULT_TEXT}"/>
            </label>
        </div>
        <div class="checkbox">
            <label for="roles-8">
                <input name="roles" id="roles-8" value="8" type="checkbox">
                <spring:message code="userInfo.label.ctlAdmin" text="${DEFAULT_TEXT}"/>
            </label>
        </div>
    </div>
    <div class="alert alert-info col-xs-5 col-xs-push-4" role="alert" style="margin-bottom: 0px; margin-top: 5px; padding: 5px;">
        <small>
            <ul>
                <li id="reactivateUserNotice">
                    <span><spring:message code="userManagement.notice.reactivateUser" text="${DEFAULT_TEXT}"/></span>
                </li>
                <li><spring:message code="userManagement.notice.logOff" text="${DEFAULT_TEXT}"/></li>
                <li><spring:message code="userManagement.notice.deactivatedAssignment" text="${DEFAULT_TEXT}"/></li>
            </ul>
        </small>
    </div>
</div>
</c:if>

<input type="hidden" id="userId" name="userId" value="${user.userId}"/>