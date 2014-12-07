<%@tag description="Extended input tag to allow for sophisticated errors" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>

<%@attribute name="path" required="true" type="java.lang.String"%>
<%@attribute name="inputWidthClass" required="false" type="java.lang.String"%>
<%@attribute name="labelWidthClass" required="false" type="java.lang.String"%>
<%@attribute name="cssClass" required="false" type="java.lang.String"%>
<%@attribute name="label" required="false" type="java.lang.String"%>
<%@attribute name="required" required="false" type="java.lang.Boolean"%>
<%@attribute name="placeholder" required="false" type="java.lang.String"%>
<%@attribute name="rows" required="false" type="java.lang.String"%>

<c:if test="${empty label}">
    <c:set var="label" value="${fn:toUpperCase(fn:substring(path, 0, 1))}${fn:toLowerCase(fn:substring(path, 1,fn:length(path)))}" />
</c:if>

<s:bind path="${path}">
    <div class="form-group ${status.error ? 'has-error' : '' }">
        <label class="control-label ${ empty labelWidthClass ? 'col-xs-12' : labelWidthClass}" style="${ empty labelWidthClass ? 'text-align: left;' : ''}" for="${path}">${label}
            <c:if test="${required}">
                <span class="required"> *</span>
            </c:if>
        </label>
        <div class="${empty inputWidthClass ? 'col-xs-12' : inputWidthClass}">
            <form:textarea id="${path}" path="${path}" rows="${rows}" placeholder="${placeholder}" cssClass="form-control ${cssClass}"/>

        </div>
    </div>
    <c:if test="${status.error}">
        <div class="alert alert-danger">${status.errorMessage}</div>
    </c:if>
</s:bind>