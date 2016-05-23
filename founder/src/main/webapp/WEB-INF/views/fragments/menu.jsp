<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<nav class="navbar navbar-inverse">
		<div class="container-fluid">
		
			<div class="navbar-header">
      			<a class="navbar-brand" href="#">Founder - Crowdfounding Projects</a>
    		</div>
    		
    		<ul class="nav navbar-nav">
 
    			<li><a href="<spring:url value="/login"/>">Login</a></li>   			
    				<li><a href="<spring:url value="/addklient"/>">Register</a></li>
  
  			<li class="dropdown">
          			
          			<a href="#" class="dropdown-toggle" 
          				data-toggle="dropdown" role="button" 
          				aria-expanded="false">Projects<span class="caret"></span></a>
          	
          			<ul class="dropdown-menu" role="menu">
          			<li><a href="<spring:url value="/projects"/>">All Projects</a></li>
            			<li><a href="<spring:url value="/projects/add"/>">Add Project</a></li>
            			<li><a href="<spring:url value="/myprojects"/>">Your Projects</a></li>
          			</ul>
          			
        		</li>
    		    		
    			<li class="dropdown">
          			
          			<a href="#" class="dropdown-toggle" 
          				data-toggle="dropdown" role="button" 
          				aria-expanded="false">Your Account<span class="caret"></span></a>
          	
          			<ul class="dropdown-menu" role="menu">
            			<li><a href="<spring:url value="/login"/>">Login</a></li>
            			<li><a href="<spring:url value="/newklient"/>">Register</a></li>
          			</ul>
          			
        		</li>
        		
        		
        			
    		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="#"><span class="glyphicon glyphicon-user"></span>
					Sign Up</a></li>
			<li><a href="#"><span class="glyphicon glyphicon-log-in"></span>
					Login</a></li>
		</ul>
	</div>
</nav>