<%@tag description="Extended input tag to allow for sophisticated errors" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>

<%@attribute name="path" required="true" type="java.lang.String"%>
<%@attribute name="name" required="false" type="java.lang.String"%>
<%@attribute name="inputWidthClass" required="false" type="java.lang.String"%>
<%@attribute name="labelWidthClass" required="false" type="java.lang.String"%>
<%@attribute name="cssClass" required="false" type="java.lang.String"%>
<%@attribute name="outerCssClass" required="false" type="java.lang.String"%>
<%@attribute name="label" required="false" type="java.lang.String"%>
<%@attribute name="type" required="false" type="java.lang.String"%>
<%@attribute name="required" required="false" type="java.lang.Boolean"%>
<%@attribute name="prepend" required="false" type="java.lang.Boolean"%>
<%@attribute name="append" required="false" type="java.lang.Boolean"%>
<%@attribute name="readonly" required="false" type="java.lang.Boolean"%>
<%@attribute name="icon" required="false" type="java.lang.String"%>
<%@attribute name="placeholder" required="false" type="java.lang.String"%>
<%@attribute name="labelStyle" required="false" type="java.lang.String"%>
<%@attribute name="basicInput" required="false" type="java.lang.Boolean"%>
<%@attribute name="noFormGroup" required="false" type="java.lang.Boolean"%>
<%@attribute name="maxlength" required="false" type="java.lang.Integer"%>


<c:if test="${empty label}">
    <c:set var="label" value="${fn:toUpperCase(fn:substring(path, 0, 1))}${fn:toLowerCase(fn:substring(path, 1,fn:length(path)))}" />
</c:if>
<c:if test="${fn:length(icon) gt 1 }">
    <c:set var="icon" value='<i class="${icon}"></i>'/>
</c:if>

<c:if test="${not basicInput}">
    <s:bind path="${path}">
        <c:if test="${not noFormGroup}">
            <div class="form-group ${status.error ? 'has-error' : '' }">
        </c:if>

            <label class="control-label ${ empty labelWidthClass ? 'col-xs-4' : labelWidthClass}" style="padding-left: 0; ${labelStyle}" for="${path}">${label}
                <c:if test="${required}">
                    <span class="required"> *</span>
                </c:if>
            </label>

            <div class="${inputWidthClass}">
                <c:choose>
                    <c:when test="${prepend}">
                        <div class="input-prepend input-group ${outerCssClass}" >
                            <span class="add-on input-group-addon">${icon}</span>
                            <form:input id="${path}" path="${path}" name="${path}" type="${type}" placeholder="${placeholder}" maxlength="${maxlength}" readonly="${readonly}" cssClass="form-control ${cssClass}"/>
                        </div>
                    </c:when>
                    <c:when test="${append}">
                        <div class="input-append input-group ${outerCssClass}" >
                            <form:input id="${path}" path="${path}" name="${path}" type="${type}" placeholder="${placeholder}" maxlength="${maxlength}" readonly="${readonly}" cssClass="form-control ${cssClass}"/>
                            <span class="add-on input-group-addon">${icon}</span>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <form:input id="${path}" path="${path}" name="${path}" type="${type}" placeholder="${placeholder}" maxlength="${maxlength}" readonly="${readonly}" cssClass="form-control ${cssClass}"/>
                    </c:otherwise>
                </c:choose>

                <c:if test="${status.error}">
                    <div class="alert alert-danger" style="margin-top: 5px;">${status.errorMessage}</div>
                </c:if>

            </div>

        <c:if test="${not noFormGroup}">
            </div>
        </c:if>

    </s:bind>
</c:if>

<c:if test="${basicInput}">
    <c:if test="${not noFormGroup}">
        <div class="form-group ${status.error ? 'has-error' : '' }">
    </c:if>

        <label class="control-label ${ empty labelWidthClass ? 'col-xs-4' : labelWidthClass}" style="padding-left: 0; ${labelStyle}" for="${path}">${label}
            <c:if test="${required}">
                <span class="required"> *</span>
            </c:if>
        </label>

        <div class="${inputWidthClass}">
            <input name="${empty name ? path : name}" id="${path}" class="form-control ${cssClass}" type="${type}" placeholder="${placeholder}" <c:if test="${readonly}">readonly="true" </c:if> />
        </div>
    <c:if test="${not noFormGroup}">
        </div>
    </c:if>
</c:if>