<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="iTag" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
/* var aDate = $('.expireDate').datepicker({
	weekStart: 1,
    autoclose: true
}).on("changeDate", function(ev){
    aDate.hide();
}).data("datepicker");
 */
$(document).ready(function () {
    
    $('#expireDate').datepicker({
        format: "dd/mm/yyyy"
    });  

});
</script>
</head>
<body>
	<h1>Title : ${title}</h1>
	<h1>Message : ${message}</h1>
	</br>

	<div class="container" style="width: 50%;">
		<div class="panel panel-info">
			<div class="panel-heading">Bootstrap: Basic Form</div>
			<div class="panel-body">

				<form:form method="POST" action="/ShareIt4/createCase"
					commandName="userForm">
					<tr>
						<div class="form-group">
							<form:label path="caseTitle">Name :   </form:label>
							<form:input path="caseTitle" class="form-control" id="caseTitle"
								placeholder="Case Title" />
						</div>
					</tr>
					<tr>
						<div class="form-group">
							<form:label path="caseDiscription">Case Description :   </form:label>
							<form:textarea path="caseDiscription" class="form-control"
								id="caseDiscription" placeholder="Case Description" />
						</div>

					</tr>
					<tr>
						<div class="form-group">
							<form:label path="expireDate">Expire Date :   </form:label>
							<form:input id ="expireDate" path="expireDate" />
							<%-- <iTag:input path="expireDate" label="expireDate" placeholder="expireDataa" outerCssClass="date datepicker expireDate" inputWidthClass="col-xs-4" append="true" icon="icon-calendar" readonly="false" required="true"/> --%>
						</div>

					</tr>
					<tr>
						<div class="form-group">
							<form:label path="caseTypeId">Case Types :   </form:label>
							<form:select path="caseTypeId" items="${caseTypes}" value="9"/>
						</div>

					</tr>
					<div class="form-group">
						<div class="checkbox">
							<label><input type="checkbox"> Remember me</label>
						</div>
						<button type="submit" class="btn btn-primary">Login</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>


</body>
</html>