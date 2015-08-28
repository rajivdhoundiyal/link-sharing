<div class="panel panel-default">
    <div class="panel-heading">
        <text>Subscription</text>

        <div class="pull-right">
            <a href="${createLink(controller: 'subscription', action: 'viewAll')}"><text>View All</text>
            </a>
        </div>
    </div>

    <div class="panel-body">
        <g:each in="${subscriptions}" var="subscription">
            <div class="row">
                <div class="col-xs-3 col-sm-3">
                    <a href="${createLink(controller: 'user', action: 'showProfile')}?username=${subscription.topic.createdBy.username}">
                        <div class="photo img-thumbnail glyphicon glyphicon-user"
                             aria-hidden="true"></div></a>
                </div>

                <div class="col-xs-8 col-sm-8">
                    <div class="row">

                        <div class="col-xs-9 col-sm-9">
                            <a href="${createLink(action: 'topic', controller: 'topic')}?name=${subscription.topic.name}"><text>${subscription.topic.name}</text>
                            </a>
                        </div>

                    </div>

                    <div class="row">

                        <div class="col-xs-4 col-sm-4">
                            <text>@<text
                                    class="muted">${subscription.topic.createdBy.username}</text></text>
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
                            <text><a href="#">Unsubscribe</a></text>
                        </div>

                        <div class="col-xs-4 col-sm-4">
                            <text>${com.ttnd.linksharing.model.Subscription.countByTopic(subscription.topic)}</text>
                        </div>

                        <div class="col-xs-4 col-sm-4">
                            <text>${com.ttnd.linksharing.model.Resource.countByTopic(subscription.topic)}</text>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xs-5 col-sm-5 nopadding">
                            <div class="dropdown">
                                <div class="btn-group">
                                    <input type="text" id="subscriptionSeriousness"
                                           class="btn btn-default btn-xs"
                                           style="text-align: left; width: 82px" value="${subscription.seriousness.getSeriousness()}"
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

                        <g:set var="isUserAdminOrCreatedTopic" value="${subscription.topic.createdBy.id.toString() == sec.loggedInUserInfo(field: 'id').toString() || sec.access(expression: "hasRole('ROLE_ADMIN')")}"/>
                        <g:if test="${isUserAdminOrCreatedTopic}">
                            <div class="col-xs-3 col-sm-3 nopadding">
                                <div class="dropdown">
                                    <div class="btn-group">
                                        <input type="text" id="subscriptionVisibility"
                                               class="btn btn-default btn-xs"
                                               style="text-align: left; width: 50px" value="${subscription.topic.visibility.getVisibility()}"
                                               name="shareLinkFor" readonly/>
                                        <button type="button" class="btn btn-default btn-xs dropdown-toggle"
                                                data-toggle="dropdown" aria-haspopup="true"
                                                aria-expanded="false">
                                            <span class="caret"></span>
                                            <span class="sr-only">Toggle Dropdown</span>
                                        </button>
                                        <ul class="dropdown-menu" aria-labelledby="trendingTopicVisibility">
                                            <li><a href="#">Public</a></li>
                                            <li><a href="#">Private</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </g:if>

                        <div class="col-xs-1 col-sm-1 nopadding">
                            <a href="#"
                               data-toggle="modal" data-target="#sendInvitationModal"><div class="icon-invitation"
                                 style="font-size: 22px" aria-hidden="true"></div></a>
                        </div>

                        <g:if test="${isUserAdminOrCreatedTopic}">
                            <div class="col-xs-1 col-sm-1 nopadding">
                                <div class="icon-document" style="font-size: 22px"></div>
                            </div>

                            <div class="col-xs-1 col-sm-1 nopadding">
                                <g:hiddenField name="subscriptionId" id="subscriptionId" value="${subscription.id}" />
                                <a href="${createLink(controller: "subscription", action: 'deleteSubscription')}?id=${subscription.id}" id="subscriptionDelete"><div class="icon-delete" style="font-size: 22px"></div></a>
                            </div>

                        </g:if>
                    </div>
                </div>
            </div>
        </g:each>
    </div>
    <br/>

</div>