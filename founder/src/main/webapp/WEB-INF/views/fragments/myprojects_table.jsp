<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<div class="container">
		<h2>Current Projects</h2>
		<table class="table table-hover">
			<tbody>
				<tr>
					<th>Name</th>
					<th>Progress</th>
					<th>Amount</th>
					<th>Collected</th>
					<th>Starts</th>
					<th>Ends</th>
					
				</tr>
				<c:forEach items="${myprojects}" var="project">
					<tr>
						<td>
							<a href="<spring:url value="/myprojects/${project.id}"/>">${project.label}</a>
						</td>
						<td>
							${project.progress} %
						</td>
						<td>
							${project.amount}
						</td>
						
						<td>
							${project.collected}	
						</td>
						
						<td>
							<fmt:formatDate value="${project.startDate}" var="startDate" pattern="dd/MM/yyyy" />
							${startDate} 
						</td>
						
						<td>
							<fmt:formatDate value="${project.endDate}" var="endDate" pattern="dd/MM/yyyy" />
							${endDate} 
						</td>
					
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>