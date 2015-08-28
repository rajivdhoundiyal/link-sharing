<div class="panel panel-default">
    <div class="panel-heading">
        <text>Top Posts</text>

        <g:if test="${showDateDropDown}">
            <div class="pull-right">
                <div class="dropdown">
                    <div class="btn-group">
                        <input type="text" id="topPostsPeriod"
                               class="btn btn-info btn-xs" style="text-align: left" name="topPostForPeriod"
                               value="${period == null ? 'Today' : period}" readonly/>
                        <button type="button" id="topPostsTimeCaret" class="btn btn-info btn-xs dropdown-toggle"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="caret"></span>
                            <span class="sr-only">Toggle Dropdown</span>
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="topPostsPeriod">
                            <li><a href="#">Today</a></li>
                            <li><a href="#">1 week</a></li>
                            <li><a href="#">1 month</a></li>
                            <li><a href="#">1 year</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </g:if>
    </div>

    <div class="panel-body">
        <g:each in="${topPosts}" var="resource">
            <div class="row">
                <div class="col-xs-2 col-sm-2">
                    <a href="${createLink(controller: 'user', action: 'showProfile')}?username=${resource.createdBy.username}"><div
                            class="photo img-thumbnail glyphicon glyphicon-user"
                            aria-hidden="true"></div></a>
                </div>

                <div class="col-xs-10 col-sm-10">
                    <div class="row">

                        <div class="col-xs-9 col-sm-9">
                            <text>${resource.createdBy.firstName} ${resource.createdBy.lastName}</text> <text
                                class="text-muted">@${resource.createdBy.username}</text>
                        </div>

                        <div class="col-xs-3 col-sm-3">
                            <a href="${createLink(action: 'topic', controller: 'topic')}"><text>${resource.topic.name}</text>
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