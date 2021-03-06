
<%@ page import="com.softdev.User" %>
<%@ page import="com.softdev.UserRole" %>
<%@ page import="com.softdev.Role" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		%{-- <a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div> --}%
		<div id="show-user" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			%{-- button to go Home and New --}%
			<div class="btn-group" role="group" aria-label="...">
			  <ul class="pager">
			  	<li><a class="home btn" href="${createLink(uri: '/')}"><span aria-hidden="true">&laquo;</span> <g:message code="default.home.label"/></a></li>
				<li><g:link class="list btn" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create btn" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			  </ul>
			</div>
			%{-- <ol class="property-list user"> --}%
			<div class="col-lg-8 col-lg-offset-2" >
			<ul class="list-group">
			
				<g:if test="${userInstance?.barcode}">
				<li class="fieldcontain list-group-item">
					<span id="barcode-label" class="property-label"><g:message code="user.barcode.label" default="Barcode" /></span>
					
						<span class="property-value pull-right" aria-labelledby="barcode-label"><g:fieldValue bean="${userInstance}" field="barcode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.username}">
				<li class="fieldcontain list-group-item">
					<span id="username-label" class="property-label"><g:message code="user.username.label" default="Username" /></span>
					
						<span class="property-value pull-right" aria-labelledby="username-label"><g:fieldValue bean="${userInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.password}">
				<li class="fieldcontain list-group-item">
					<span id="password-label" class="property-label"><g:message code="user.password.label" default="Password" /></span>
					
						<span class="property-value pull-right" aria-labelledby="password-label"><g:fieldValue bean="${userInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.name}">
				<li class="fieldcontain list-group-item">
					<span id="name-label" class="property-label"><g:message code="user.name.label" default="Name" /></span>
					
						<span class="property-value pull-right" aria-labelledby="name-label"><g:fieldValue bean="${userInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.telNum}">
				<li class="fieldcontain list-group-item">
					<span id="telNum-label" class="property-label"><g:message code="user.telNum.label" default="Tel Num" /></span>
					
						<span class="property-value pull-right" aria-labelledby="telNum-label"><g:fieldValue bean="${userInstance}" field="telNum"/></span>
					
				</li>
				</g:if>
				%{-- ${userInstance.barcode}
				${com.softdev.UserRole.list().user.barcode}  --}%
				<li class="fieldcontain list-group-item">
					<span id="type-label" class="property-label">Role</span>
					
						<span class="property-value pull-right show-userRole" aria-labelledby="type-label">
							
						%{-- ${com.softdev.UserRole.list().findAll{it.user.id == 10}.role}--}%
						</span>

					
				</li>
				<g:javascript>
					var currentUserId = ${userInstance.id};
					var userListFromUserRole = '${com.softdev.UserRole.list().user as grails.converters.JSON}';
					userListFromUserRole = jQuery.parseJSON( userListFromUserRole );

					var roleListFromUserRole = '${com.softdev.UserRole.list().role as grails.converters.JSON}';
					roleListFromUserRole = jQuery.parseJSON( roleListFromUserRole );
					for(var i = 0; i < userListFromUserRole.length; i++){
						console.log(userListFromUserRole[i].id);
						console.log(roleListFromUserRole[i].authority);
						if(currentUserId == userListFromUserRole[i].id){
							var role = roleListFromUserRole[i].authority;
							// console.log(role);
							$("span.show-userRole").html(role);
						}
					}
					


				</g:javascript>
				
				%{-- <g:each var="userRole" in="${com.softdev.UserRole.list()}">
					<g:if test="${userRole.user.barcode} == ${userInstance.barcode}">
						${userRole.user.barcode}
					</g:if>
				</g:each> --}%
				%{-- <g:if test="${userInstance?.type}">
				<li class="fieldcontain list-group-item">
					<span id="type-label" class="property-label"><g:message code="user.type.label" default="Type" /></span>
					
						<span class="property-value pull-right" aria-labelledby="type-label"><g:link controller="userRole" action="show" id="${userInstance?.type?.id}">${userInstance?.type?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if> --}%
				<g:if test="${userInstance?.accountExpired}">
				<li class="fieldcontain list-group-item">
					<span id="accountExpired-label" class="property-label"><g:message code="user.accountExpired.label" default="Account Expired" /></span>
					
						<span class="property-value pull-right" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${userInstance?.accountExpired}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.accountLocked}">
				<li class="fieldcontain list-group-item">
					<span id="accountLocked-label" class="property-label"><g:message code="user.accountLocked.label" default="Account Locked" /></span>
					
						<span class="property-value pull-right" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${userInstance?.accountLocked}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.enabled}">
				<li class="fieldcontain list-group-item">
					<span id="enabled-label" class="property-label"><g:message code="user.enabled.label" default="Enabled" /></span>
					
						<span class="property-value pull-right" aria-labelledby="enabled-label"><g:formatBoolean boolean="${userInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.passwordExpired}">
				<li class="fieldcontain list-group-item">
					<span id="passwordExpired-label" class="property-label"><g:message code="user.passwordExpired.label" default="Password Expired" /></span>
					
						<span class="property-value pull-right" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${userInstance?.passwordExpired}" /></span>
					
				</li>
				</g:if>
			
			%{-- </ol> --}%
			<br>
			<g:form url="[resource:userInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit btn btn-warning" action="edit" resource="${userInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
