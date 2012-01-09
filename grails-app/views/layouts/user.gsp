
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Timelog</title>
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le styles -->
    <link rel="stylesheet" href="${resource(dir:'css',file:'bootstrap.css')}" />
    <style type="text/css">
      /* Override some defaults */
      html, body {
        background-color: #eee;
      }
      body {
        padding-top: 40px; /* 40px to make the container go all the way to the bottom of the topbar */
      }
      .container > footer p {
        text-align: center; /* center align it with the container */
      }
      .container {
        width: 820px; /* downsize our container to make the content feel a bit tighter and more cohesive. NOTE: this removes two full columns from the grid, meaning you only go to 14 columns and not 16. */
      }

      /* The white background content wrapper */
      .content {
        background-color: #fff;
        padding: 20px;
        margin: 0 -20px; /* negative indent the amount of the padding to maintain the grid system */
        -webkit-border-radius: 0 0 6px 6px;
           -moz-border-radius: 0 0 6px 6px;
                border-radius: 0 0 6px 6px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.15);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.15);
                box-shadow: 0 1px 2px rgba(0,0,0,.15);
      }

      /* Page header tweaks */
      .page-header {
        background-color: #f5f5f5;
        padding: 20px 20px 10px;
        margin: -20px -20px 20px;
      }

      /* Styles you shouldn't keep as they are for displaying this base example only */
      .content .span10,
      .content .span4 {
        min-height: 500px;
      }
      /* Give a quick and non-cross-browser friendly divider */
      .content .span4 {
        margin-left: 0;
        padding-left: 19px;
        border-left: 1px solid #eee;
      }

      .topbar .btn {
        border: 0;
      }

    </style>

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="images/favicon.ico">
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="images/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="images/apple-touch-icon-114x114.png">
    <style>
        ul.entries {list-style-type:none;padding:0.5em}
        ul.entries span.header {display:block;background:#888;color:#fff;padding-left:0.5em;padding-bottom:0.25em}
        ul.entries li {border:1px solid #888;margin-top:0.5em;}
        ul.entries span.duration {float:right;padding-right:0.5em}
        ul.entries span.description {display:block;padding-left:0.5em;color:#333}
        ul.entries span.links {display:block;text-align:right;padding-right:0.5em;}
    </style>
    <g:layoutHead/>
        <r:layoutResources />
  </head>

  <body>

    <div class="topbar">
      <div class="fill">
        <div class="container">
          <a class="brand" href="${createLink(uri:'/')}">Timelog</a>
          <ul class="nav">
            <li class="active"><a href="${createLink(controller:'home')}">Home</a></li>
          </ul>
          <sec:ifNotLoggedIn>
            <form id="loginForm" action="${request.contextPath}/j_spring_security_check" method="POST" class="pull-right">
                <input class="input-small" type="text" placeholder="Username" name="j_username">
                <input class="input-small" type="password" placeholder="Password" name="j_password">
                <button class="btn" type="submit">Sign in</button>
            </form>
          </sec:ifNotLoggedIn>
          <sec:ifLoggedIn>                        
             <form action="${request.contextPath}/logout" class="pull-right">
                <span style="color:#ddd"><sec:loggedInUserInfo field="username"/>&nbsp;&nbsp;&nbsp;</span>
                <button class="btn" type="submit">Sign out</button>
            </form>
          </sec:ifLoggedIn>
        </div>
      </div>
    </div>

    <div class="container">

      <div class="content">
        <g:layoutBody />        
      </div>

      <footer>
        <p>&copy; jessie.evangelista at gmail dot com 2011</p>
      </footer>

    </div> <!-- /container -->

  </body>
</html>

