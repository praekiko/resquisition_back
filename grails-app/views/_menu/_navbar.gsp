<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <a class="navbar-brand" href="${createLink(uri: '/')}"><span class="label label-primary">CoE</span> Requisition</a>
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        %{-- <li class="active"><a href="#">Link</a></li> --}%
          %{-- <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
            <li><g:link controller="${c.logicalPropertyName}">${c.name}</g:link></li>
          </g:each> --}%
        <sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_USER'>
          <li><a href="${createLink(uri: '/transaction')}">ข้อมูลการเบิก</a></li>
          <li><a href="${createLink(uri: '/item')}">ข้อมูลอุปกรณ์</a></li>
          
        </sec:ifAnyGranted>

        <sec:ifAnyGranted roles='ROLE_ADMIN'>
          <li><a href="${createLink(uri: '/user')}">ข้อมูล User</a></li>
          <li><a href="${createLink(uri: '/transactionItemShips')}">Graph</a></li>
          <li><a href="${createLink(uri: '/mobile')}">Mobile</a></li>
        </sec:ifAnyGranted>
        
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
        

        %{-- <li><a href="${createLink(uri: '/logout')}" class="btn btn-default">Logout</a></li> --}%
        <sec:ifLoggedIn>
            <g:link controller="logout" class="btn btn-default navbar-btn">Logout</g:link>
        </sec:ifLoggedIn>
        
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>