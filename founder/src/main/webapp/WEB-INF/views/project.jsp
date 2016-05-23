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
	<script type="text/javascript">
	$(function() { 
		  //for bootstrap 3 use 'shown.bs.tab' instead of 'shown' in the next line
		  $('a[data-toggle="tab"]').on('click', function (e) {
		    //save the latest tab; use cookies if you like 'em better:
		    localStorage.setItem('lastTab', $(e.target).attr('href'));
		  });

		  //go to the latest tab, if it exists:
		  var lastTab = localStorage.getItem('lastTab');

		  if (lastTab) {
		      $('a[href="'+lastTab+'"]').click();
		  }
		});
	
	</script>
</head>
<body>
	<jsp:include page="../views/fragments/menu.jsp"></jsp:include>
	<div class="container">
	
		<div class="row">
		
			<div class="panel panel-primary">
			<div class="panel-heading" style="text-align:center;"><h4><span>${project.label}</span> </h4></div>
    		  <div class="panel-body">
    		  		<div style="width: 100%" class="progress">

							<div class="progress-bar progress-bar-warning" role="progressbar"
								aria-valuenow="${project.progress}" aria-valuemin="0"
								aria-valuemax="100" style="width: ${project.progress}%">${project.progress}
								%</div>
						</div>
    		 	 <div>
    		 	  
    			  
			 	
				</div>
				
					<ul class="list-group">
					<li class="list-group-item"> Amount : ${project.amount}			
					<div  class="progress">
							<div class="progress-bar progress-bar-info" role="progressbar"
								aria-valuenow="${project.amount}" aria-valuemin="0"
								aria-valuemax="100" style="width: ${(project.amount/project.amount)*100}%">${project.amount}
								$</div>
						</div>
    		 		 <div>
    		 		 </div>					
					</li>
					
						<li class="list-group-item">Collected : ${project.collected}					
					<div  class="progress">
							<div class="progress-bar progress-bar-success" role="progressbar"
								aria-valuenow="${project.collected}" aria-valuemin="0"
								aria-valuemax="100" style="width: ${(project.collected/project.amount)*100}%">${project.collected}
								$</div>
						</div>
    		 		 <div>
    		 		 </div>					
					</li>
					
						<li class="list-group-item">Need : ${project.amount-project.collected} 					
					<div  class="progress">
							<div class="progress-bar progress-bar-danger" role="progressbar"
								aria-valuenow="${project.amount-project.collected}" aria-valuemin="0"
								aria-valuemax="100" style="width: ${((project.amount-project.collected)/project.amount)*100}%">${project.amount-project.collected}
								$</div>
						</div>
    		 		 <div>
    		 		 </div>					
					</li>
					
					
						<!--  <li class="list-group-item">Collected : <span class="label label-success">${project.collected}</span></li>						
						<li class="list-group-item">Need: <span class="label label-danger">${project.amount-project.collected}</span></li>-->
						<li class="list-group-item">
							<button class="btn btn-info" data-toggle="collapse"
								data-target="#slider">Donate!</button>
							<div id="slider" class="collapse">
								
								
						<div class="panel panel-primary">
							<div class="panel-heading"><span>Donation</span> </div>
				    		  <div class="panel-body">
									<spring:url value="/projects/${project.id}/donate" var="formUrl"></spring:url>
							<form:form modelAttribute="donation" method="POST" action="${formUrl}" class="col-md-8 col-md-offset-2">
									<div class="form-group">
										<label for="value">Value : </label>
										<form:input class="form-control" id="value" path="amount" />
									</div>

									<div class="form-group">
										<label for="dsc">Description : </label>
										<form:input class="form-control" id="dsc" path="dsc" />
									</div>
										<button class="btn btn-success" type="submit">Send Donation</button>
								</form:form>
								</div>
								
								</div>	
						
								
								</div>
					</li>
					</ul>
				
				
					
				
				
					<ul class="list-group">
						<fmt:formatDate value="${project.endDate}" var="startDate" pattern="dd/MM/yyyy" />
												<fmt:formatDate value="${project.startDate}" var="endDate" pattern="dd/MM/yyyy" />
						<li class="list-group-item">Start Date: <span>${startDate}</span> </li>
						<li class="list-group-item">End Date: <span>	${endDate}</span>  </li>
					<li class="list-group-item">


							<ul class="nav nav-pills nav-justified">
								<li class="active"><a data-toggle="tab" href="#description">Description</a></li>
									<li><a data-toggle="tab" href="#daily">Daily</a></li>
								<li><a data-toggle="tab" href="#photos">Photos</a></li>
								<li><a data-toggle="tab" href="#videos">Videos</a></li>
								<li><a data-toggle="tab" href="#donations">Donations</a></li>
								<li><a data-toggle="tab" href="#contact">Contact</a></li>
							</ul>
		
								<div class="tab-content">
								<div id="description" class="tab-pane fade in active">		
									<h3>Description</h3>
									<p>									
										<span>${project.dsc}</span>
									</p>
								</div>
								
								<div id="daily" class="tab-pane fade">
									<div>
										<jsp:include page="../views/fragments/dailys_table.jsp"></jsp:include>									
									</div>
								</div>
								
								
								
								
								
								
								
								
								<div id="photos" class="tab-pane fade">
									<h3>Photos</h3>
									<spring:url value="/resources/img" var="img" />
						
								
									<div id="myCarousel" class="carousel slide"
										data-ride="carousel">
										<!-- Indicators -->
										<ol class="carousel-indicators">
										<c:if test="${project.images.size() > 0}">
								 		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>			
									
											<c:forEach items="${project.images}" begin="1" var="photo" varStatus="i">
												<li data-target="#myCarousel" data-slide-to="${i.index}"></li>
											</c:forEach>
										</c:if>
																		
																			
										</ol>

										<!-- Wrapper for slides -->
										<div class="carousel-inner" role="listbox">
										
											
											<c:if test="${project.images.size() > 0}">
										
											<div class="item active">
												<img class="img-responsive center-block" src="${img}/${project.images.get(0).id}${project.images.get(0).path}" alt="Chania">
												<div class="carousel-caption">
													<h3>Chania</h3>
													<p>The atmosphere in Chania has a touch of Florence and
														Venice.</p>
												</div>
											</div>
												
											<c:forEach items="${project.images}" var="photo" begin="1" varStatus="i">			
											<div class="item">
												<img class="img-responsive center-block" src="${img}/${photo.id}${photo.path}" alt="Chania">
												<div class="carousel-caption">
													<h3>Chania</h3>
													<p>The atmosphere in Chania has a touch of Florence and
														Venice.</p>
												</div>
											</div>
											</c:forEach>
												
											</c:if>
								
									
										

										</div>

										<!-- Left and right controls -->
										<a class="left carousel-control" href="#myCarousel"
											role="button" data-slide="prev"> <span
											class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
											<span class="sr-only">Previous</span>
										</a> <a class="right carousel-control" href="#myCarousel"
											role="button" data-slide="next"> <span
											class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
											<span class="sr-only">Next</span>
										</a>
									</div>




								</div>
								
								<div id="videos" class="tab-pane fade">
									<h3>Videos</h3>
									
									<div>
									
										<ul class="list-group">

											<c:forEach items="${project.videos}" var="video">
												<li class="list-group-item"><div  style="text-align:center;" >${video.dsc}</div>
															<div style="text-align:center;">
													<iframe  width="920" height="540"
														src="${video.path}"> </iframe>
												</div>
												</li>
											</c:forEach>
											
										</ul>

									</div>

								</div>
								
								
								
								
								
								
								
									<div id="donations" class="tab-pane fade">
									<h3>Donations</h3>
									<p>
									
									<table class="table table-hover">
										<tbody>
											<tr>
												<th>Value</th>	
												<th>Description</th>
												<th>Donator</th>
											</tr>
											<c:forEach items="${project.donations}" var="donation">
												<tr>
													
													<td>${donation.amount}</td>
													<td>${donation.dsc}</td>
													<td><a
														href="<spring:url value="/users/${project.id}"/>">${donation.donator.login}</a>
													</td>
												

												</tr>
											</c:forEach>
										</tbody>
									</table>



								
									
								</div>
								<div id="contact" class="tab-pane fade">
									<h3>Contact</h3>
									<p>${project.creator.getLogin()}</p>
								</div>
							</div>



						</li>
					



					</ul>

				</div>




			


			</div>
			
		</div>

	</div>
</body>
</html>


