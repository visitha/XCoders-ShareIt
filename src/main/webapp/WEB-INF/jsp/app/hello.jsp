<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<html>
<body>
	<h1>Title : ${title}</h1>
	<h1>Message : ${message}</h1>
	</br>

	<div class="container">

		<%-- <security:authorize ifAnyGranted="ROLE_ADMIN">
			<li>
				<div>
					<span class="navbar-text boldGrey noMargin"
						style="margin-right: 0;">Great Work Man</span><br />
				</div>
			</li>

		</security:authorize>
 --%>
		<c:forEach items="${shareCasesList}" var="shareCase">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title"> ${shareCase.caseId} . ${shareCase.caseTitle}</h3>
					<button class="btn  btn-primary" style="margin-top:10px" onclick="document.location='/ShareIt4/reviewCase/ ${shareCase.caseId}'">View Details</button>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-xs-6 col-sm-3 text-right"
							style="border-right: 1px solid #ccc;">
							<address>
								<strong><abbr title="Phone number">Tel:</abbr> (123)
									456-7890</strong><br />

							</address>
							${shareCase.caseDiscription}
						</div>
						<div class="col-xs-6 col-sm-3 text-left">
							<p>
								<span class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star-empty"></span> <span
									class="glyphicon glyphicon-star-empty"></span>
							</p>
							<p>Rate Yourself!</p>
						</div>
						<div class="clearfix visible-xs"></div>
						<div class="col-xs-4 col-sm-2 text-center">
							<img src="${ROOT}/resources/img/flour.jpg"
								" class="img-responsive img-circle img-thumbnail" /> <br /> <strong>Picture 1</strong>
						</div>
						<div class="col-xs-4 col-sm-2 text-center"
							style="border-right: 1px solid #ccc; border-left: 1px solid #ccc;">
							<img src="${ROOT}/resources/img/water.jpg"
								" class="img-responsive img-circle img-thumbnail" /> <br /> <strong>Picture 2</strong>
						</div>
						<div class="col-xs-4 col-sm-2 text-center">
							<img src="${ROOT}/resources/img/rice.jpg"
								" class="img-responsive img-circle img-thumbnail" /> <br /> <strong>Picture 3</strong>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>

</body>
</html>