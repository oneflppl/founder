<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
          <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

		<table class="table table-hover">
			<tbody>
				<tr>
					<th>Title</th>
					<th>Date</th>		
					<th>Edit</th>	
					<th>Remove</th>
				</tr>
				<c:forEach items="${myproject.dailys}" var="daily">
					<tr>
						<td>
							<a href="<spring:url value="/daily/${daily.id}"/>">${daily.title}</a>
						</td>
						<td>
							${daily.createdDate} 
						</td>						
						<td>
						
							<a href="<spring:url value="/myprojects/dailys/${daily.id}/edit"/>"><button class="btn btn-info">Add Media/Edit</button></a>
						</td>		
						
						<td>
						
							<a href="<spring:url value="/mydaily/delete/${daily.id}"/>"><button class="btn btn-danger">Remove</button></a>
						</td>	
					</tr>
				</c:forEach>
			</tbody>
		</table>
