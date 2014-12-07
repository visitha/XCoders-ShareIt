<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
</head>
<body>
<h1>Title : ${title}</h1>
<br/>
	<h1>Details of available consignment</h1>
	</br>
	<div class="container">
	<div class="panel panel-info">
	<div class="panel-heading"><h2>${title}</h2></div>
			<div class="panel-body">
				<p><b>Case ID:</b> ${caseid}</p>
				<p><b>Owner Name:</b> ${fname} ${lname}</p>
				<p><b>Expires on:</b> ${expires}</p>
				<p><b>Details:</b> ${details}</p>
				<br/>
				<h3><b>Please contact:</b></h3>
				<p><b>Contact Number:</b> ${phone}</p>
				<p><b>e-mail address:</b> ${email}</p>
				<p><b>Address:</b> ${address}</p>
				<p></p>
			</div>
	</div>
	</div>
</body>
</html>