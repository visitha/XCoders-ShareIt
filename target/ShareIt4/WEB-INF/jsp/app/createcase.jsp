<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Title : ${title}</h1>
	<h1>Message : ${message}</h1>
	</br>

	<div class="container" style="width: 50%;">
		<div class="panel panel-info">
			<div class="panel-heading">Bootstrap: Basic Form</div>
			<div class="panel-body">
				<form method="POST" action="/ShareIt4/createCase">
					<div class="form-group">
						<label for="caseTitle">Case Title : </label> <input type="email"
							class="form-control" id="caseTitle" placeholder="Case Title">
					</div>
					<div class="form-group">
						<label for="caseDiscription">Case Description : </label>
						<textarea class="form-control" rows="3" class="form-control"
							id="caseDiscription" placeholder="Case Description"></textarea>
					</div>

					<div class="form-group">
						<label for="caseDiscription">Expire Date : </label>
						<div class='input-group date' id='expireDate'>
							<input type='text' class="form-control" /> <span
								class="input-group-addon"><span
								class="glyphicon glyphicon-calendar"></span> </span>
						</div>

						<script type="text/javascript">
							// When the document is ready
							$(document).ready(function() {

								$('#expireDate').datepicker({
									format : "dd/mm/yyyy"
								});
								
								$(".dropdown-menu li a").click(function(){
									  var selText = $(this).text();
									  $(this).parents('.btn-group').find('.dropdown-toggle').html(selText+' <span class="caret"></span>');
								});

							});
						</script>
					</div>

					<div class="btn-group">
						<a class="btn btn-default dropdown-toggle btn-select2"
							data-toggle="dropdown" href="#">Select a Region <span
							class="caret"></span></a>
						<ul class="dropdown-menu" id="caseTypeId">
							<li><a href="#">California</a></li>
							<li><a href="#">New York</a></li>
							<li><a href="#">Massachusetts</a></li>
							<li class="divider"></li>
							<li><a href="#">Quebec</a></li>
							<li><a href="#">Ontario</a></li>
							<li><a href="#">British Columbia</a></li>
						</ul>
					</div>

					<div class="form-group">
						<div class="checkbox">
							<label><input type="checkbox"> Remember me</label>
						</div>
						<button type="submit" class="btn btn-primary">Login</button>
					</div>

				</form>

			</div>
		</div>
		
		<form:form method="POST" action="/ShareIt4/createCase" commandName="userForm">
   <table>
    <tr>
        <td><form:label path="caseTitle">Name</form:label></td>
        <td><form:input path="caseTitle" /></td>
    </tr>
    <tr>
        <td><form:label path="caseDiscription">Age</form:label></td>
        <td><form:input path="caseDiscription" /></td>
    </tr>
    <tr>
        <td><form:label path="caseId">id</form:label></td>
        <td><form:input path="caseId" /></td>
    </tr>
    <tr>
        <td colspan="2">
            <input type="submit" value="Submit"/>
        </td>
    </tr>
</table>  
</form:form>

	</div>

</body>
</html>