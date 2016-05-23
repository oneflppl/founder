<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Founder - Add New Project</title>
<link rel="stylesheet" href="<spring:url value="/resources/css/bootstrap.min.css"/>" ></link>
<link rel="stylesheet" href="<spring:url value="/resources/css/jquery-ui.css"/>" ></link>
<script type="text/javascript" src="<spring:url value="/resources/js/jquery-1.12.3.min.js" />"></script>
<script type="text/javascript" src="<spring:url value="/resources/js/jquery-ui.min.js" />"></script>
<script type="text/javascript" src="<spring:url value="/resources/js/bootstrap.min.js" />"></script>
  <script>
  $(function() {
	    $( "#startDate" ).datepicker();
	  });
  $(function() {
    $( "#endDate" ).datepicker();
  });
  </script>
</head>
<body>
	<jsp:include page="../views/fragments/menu.jsp"></jsp:include>
	<div class="container">	
	<h2>Add New Project</h2>
	<spring:url value="/projects/save" var="formUrl" />

		<form:form modelAttribute="project"  method="POST" action="${formUrl}" class="col-md-8 col-md-offset-2">
							
				<div class="form-group">
					<label for="label">Name : </label>
					<form:input class="form-control" id="label"  path="label"/>
				</div>
			
				<div class="form-group">				
					<label for="startDate">Start Date :</label>
					<form:input id="startDate" path="startDate"/>
				</div>
				
				<div class="form-group">				
					<label for="endDate">End Date :</label> 			
					<form:input id="endDate"  path="endDate"/>
				</div>
  
		 		<div class="form-group">
					<label for="amount">Amount : </label>
					<form:input class="form-control" id="amount"  path="amount"/>
				</div>

 				<div class="form-group">
					<label for="collected">Collected : </label>
					<form:input class="form-control" id="collected"  path="collected"/>
				</div>

				<div class="form-group">
					<label for="photos">Photos : </label>
					<form:input  id="photos" type="file" accept="image/*"  path=""/>
				</div>


				<button class="btn btn-success" type="submit">Add New Project</button>
		
		</form:form>
	
	</div>
</body>
</html>


