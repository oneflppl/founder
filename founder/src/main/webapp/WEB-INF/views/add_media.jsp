<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<spring:url value="/myprojects/${mydaily.project.id}/media/save" var="formUrl" />
<div class="col-md-8 col-md-offset-2" >
		<form:form modelAttribute="mydaily"  method="POST" action="${formUrl}">
							
				<div class="form-group">
					<label for="title">Title : </label>
					<form:input class="form-control" id="title"  path="title"/>
				</div>
				
			<div class="form-group">
				<label for="dsc">Description : </label>
				<form:textarea id="dsc" class="form-control" rows="10" path="dsc" />
			</div>

			<button class="btn btn-success" type="submit">Save Changes</button>
		
		</form:form>
		<div>
								<h2>PHOTOS</h2>
							<spring:url value="/myprojects/dailys/${mydaily.id}/upload/photo" var="formFile" />
							<div>
								<form  enctype="multipart/form-data" method="POST"
									action="${formFile}">
									<table>

										<tr><td>
											<label for="photou">Upload File : </label>										
											<input id='photou' type="file" name="file" /></td>
										</tr>
										<!-- <tr><td>File to upload:</td><td><input type="file" name="file" /></td></tr> -->
									</table>

									<button class="btn btn-success" type="submit">Add Photo</button>

								</form>
							</div>

	
						
				
							</div>

							<div class="form-group">
								
								<div>
								
										<spring:url value="/resources/img" var="img" />

										<div class="row">
											<c:forEach items="${mydaily.images}" var="photo"
												varStatus="i">
												<div class="col-md-4">
													<a href="${img}/${photo.id}${photo.path}" class="thumbnail"> 
													<img
														src="${img}/${photo.id}${photo.path}" alt="Pulpit Rock"
														style="width: 150px; height: 150px">
													</a>
													<div style="text-align:center">
													<a href="<spring:url value="/myprojects/dailys/delete/photo/${photo.id}"/>"><button type="button" class="btn btn-danger btn-xs">Remove</button></a>
													</div>
												</div>
												
											</c:forEach>
											
										</div>

											
								</div>
									<div>
											<h2>VIDEOS</h2> 
								<spring:url value="/myprojects/dailys/${mydaily.id}/upload/video" var="formVideo" />
			
											<form:form modelAttribute="myvideo" method="post"
												action="${formVideo}">
										
												<div class="form-group">
													<label for="path">YouTube Id : </label>
													<form:input class="form-control" id="path" path="path" />
												</div>
			
												<div class="form-group">
													<label id="descript" for="path">Description : </label>
													<form:input class="form-control" id="descript" path="dsc" />
												</div>
			
												<button class="btn btn-success" type="submit">Add Video</button>
			
											</form:form>
											<jsp:include page="../views/fragments/myvideos_table.jsp"></jsp:include>
										</div>

						</div>
	
		
	</div>
	</div>
</body>
</html>


