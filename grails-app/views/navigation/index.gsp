    <div class="topbar">
      <div class="fill">
        <div class="container">
          <a class="brand" href="${createLink(uri:'/')}">Timelog</a>
          <ul class="nav">
            <li class="${pageProperty(name:'meta.menu')=='Home'?'active':''}"><a href="${createLink(controller:'home')}">Home</a></li>
            <sec:ifLoggedIn>
                <li class="dropdown ${pageProperty(name:'meta.menu')=='My Projects'?'active':''}" data-dropdown="dropdown">
                    <a href="${createLink(controller:'project')}" class="dropdown-toggle">My Projects</a>
                    <ul class="dropdown-menu">
                        <g:if test="${!projects}">
                            <li>&nbsp;No projects defined</li>
                        </g:if>
                        <g:each in="${projects}" var="p">
                            <li><a href="${createLink(controller:'project',action:'show',id:p.id)}">${p.name}</a></li>
                        </g:each>
                        <sec:ifAllGranted roles="ROLE_ADMIN">
                            <li class="divider"></li>
                            <li><a href="${createLink(controller:'project',action:'create')}">New Project</a></li>
                            <li><a href="${createLink(controller:'project')}">Show All</a></li>
                        </sec:ifAllGranted>
                    </ul>
                </li>
            </sec:ifLoggedIn>
          </ul>
          <sec:ifNotLoggedIn>
            <form id="loginForm" action="${request.contextPath}/j_spring_security_check" method="POST" class="pull-right">
                <input class="input-small" type="text" placeholder="Username" name="j_username">
                <input class="input-small" type="password" placeholder="Password" name="j_password">
                <button class="btn small" type="submit">Sign in</button>
            </form>
          </sec:ifNotLoggedIn>
          <sec:ifLoggedIn>
             <form action="${request.contextPath}/logout" class="pull-right">
                <span style="color:#ddd"><sec:loggedInUserInfo field="username"/>&nbsp;&nbsp;&nbsp;</span>
                <button class="btn small" type="submit">Sign out</button>
            </form>
          </sec:ifLoggedIn>
        </div>
      </div>
    </div>
