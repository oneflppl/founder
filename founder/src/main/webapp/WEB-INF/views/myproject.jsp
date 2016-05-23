<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Founder - Your Project</title>
<link rel="stylesheet"
	href="<spring:url value="/resources/css/bootstrap.min.css"/>"></link>
<link rel="stylesheet"
	href="<spring:url value="/resources/css/jquery-ui.css"/>"></link>
<script type="text/javascript"
	src="<spring:url value="/resources/js/jquery-1.12.3.min.js" />"></script>
<script type="text/javascript"
	src="<spring:url value="/resources/js/jquery-ui.min.js" />"></script>
<script type="text/javascript"
	src="<spring:url value="/resources/js/bootstrap.min.js" />"></script>
<script>
	$(function() {
		$("#startDate").datepicker();
	});
	$(function() {
		$("#endDate").datepicker();
	});
	
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
				<div class="panel-heading" style="text-align:center;"><h4><span>${myproject.label}</span> </h4></div>
				<div class="panel-body">

					<ul class="nav nav-pills nav-justified">
						<li class="active"><a data-toggle="tab" href="#edit">Edit</a></li>
						<li><a data-toggle="tab" href="#daily">Daily</a></li>
						<li><a data-toggle="tab" href="#photos">Photos</a></li>
						<li><a data-toggle="tab" href="#videos">Videos</a></li>
						<li><a data-toggle="tab" href="#donations">Donations</a></li>
						<li><a data-toggle="tab" href="#info">Info</a></li>
					</ul>

					<div class="tab-content">
						<div id="edit" class="tab-pane fade in active">
							
							<div>
								<spring:url value="/myprojects/edit" var="formUrl" />

								<form:form modelAttribute="myproject" method="post"
									action="${formUrl}" class="col-md-8 col-md-offset-2">

									<div class="form-group">
										<form:hidden id="id" cssClass="form-control" path="id" />
									</div>

									<div class="form-group">
										<label for="label">Name : </label>
										<form:input class="form-control" id="label" path="label" />
									</div>

									<fmt:formatDate value="${myproject.endDate}" var="dateF"
										pattern="dd/MM/yyyy" />
									<div class="form-group">
										<label for="endDate">End Date :</label>
										<form:input id="endDate" value="${dateF}" path="endDate" />
									</div>

									<div class="form-group">
										<label for="amount">Amount : </label>
										<form:input class="form-control" id="amount" path="amount" />
									</div>


									<div class="form-group">
										<label for="dsc">Description : </label>
										<form:textarea id="dsc" class="form-control" rows="10"
											path="dsc" />
									</div>

									<button class="btn btn-success" type="submit">Save
										Changes</button>

								</form:form>
							</div>


						</div>
						<div id="daily" class="tab-pane fade">
							
							<div style="text-align: center;">
								<a href="<spring:url value="/myprojects/${myproject.id}/dailys/add" />"><button class="btn btn-success btn-lg" type="submit">Create New Daily</button></a>
						
							</div>
							
						
							<div>
										<jsp:include page="../views/fragments/mydailys_table.jsp"></jsp:include>									
									</div>
						</div>
						
						<div id="photos" class="tab-pane fade">
							
							<spring:url value="/myprojects/${myproject.id}/upload/photo" var="formFile" />
							<div class="form-group">
								<form enctype="multipart/form-data" method="POST"
									action="${formFile}">
									<table>

										<tr>
											<td>File to upload:</td>
											<td><input type="file" name="file" /></td>
										</tr>
										<!-- <tr><td>File to upload:</td><td><input type="file" name="file" /></td></tr> -->
									</table>

									<button class="btn btn-success" type="submit">Add Photo</button>

								</form>
							</div>


							<div class="form-group">
								
									<div>
									
										<spring:url value="/resources/img" var="img" />

										<div class="row">
											<c:forEach items="${myproject.images}" var="photo"
												varStatus="i">
												<div class="col-md-4">
													<a href="${img}/${photo.id}${photo.path}" class="thumbnail"> 
													<img
														src="${img}/${photo.id}${photo.path}" alt="Pulpit Rock"
														style="width: 150px; height: 150px">
													</a>
													<div style="text-align:center">
													<a href="<spring:url value="/myprojects/delete/photo/${photo.id}"/>"><button type="button" class="btn btn-danger btn-xs">Remove</button></a>
													</div>
												</div>
												
											</c:forEach>
											
										</div>



									</div>
								</div>

						</div>
						<div id="videos" class="tab-pane fade">
														
								<div>
								<spring:url value="/myprojects/${myproject.id}/upload/video" var="formVideo" />

								<form:form modelAttribute="video" method="post"
									action="${formVideo}" class="col-md-8 col-md-offset-2">
							
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
							</div>
								
									
										<jsp:include page="../views/fragments/videos_table.jsp"></jsp:include>

									
						
						
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
									<c:forEach items="${myproject.donations}" var="donation">
										<tr>

											<td>${donation.amount}</td>
											<td>${donation.dsc}</td>
											<td><a
												href="<spring:url value="/users/${myproject.id}"/>">${donation.donator.login}</a>
											</td>


										</tr>
									</c:forEach>
								</tbody>
							</table>



							</p>

						</div>
						<div id="info" class="tab-pane fade">
							<h3>Info</h3>
							<p>
							<div style="width: 100%" class="progress">

								<div class="progress-bar" role="progressbar"
									aria-valuenow="${myproject.progress}" aria-valuemin="0"
									aria-valuemax="100" style="width: ${myproject.progress}%">${myproject.progress}
									%</div>
							</div>

							<ul class="list-group">
								<fmt:formatDate value="${myproject.endDate}" var="startDate"
									pattern="dd/MM/yyyy" />
								<fmt:formatDate value="${myproject.startDate}" var="endDate"
									pattern="dd/MM/yyyy" />
								<li class="list-group-item">Start Date: <span>${startDate}</span>
								</li>
								<li class="list-group-item">End Date: <span>
										${endDate}</span>
								</li>
								<li class="list-group-item">

									<ul class="list-group">
										<li class="list-group-item">Amount :
											<div class="progress">
												<div class="progress-bar progress-bar-info"
													role="progressbar" aria-valuenow="${myproject.amount}"
													aria-valuemin="0" aria-valuemax="100"
													style="width: ${(myproject.amount/myproject.amount)*100}%">${myproject.amount}
													$</div>
											</div>
											<div></div>
										</li>

										<li class="list-group-item">Collected :
											<div class="progress">
												<div class="progress-bar progress-bar-success"
													role="progressbar" aria-valuenow="${myproject.collected}"
													aria-valuemin="0" aria-valuemax="100"
													style="width: ${(myproject.collected/myproject.amount)*100}%">${myproject.collected}
													$</div>
											</div>
											<div></div>
										</li>

										<li class="list-group-item">Need :
											<div class="progress">
												<div class="progress-bar progress-bar-danger"
													role="progressbar"
													aria-valuenow="${myproject.amount-myproject.collected}"
													aria-valuemin="0" aria-valuemax="100"
													style="width: ${((myproject.amount-myproject.collected)/myproject.amount)*100}%">${myproject.amount-myproject.collected}
													$</div>
											</div>
											<div></div>
										</li>


										<!--  <li class="list-group-item">Collected : <span class="label label-success">${myproject.collected}</span></li>						
						<li class="list-group-item">Need: <span class="label label-danger">${myproject.amount-myproject.collected}</span></li>-->

									</ul>




									</p>
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


