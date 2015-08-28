<%@ page import="com.ttnd.linksharing.model.LinkResource" %>
%{--INBOX--}%
<div class="panel panel-default">
    <div class="panel-heading">
        <text>${title}</text>

        <g:if test="${showSearchInput}">
            <div class="pull-right search-input-panel-div">
                <div>
                    <div class="input-group icon-addon addon-sm">
                        <input type="text" class="form-control" id="inboxSearch" placeholder="search" value="${search}">
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
        <g:each in="${resources}" var="resource">
            <div class="row">
                <div class="col-xs-2 col-sm-2">
                    <a href="${createLink(controller: 'user', action: 'showProfile')}?username=${resource.createdBy.username}"><div
                            class="photo img-thumbnail glyphicon glyphicon-user" aria-hidden="true"></div></a>
                </div>

                <div class="col-xs-10 col-sm-10">
                    <div class="row">
                        <div class="col-xs-9 col-sm-9">
                            <text>${resource.createdBy.firstName}</text> <text
                                class="text-muted">@${resource.createdBy.username}</text> <g:formatDate
                                format="yyyy-MM-dd" date="${resource.dateCreated}"/>
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
                        <div class="col-xs-6 col-sm-6">
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
                            <a href="https://twitter.com/share" class="twitter-share-button">Tweet</a>
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
                            <script src="https://apis.google.com/js/platform.js" async defer></script>

                            <!-- Place this tag where you want the +1 button to render. -->
                            <div class="g-plusone" data-size="medium" data-annotation="none"></div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-offset-4 col-xs-9 col-sm-9">
                        <g:if test="${resource instanceof com.ttnd.linksharing.model.DocumentResource}">
                            <div class="col-xs-2 col-sm-2">
                                <a href="${resource.filePath}"><text>Download</text>
                                </a>
                            </div>

                        </g:if>
                        <g:else>
                            <div class="col-xs-3 col-sm-3">
                                <a href="${resource.url}" target="_blank"><text>View full site</text>
                                </a>
                            </div>
                        </g:else>

                        <div class="col-xs-3 col-sm-3">
                            <g:remoteLink update="updatePostDiv" controller="resource" action="${action}"
                                          params="[resourceId: resource.id, topicName: topicName]"><text>Mark as read</text>
                            </g:remoteLink>
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
