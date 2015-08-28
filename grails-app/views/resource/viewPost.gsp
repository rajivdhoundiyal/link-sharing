<%--
  Created by IntelliJ IDEA.
  User: ttnd
  Date: 24/8/15
  Time: 12:39 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Link Sharing :: View Post</title>
    <meta name="layout" content="master">
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-md-7">
            <div class="container">
                <div class="row">
                    <div class="col-md-7">
                        <div class="panel panel-default">

                            <div class="panel-body">
                                <div class="row">

                                    <div class="col-xs-2 col-sm-2">
                                        <a href="${createLink(controller: 'user', action: 'showProfile')}?username=${resource.createdBy.username}"><div
                                                class="photo img-thumbnail glyphicon glyphicon-user"
                                                aria-hidden="true"></div></a>
                                    </div>

                                    <div class="col-xs-10 col-sm-10">
                                        <div class="row">

                                            <div class="col-xs-2 col-sm-2">
                                                <div class="row">
                                                    <text>${resource.createdBy.firstName} ${resource.createdBy.lastName}</text>
                                                </div>

                                                <div class="row"><text
                                                        class="text-muted">@${resource.createdBy.username}</text>
                                                </div>
                                            </div>

                                            <div class="col-md-offset-6 col-xs-3 col-sm-3">
                                                <div class="row">
                                                    <div class="pull-right">
                                                        <a href="${createLink(action: 'topic', controller: 'topic')}?name=${resource.topic.name}"><text>${resource.topic.name}</text>
                                                        </a>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="pull-right">
                                                        <g:formatDate
                                                                format="HH:MM dd MMM yyyy"
                                                                date="${resource.dateCreated}"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-xs-12">
                                                <g:hiddenField name="resourceId" id="resourceId" value="${resource.id}" />
                                                <g:hiddenField name="resourceRating" id="resourceRating" value="${resourceRating.score}"/>

                                                <div class="rating-select pull-right">
                                                    <div class="btn btn-md rating-deselected" id="1"><span
                                                            class="glyphicon glyphicon-heart"></span></div>

                                                    <div class="btn btn-md rating-deselected" id="2"><span
                                                            class="glyphicon glyphicon-heart"></span></div>

                                                    <div class="btn btn-md rating-deselected" id="3"><span
                                                            class="glyphicon glyphicon-heart"></span></div>

                                                    <div class="btn btn-md rating-deselected" id="4"><span
                                                            class="glyphicon glyphicon-heart"></span></div>

                                                    <div class="btn btn-md rating-deselected" id="5"><span
                                                            class="glyphicon glyphicon-heart"></span></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <br/>

                                <div class="row">
                                    <div class="col-xs-12 col-sm-12">

                                        <div class="row">

                                            <div class="col-xs-12 col-sm-12">
                                                <text>${resource.description}</text>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <br/>

                                <div class="row">
                                    <div class="col-xs-12 col-sm-12">
                                        <div class="row-fluid">
                                            <div class="col-xs-5 col-sm-5">

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

                                            <div class="col-sm-offset-3 col-xs-4 col-sm-4">
                                                %{--<div class="col-xs-2 col-sm-2">--}%
                                                <g:remoteLink update="updatePostDiv" controller="resource"
                                                              action="${action}"
                                                              params="[resourceId: resource.id, topicName: topicName]"><text>Delete</text>
                                                </g:remoteLink>
                                            %{--</div>--}%

                                            %{--<div class="col-xs-1 col-sm-1">--}%
                                                <a href="${createLink(action: 'viewPost', controller: 'resource')}?postId=${resource.id}"><text>Edit</text>
                                                </a>
                                            %{--</div>--}%

                                                <g:if test="${resource instanceof com.ttnd.linksharing.model.DocumentResource}">
                                                %{--<div class="col-xs-2 col-sm-2">--}%
                                                    <a href="${resource.filePath}"><text>Download</text>
                                                    </a>
                                                %{--</div>--}%
                                                </g:if>
                                                <g:else>
                                                %{--<div class="col-xs-4 col-sm-4">--}%
                                                    <a href="${resource.url}"
                                                       target="_blank"><text>View full site</text>
                                                    </a>
                                                %{--</div>--}%
                                                </g:else>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-5">
                        <g:render template="/topic/trendingTopic"
                                  model='[title: "Trending topics", showSearchInput: true]'/>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

</body>
</html>