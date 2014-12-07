<%@tag description="Extended input tag to allow for sophisticated errors" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@attribute name="path" required="false" type="java.lang.String"%>
<%@attribute name="inputWidthClass" required="false" type="java.lang.String"%>
<%@attribute name="labelWidthClass" required="false" type="java.lang.String"%>
<%@attribute name="cssClass" required="false" type="java.lang.String"%>
<%@attribute name="label" required="false" type="java.lang.String"%>
<%@attribute name="required" required="false" type="java.lang.Boolean"%>
<%@attribute name="multiple" required="false" type="java.lang.String"%>
<%@attribute name="basicSelect" required="false" type="java.lang.Boolean"%>
<%@attribute name="icon" required="false" type="java.lang.String"%>
<%@attribute name="placeholder" required="false" type="java.lang.String"%>
<%@attribute name="defaultEmptyOption" required="false" type="java.lang.String"%>
<%@attribute name="items" required="false" type="java.util.List"%>
<%@attribute name="nestedItems" required="false" type="java.lang.String"%>
<%@attribute name="itemLabel" required="false" type="java.lang.String"%>
<%@attribute name="nestedItemLabel" required="false" type="java.lang.String"%>
<%@attribute name="itemValue" required="false" type="java.lang.String"%>
<%@attribute name="nestedItemValue" required="false" type="java.lang.String"%>
<%@attribute name="selectType" required="false" type="java.lang.String"%>
<%@attribute name="labelStyle" required="false" type="java.lang.String"%>
<%@attribute name="data" required="false" type="java.lang.String"%>
<%@attribute name="title" required="false" type="java.lang.String"%>
<%@attribute name="noFormGroup" required="false" type="java.lang.Boolean"%>
<%@attribute name="defaultValue" required="false" type="java.lang.String"%>



<c:if test="${fn:length(icon) gt 1 }">
    <c:set var="icon" value='<i class="${icon}"></i>'/>
</c:if>

<c:choose>
    <c:when test="${not basicSelect}">
        <spring:bind path="${path}">

        <c:if test="${not noFormGroup}">
            <div class="form-group ${status.error ? 'has-error' : '' }">
        </c:if>

            <c:if test="${not empty label}">
                <label class="control-label ${ empty labelWidthClass ? 'col-xs-4' : labelWidthClass}" style="padding-left: 0; ${labelStyle}" for="${path}">${label}
                    <c:if test="${required}">
                        <span class="required"> *</span>
                    </c:if>
                </label>
            </c:if>
            <div class="${inputWidthClass}">
                <form:select path="${path}" cssClass="form-control ${cssClass} ${status.error ? 'has-error' : '' }" multiple="${empty multiple ? 'false' : multiple}" data="${empty data ? '' : data}" >
                    <c:if test="${not empty defaultEmptyOption}">
                        <form:option value="">${defaultEmptyOption}</form:option>
                    </c:if>
                    <c:choose>
                        <c:when test="${selectType eq 'gender'}">
                            <form:option value="M"><spring:message code="selectTag.option.male" text="Male"/></form:option>
                            <form:option value="F"><spring:message code="selectTag.option.female" text="Female"/></form:option>
                        </c:when>
                        <c:when test="${selectType eq 'yesNo'}">
                            <form:option value="Y"><spring:message code="selectTag.option.yes" text="Yes"/></form:option>
                            <form:option value="N"><spring:message code="selectTag.option.no" text="No"/></form:option>
                        </c:when>
                        <c:when test="${selectType eq 'trueFalse'}">
                            <form:option value="true"><spring:message code="selectTag.option.yes" text="Yes"/></form:option>
                            <form:option value="false"><spring:message code="selectTag.option.no" text="No"/></form:option>
                        </c:when>
                        <c:when test="${not empty items and empty nestedItems}">
                            <c:if test="${empty itemLabel and empty itemValue}">
                                <form:options  items="${items}" />
                            </c:if>
                            <c:if test="${not empty itemLabel and not empty itemValue}">
                                <form:options  items="${items}" itemLabel="${itemLabel}" itemValue="${itemValue}"/>
                            </c:if>
                        </c:when>
                        <c:when test="${not empty items and not empty nestedItems}">
                            <c:forEach var="item" items="${items}" varStatus="itemGroupIndex">
                                <optgroup label="${item[itemLabel]}">
                                    <form:options  items="${item[nestedItems]}" itemLabel="${nestedItemLabel}" itemValue="${nestedItemValue}"/>
                                </optgroup>
                            </c:forEach>
                        </c:when>
                    </c:choose>
                </form:select>
                <c:if test="${status.error}">
                    <div class="alert alert-danger" style="margin-top: 50px;">${status.errorMessage}</div>
                </c:if>
            </div>
            <c:if test="${not noFormGroup}">
                </div>
            </c:if>
        </spring:bind>
    </c:when>
    <c:otherwise>
        <c:if test="${not noFormGroup}">
            <div class="form-group ${status.error ? 'has-error' : '' }">
        </c:if>
        <c:if test="${not empty label}">
            <label class="control-label ${ empty labelWidthClass ? 'col-xs-4' : labelWidthClass}" style="padding-left: 0; ${labelStyle}" for="${path}">${label}
                <c:if test="${required}">
                    <span class="required"> *</span>
                </c:if>
            </label>
        </c:if>
        <div class="${inputWidthClass}">
            <select name="${path}" id="${path}" title="${title}" class="form-control ${cssClass}" ${empty multiple ? '' : multiple} ${empty data ? '' : data} >
                <c:if test="${not empty defaultEmptyOption}">
                    <option value="">${defaultEmptyOption}</option>
                </c:if>
                <c:choose>
                    <c:when test="${not empty items and not empty nestedItems}">
                        <c:forEach var="item" items="${items}" varStatus="itemGroupIndex">
                            <optgroup label="${item[itemLabel]}">
                                <c:forEach var="nestedItem" items="${item[nestedItems]}" varStatus="nestedItemIndex">
                                    <option value="${nestedItem[nestedItemValue]}">${nestedItem[nestedItemLabel]}</option>
                                </c:forEach>
                            </optgroup>
                        </c:forEach>
                    </c:when>
                    <c:when test="${not empty items and empty nestedItems}">
                        <c:forEach items="${items}" var="item">
                            <option value="${ item[itemValue]}" <c:if test="${(not empty defaultValue) && (defaultValue == item[itemValue])}">selected="selected"</c:if>>${item[itemLabel]}</option>
                        </c:forEach>
                    </c:when>
                </c:choose>
            </select>
        </div>
        <c:if test="${not noFormGroup}">
            </div>
        </c:if>
    </c:otherwise>
</c:choose>

