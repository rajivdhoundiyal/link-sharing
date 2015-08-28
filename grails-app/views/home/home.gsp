<%--
  Created by IntelliJ IDEA.
  User: ttnd
  Date: 17/8/15
  Time: 4:15 PM
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
        <div class="col-md-7">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <text>Recent Shares</text>
                        </div>

                        <div class="panel-body">
                            <g:each in="${recentShares}" var="resource">
                                <div class="row">
                                    <div class="col-xs-2 col-sm-2">
                                        <a href="${createLink(controller: 'user', action: 'showProfile')}?username=${resource.createdBy.username}">
                                            <div class="photo img-thumbnail glyphicon glyphicon-user"
                                             aria-hidden="true"></div></a>
                                    </div>

                                    <div class="col-xs-10 col-sm-10">
                                        <div class="row">

                                            <div class="col-xs-9 col-sm-9">
                                                <text>${resource.createdBy.firstName} ${resource.createdBy.lastName}</text> <text
                                                    class="text-muted">@${resource.createdBy.username}</text>
                                            </div>

                                            <div class="col-xs-3 col-sm-3">
                                                <a href="${createLink(action: 'topic', controller: 'topic')}?name=${resource.topic.name}"><text>${resource.topic.name}</text>
                                                </a>
                                            </div>
                                        </div>

                                        <div class="row">

                                            <div class="col-xs-12 col-sm-12">
                                                <text>${resource.description}</text>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-xs-9 col-sm-9">
                                                <div id="fb-root"></div>
                                                <script>(function (d, s, id) {
                                                    var js, fjs = d.getElementsByTagName(s)[0];
                                                    if (d.getElementById(id)) return;
                                                    js = d.createElement(s);
                                                    js.id = id;
                                                    js.src = "//connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.4";
                                                    fjs.parentNode.insertBefore(js, fjs);
                                                }(document, 'script', 'facebook-jssdk'));</script>

                                                <div class="fb-like"
                                                     data-href="https://developers.facebook.com/docs/plugins/"
                                                     data-layout="button" data-action="like" data-show-faces="true"
                                                     data-share="true"></div>
                                                <a href="https://twitter.com/share"
                                                   class="twitter-share-button">Tweet</a>
                                                <script>!function (d, s, id) {
                                                    var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https';
                                                    if (!d.getElementById(id)) {
                                                        js = d.createElement(s);
                                                        js.id = id;
                                                        js.src = p + '://platform.twitter.com/widgets.js';
                                                        fjs.parentNode.insertBefore(js, fjs);
                                                    }
                                                }(document, 'script', 'twitter-wjs');</script>
                                                <!-- Place this tag in your head or just before your close body tag. -->
                                                <script src="https://apis.google.com/js/platform.js" async
                                                        defer></script>

                                                <!-- Place this tag where you want the +1 button to render. -->
                                                <div class="g-plusone" data-size="medium" data-annotation="none"></div>
                                            </div>

                                            <div class="col-xs-3 col-sm-3">
                                                <a href="${createLink(action: 'viewPost', controller: 'resource')}?postId=${resource.id}"><text>View Post</text>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <br/>
                            </g:each>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-12">
                    <div id="topPostDiv">
                        <g:render template="/topic/topPosts" model="[showDateDropDown: true]"/>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-5">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <text>Login</text>
                        </div>

                        <div class="panel-body">
                            <form class="form-horizontal" action="${createLink(uri: '/j_spring_security_check')}"
                                  method="POST">
                                <div class="form-group">
                                    <label for="emailInput" class="col-sm-5 control-label">Email/Username</label>

                                    <div class="col-sm-7">
                                        <input type="text" class="form-control" name="j_username" id="emailInput"
                                               placeholder="Email" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="passwordInput" class="col-sm-5 control-label">Password</label>

                                    <div class="col-sm-7">
                                        <input type="password" class="form-control" name='j_password' id="passwordInput"
                                               required="true"
                                               placeholder="Password">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="row">
                                    <div class="col-sm-offset-3 col-sm-5">
                                        <a class="col-sm-offset-3 control-label">Forgot password</a>
                                    </div>

                                    <div class="col-sm-3">
                                        <button type="submit" class="btn btn-xs btn-default btn-block"
                                                id="">Submit</button>
                                    </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <text>Register</text>
                        </div>

                        <div class="panel-body">

                            <g:uploadForm action="registerUser" controller="user" class="form-horizontal">
                                <div class="form-group">
                                    <label for="firstName" class="col-sm-5 control-label">First Name</label>

                                    <div class="col-sm-7">
                                        <input type="text" class="form-control" id="firstName" name="firstName"
                                               placeholder="First Name" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="lastName" class="col-sm-5 control-label">Last Name</label>

                                    <div class="col-sm-7">
                                        <input type="text" class="form-control" id="lastName" name="lastName"
                                               placeholder="Last Name" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="email" class="col-sm-5 control-label">Email</label>

                                    <div class="col-sm-7">
                                        <input type="email" class="form-control" id="email" name="email"
                                               placeholder="Email" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="username" class="col-sm-5 control-label">Username</label>

                                    <div class="col-sm-7">
                                        <input type="text" class="form-control" id="username" name="username"
                                               placeholder="Username" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="password" class="col-sm-5 control-label">Password</label>

                                    <div class="col-sm-7">
                                        <input type="password" class="form-control" id="password" name="password"
                                               required="true"
                                               placeholder="Password">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="confirmPasswordInput"
                                           class="col-sm-5 control-label">Confirm password</label>

                                    <div class="col-sm-7">
                                        <input type="password" class="form-control" id="confirmPasswordInput"
                                               name="confirmPassword"
                                               required="true"
                                               placeholder="Confirm Password">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="photo" class="col-sm-5 control-label">Photo</label>

                                    <div class="col-sm-7">
                                        <input type="file" id="photo" name="photo">

                                        <p class="help-block">Upload your photo here.</p>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-offset-8 col-sm-4">
                                        <button type="submit" class="btn btn-xs btn-default btn-block"
                                                id="submit">Register</button>
                                    </div>
                                </div>
                            </g:uploadForm>
                            <g:hasErrors bean="${flash.user}">
                                <ul>
                                    <g:eachError var="err" bean="${flash.user}">
                                        <li><g:message error="${err}"/></li>
                                    </g:eachError>
                                </ul>
                            </g:hasErrors>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>