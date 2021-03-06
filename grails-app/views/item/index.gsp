
<%@ page import="com.softdev.Item" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'item.label', default: 'Item')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		%{-- <a href="#list-item" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div> --}%
		<div id="list-item" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>

			%{-- button to go Home and New --}%
			<div class="btn-group" role="group" aria-label="...">
			  <ul class="pager">
				<li><a class="home btn" href="${createLink(uri: '/')}"><span aria-hidden="true">&laquo;</span> <g:message code="default.home.label"/></a></li>
				<li><g:link class="create btn" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			  </ul>		  

			</div>


			<g:form class="form-inline pull-right" method="POST">
			  <g:select id="item" name="itemBarcode" from="${com.softdev.Item.list()}" optionKey="barcode" value="${transactionItemShipsInstance?.item?.id}" class="many-to-one form-control chosen-select" noSelection="['' :'Search']" value="${params.long("itemBarcode")}"/>
			  <g:actionSubmit value="Search" action="index" class="btn btn-primary "/>
				%{-- <g:link class="btn btn-warning" action="index" params="[item.barcode: '']">
			       	Clear
			    </g:link> --}%
			  </g:form>
			  %{-- ${params} --}%
			
			<script type="text/javascript">
			 	$(".chosen-select").chosen({
			 		allow_single_deselect: true,
					display_selected_options:false,
					search_contains : true,
			 		no_results_text: "Oops, nothing found!"}); 
			</script>
			<table class="table table-striped table-hover">
			<thead>
					<tr>
					
						<g:sortableColumn property="barcode" title="${message(code: 'item.barcode.label', default: 'Barcode')}" />
					
						<g:sortableColumn property="title" title="${message(code: 'item.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="unit" title="${message(code: 'item.unit.label', default: 'Unit')}" />
					
						<g:sortableColumn property="remaining" title="${message(code: 'item.remaining.label', default: 'Remaining')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'item.description.label', default: 'Description')}" />

						<th><g:message code="Delete" default="Delete" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${itemInstanceList}" status="i" var="itemInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${itemInstance.id}">${fieldValue(bean: itemInstance, field: "barcode")}</g:link></td>
					
						<td>${fieldValue(bean: itemInstance, field: "title")}</td>
					
						<td>${fieldValue(bean: itemInstance, field: "unit")}</td>
					
						<td>${fieldValue(bean: itemInstance, field: "remaining")}</td>
					
						<td>${fieldValue(bean: itemInstance, field: "description")}</td>

						<td><g:form controller="item" action="delete" id="${itemInstance.id}" method="DELETE">
							%{-- ${itemInstance} --}%
							<fieldset class="buttons">								
								<g:actionSubmit class="delete btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
							</fieldset>
						</g:form></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			%{-- <div class="pagination">
				<g:paginate total="${itemInstanceCount ?: 0}" />
			</div> --}%
			<div align="center">
				<nav>
					<ul class="pagination">
						<li>							
					    </li>
						<li><g:paginate next="&raquo;" prev="&laquo;" total="${itemInstanceCount ?: 0}" /></li>
						<li>
					    </li>
					</ul>
				</nav>
			</div>
		</div>
	</body>
</html>
