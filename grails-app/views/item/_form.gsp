<%@ page import="com.softdev.Item" %>



<div class="fieldcontain form-inline ${hasErrors(bean: itemInstance, field: 'title', 'error')} required">
	<label for="title" class="col-sm-2 control-label">
		<g:message code="item.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" class="form-control" required="" value="${itemInstance?.title}"/>

</div>

<div class="fieldcontain form-inline ${hasErrors(bean: itemInstance, field: 'barcode', 'error')} required">
	<label for="barcode" class="col-sm-2 control-label">
		<g:message code="item.barcode.label" default="Barcode" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="barcode" class="form-control" required="" value="${itemInstance?.barcode}"/>

</div>

<div class="fieldcontain form-inline ${hasErrors(bean: itemInstance, field: 'remaining', 'error')} required">
	<label for="remaining" class="col-sm-2 control-label">
		<g:message code="item.remaining.label" default="Remaining" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="remaining" class="form-control" type="number" value="${itemInstance.remaining}" required=""/>

</div>

<div class="fieldcontain form-inline ${hasErrors(bean: itemInstance, field: 'description', 'error')} required">
	<label for="description" class="col-sm-2 control-label">
		<g:message code="item.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" class="form-control" cols="40" rows="5" maxlength="5000" required="" value="${itemInstance?.description}"/>

</div>

<div class="fieldcontain form-inline ${hasErrors(bean: itemInstance, field: 'transactionItemShips', 'error')} ">
	<label for="transactionItemShips" class="col-sm-2 control-label">
		<g:message code="item.transactionItemShips.label" default="Transaction Item Ships" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${itemInstance?.transactionItemShips?}" var="t">
    <li><g:link controller="transactionItemShips" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="transactionItemShips" action="create" params="['item.id': itemInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'transactionItemShips.label', default: 'TransactionItemShips')])}</g:link>
</li>
</ul>


</div>
