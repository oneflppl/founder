<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Founder - Add New Daily</title>
<link rel="stylesheet" href="<spring:url value="/resources/css/bootstrap.min.css"/>" ></link>
<link rel="stylesheet" href="<spring:url value="/resources/css/jquery-ui.css"/>" ></link>
<script type="text/javascript" src="<spring:url value="/resources/js/jquery-1.12.3.min.js" />"></script>
<script type="text/javascript" src="<spring:url value="/resources/js/jquery-ui.min.js" />"></script>
<script type="text/javascript" src="<spring:url value="/resources/js/bootstrap.min.js" />"></script>
</head>
<body>
	<jsp:include page="../views/fragments/menu.jsp"></jsp:include>
	<div class="container">	
	<h2>Add New Daily</h2>
	<spring:url value="/myprojects/${mydaily.project.id}/dailys/save" var="formUrl" />

		<form:form modelAttribute="mydaily"  method="POST" action="${formUrl}" class="col-md-8 col-md-offset-2">
							
				<div class="form-group">
					<label for="title">Title : </label>
					<form:input class="form-control" id="title"  path="title"/>
				</div>
				
			<div class="form-group">
				<label for="dsc">Description : </label>
				<form:textarea id="dsc" class="form-control" rows="30" path="dsc" />
			</div>

			<button class="btn btn-success" type="submit">Continue</button>
		
		</form:form>
	
	</div>
</body>
</html>


