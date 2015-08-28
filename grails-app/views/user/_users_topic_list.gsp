<div class="panel panel-default">
    <div class="panel-heading">
        <text>${title}</text>
    </div>

    <div class="panel-body">
        <g:each in="${users}" var="user">
            <div class="row">
                <div class="col-xs-3 col-sm-3">
                    <a href="${createLink(controller: 'user', action: 'showProfile')}?username=${user.username}">
                        <div class="photo img-thumbnail glyphicon glyphicon-user" aria-hidden="true"></div></a>
                </div>

                <div class="col-xs-8 col-sm-8">
                    <div class="row">

                        <div class="col-xs-9 col-sm-9">
                            <h3>${user.firstName} ${user.lastName}</h3>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xs-4 col-sm-4">
                            <text>@${user.username}</text>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xs-4 col-sm-4">
                            <text>Subscription</text>
                        </div>

                        <div class="col-xs-4 col-sm-4">
                            <text>Topic</text>
                        </div>
                    </div>

                    <div class="row">

                        <div class="col-xs-4 col-sm-4">
                            <text>${com.ttnd.linksharing.model.Subscription.countByUser(user)}</text>
                        </div>

                        <div class="col-xs-4 col-sm-4">
                            <text>${com.ttnd.linksharing.model.Topic.countByCreatedBy(user)}</text>
                        </div>
                    </div>
                </div>
            </div>
        </g:each>
    </div>
</div>