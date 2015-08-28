<%--
  Created by IntelliJ IDEA.
  User: ttnd
  Date: 18/8/15
  Time: 4:20 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Link Sharing :: Home</title>
    <meta name="layout" content="master">
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-5 col-md-offset-3">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <text>Login</text>
                        </div>

                        <div class="panel-body">
                            <form class="form-horizontal" action="${createLink(uri: '/j_spring_security_check')}"s>
                                <div class="form-group">
                                    <label for="emailInput" class="col-sm-5 control-label">Email/Username</label>

                                    <div class="col-sm-7">
                                        <input type="text" class="form-control" name='j_username' id="emailInput" placeholder="Email">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="passwordInput" class="col-sm-5 control-label">Password</label>

                                    <div class="col-sm-7">
                                        <input type="password" class="form-control" name='j_password' id="passwordInput" required="true"
                                               placeholder="Password">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <a class="col-sm-offset-3 control-label">Forgot password</a>

                                    <div class="col-sm-offset-8 col-sm-4">
                                        <button type="submit" class="btn btn-xs btn-default btn-block"
                                                id="">Submit</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br/>
</div>
</body>
</html>