<div class="list-group">
	%{-- <a href="${createLink(controller: 'Assignment', action: 'index')}"class="list-group-item">
		<h4 class="list-group-item-heading">Assignments/Questions</h4>
		<div class="list-group-item-text">Assignment</div>
		<div class="list-group-item-text">Question Sets</div>
		<div class="list-group-item-text">Questions</div>
	</a> --}%
	<div class="jumbotron">
	  <h1>Welcome</h1> 
	  %{-- <sec:username/> --}%
	  <p><span class="label label-primary">CoE</span> Requisition</p>
	  <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
        <li><g:link controller="${c.logicalPropertyName}">${c.name}</g:link></li>
      </g:each>
	</div>

	

</div>
