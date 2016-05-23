<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
          <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

		<table class="table table-hover">
			<tbody>
				<tr>
					<th>URL</th>
					<th>Description</th>
					<th>Is Daily</th>
					<th>Remove</th>
					
				</tr>
				<c:forEach items="${mydaily.videos}" var="video">
					<tr>
					
					<td>
							<a href="${video.path}" >${video.path}</a>
						</td>
						<td>
							${video.dsc}
						</td>
						<td>
							${video.daily.createdDate}
						</td>
					
						<td>
						
							<a href="<spring:url value="/myprojects/dailys/delete/video/${video.id}"/>"><button class="btn btn-danger btn-xs">Remove</button></a>
						</td>					
					
					</tr>
				</c:forEach>
			</tbody>
		</table>
