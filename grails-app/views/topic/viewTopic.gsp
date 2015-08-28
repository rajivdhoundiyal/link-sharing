<%--
  Created by IntelliJ IDEA.
  User: ttnd
  Date: 18/8/15
  Time: 11:37 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Link Sharing :: Show Topic</title>
    <meta name="layout" content="master">
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-md-4">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <text>Topic :: "${topic.name}"</text>
                            </div>

                            <div class="panel-body">
                                %{--<g:each in="${recentShares}" var="resource">--}%
                                <div class="row">
                                    <div class="col-xs-3 col-sm-3">
                                        <a href="${createLink(controller: 'user', action: 'showProfile')}?username=${topic.createdBy.username}"><div class="photo img-thumbnail glyphicon glyphicon-user"
                                             aria-hidden="true"></div></a>
                                    </div>

                                    <div class="col-xs-8 col-sm-8">
                                        <div class="row">

                                            <div class="col-xs-9 col-sm-9">
                                                <a href="${createLink(action: 'topic', controller: 'topic')}?name=${topic.name}"><text>${topic.name}</text>
                                                </a> <text
                                                    class="muted">(${topic.visibility})</text>
                                            </div>

                                        </div>

                                        <div class="row">
                                            <div class="col-xs-4 col-sm-4">
                                                <text>@${topic.createdBy.username}</text>
                                            </div>

                                            <div class="col-xs-4 col-sm-4">
                                                <text>Subscription</text>
                                            </div>

                                            <div class="col-xs-4 col-sm-4">
                                                <text>Post</text>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-xs-4 col-sm-4">
                                                <a href="${createLink(action: 'topic', controller: 'topic')}"><text>Subscribe</text>
                                                </a>
                                            </div>

                                            <div class="col-xs-4 col-sm-4">
                                                <text>${com.ttnd.linksharing.model.Subscription.countByUser(topic.createdBy)}</text>
                                            </div>

                                            <div class="col-xs-4 col-sm-4">
                                                <text>${com.ttnd.linksharing.model.Topic.countByCreatedBy(topic.createdBy)}</text>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-offset-2 col-xs-7 col-sm-7">
                                                <div class="dropdown">
                                                    <div class="btn-group">
                                                        <input type="text" id="subscriptionSeriousness"
                                                               class="btn btn-default btn-xs"
                                                               style="text-align: left; width: 75px" value="Serious"
                                                               name="shareLinkFor" readonly/>
                                                        <button type="button" class="btn btn-default btn-xs dropdown-toggle"
                                                                data-toggle="dropdown" aria-haspopup="true"
                                                                aria-expanded="false">
                                                            <span class="caret"></span>
                                                            <span class="sr-only">Toggle Dropdown</span>
                                                        </button>
                                                        <ul class="dropdown-menu"
                                                            aria-labelledby="trendingTopicSeriousness">
                                                            <li><a href="#">Serious</a></li>
                                                            <li><a href="#">Very Serious</a></li>
                                                            <li><a href="#">Casual</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-1 col-sm-1">
                                                <div class="icon-invitation" aria-hidden="true" data-toggle="modal"
                                                     data-target="#sendInvitationModal"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            %{--</g:each>--}%
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <g:render template="/user/users_topic_list" model='[title: /Users :: "/ + topic.name + /"/]'/>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-8">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <div id="updatePostDiv">
                            <g:render template="/subscription/posts"
                                      model='[title: /Topic :: "/ + topic.name + /"/, showSearchInput: true, action: "markAsReadForTopic", topicName: topic.name]'/>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

</body>
</html>