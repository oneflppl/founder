<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Founder - Project</title>
<link rel="stylesheet"
	href="<spring:url value="/resources/css/bootstrap.min.css"/>"></link>
<script type="text/javascript"
	src="<spring:url value="/resources/js/jquery-1.12.3.min.js" />"></script>
<script type="text/javascript"
	src="<spring:url value="/resources/js/bootstrap.min.js" />"></script>
</head>
<body>
	<jsp:include page="../views/fragments/menu.jsp"></jsp:include>
	<div class="container">

		<div class="row">

			<div class="panel panel-primary">
				<div class="panel-heading">


					<div style="text-align: center;">
						<h2>${daily.title}</h2>
						<div style="text-align: center;">${daily.createdDate}</div>						
						<a href="<spring:url value="/projects/${daily.project.id}"/>"><button type="button" class="btn btn-info">Calendar</button></a>
					</div>


							
					




				</div>
				<div class="panel-body">						
					<ul class="list-group">
						
						<li class="list-group-item">
							<div style="text-align:center;" class="progress">
								${daily.dsc}
							</div>
						</li>
						
						<li class="list-group-item">						
										<spring:url value="/resources/img" var="img" />

										<div class="row">
											<c:forEach items="${daily.images}" var="photo"
												varStatus="i">
												<div class="col-md-4">
													<a href="${img}/${photo.id}${photo.path}" class="thumbnail"> 
													<img
														src="${img}/${photo.id}${photo.path}" alt="Pulpit Rock"
														style="width: 150px; height: 150px">
													</a>									
												</div>
												
											</c:forEach>											
										</div>
						</li>
							<li class="list-group-item">	
									<div>									
										<ul class="list-group">
											<c:forEach items="${daily.videos}" var="video">
												<li class="list-group-item"><div  style="text-align:center;" >${video.dsc}</div>
															<div style="text-align:center;">
													<iframe  width="455" height="256"
														src="${video.path}"> </iframe>
												</div>
												</li>
											</c:forEach>											
										</ul>
									</div>
						</li>
						
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
						