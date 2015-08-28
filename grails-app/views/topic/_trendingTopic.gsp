<div class="panel panel-default">
    <div class="panel-heading">
        <text>${title}</text>
        <g:if test="${showSearchInput}">
            <div class="pull-right search-input-panel-div">
                <div>
                    <div class="input-group icon-addon addon-sm">
                        <input type="text" class="form-control" id="inboxSearch" placeholder="search">
                        <label for="inboxSearch" class="glyphicon glyphicon-search" rel="tooltip"
                               title="search"></label>
                        <label for="inboxSearch" class="glyphicon glyphicon-remove" rel="tooltip"
                               title="search"></label>
                    </div>
                </div>
            </div>
        </g:if>
    </div>

    <div class="panel-body">
        <g:each in="${trendingTopics}" var="topic">
            <div class="row">
                <div class="col-xs-3 col-sm-3">
                    <a href="${createLink(controller: 'user', action: 'showProfile')}?username=${topic.createdBy.username}"><div
                            class="photo img-thumbnail glyphicon glyphicon-user" aria-hidden="true"></div></a>
                </div>

                <div class="col-xs-8 col-sm-8">
                    <div class="row">

                        <div class="col-xs-9 col-sm-9">
                            <a href="${createLink(action: 'topic', controller: 'topic')}?name=${topic.name}"><text>${topic.name}</text>
                            </a>
                        </div>

                    </div>

                    <div class="row">

                        <div class="col-xs-4 col-sm-4">
                            <text>@<text
                                    class="muted">${topic.createdBy.username}</text></text>
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
                            <g:set var="subscribed"
                                   value="${com.ttnd.linksharing.model.Subscription.findByTopic(topic)}"/>
                            <g:if test="${subscribed == null}">
                                <text><a href="#">Subscribe</a></text>
                            </g:if>
                            <g:else>
                                <text><a href="#">Unsubscribe</a></text>
                            </g:else>
                        </div>

                        <div class="col-xs-4 col-sm-4">
                            <text>${com.ttnd.linksharing.model.Subscription.countByTopic(topic)}</text>
                        </div>

                        <div class="col-xs-4 col-sm-4">
                            <text>${com.ttnd.linksharing.model.Resource.countByTopic(topic)}</text>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xs-5 col-sm-5 nopadding">
                            <div class="dropdown">
                                <div class="btn-group">
                                    <input type="text" id="trendingTopicSeriousness"
                                           class="btn btn-default btn-xs"
                                           style="text-align: left; width: 82px"
                                           value="${subscribed == null ? 'Serious' : subscribed.seriousness.getSeriousness()}"
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

                        <g:set var="isUserAdminOrCreatedTopic"
                               value="${topic.createdBy.id.toString() == sec.loggedInUserInfo(field: 'id').toString() || sec.access(expression: "hasRole('ROLE_ADMIN')")}"/>

                        <g:if test="${isUserAdminOrCreatedTopic}">
                            <div class="col-xs-4 col-sm-4 nopadding">
                                <div class="dropdown">
                                    <div class="btn-group">
                                        <input type="text" id="trendingTopicVisibility"
                                               class="btn btn-default btn-xs"
                                               style="text-align: left; width: 50px"
                                               value="${topic.visibility.getVisibility()}"
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
                            <div class="glyphicon glyphicon-envelope toolbar-div"
                                 style="font-size: 22px" aria-hidden="true" data-topicname="${topic.name}"
                                 data-toggle="modal" data-target="#sendInvitationModal"></div>
                        </div>

                        <g:if test="${isUserAdminOrCreatedTopic}">
                            <div class="col-xs-1 col-sm-1 nopadding">
                                <div class="icon-document" style="font-size: 22px"></div>
                            </div>

                            <div class="col-xs-1 col-sm-1 nopadding">
                                <div class="icon-delete" style="font-size: 22px"></div>
                            </div>
                        </g:if>
                    </div>

                </div>
            </div>
        </g:each>
    </div>
    <br/>

</div>