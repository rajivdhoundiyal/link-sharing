<%--
  Created by IntelliJ IDEA.
  User: ttnd
  Date: 23/8/15
  Time: 8:16 PM
--%>

<div class="panel panel-default">

    <div class="panel-body">
        %{--<g:each in="${recentShares}" var="resource">--}%
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
                        <text>@<text
                                class="muted">${user.username}</text></text>
                    </div>
                </div>

                <div class="row">

                    <div class="col-xs-4 col-sm-4">
                        <text>Subscriptions</text>
                    </div>

                    <div class="col-xs-4 col-sm-4">
                        <text>Topics</text>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-4 col-sm-4">
                        <a href="${createLink(controller: "subscription", action: "viewAll")}?userName=${user.username}" ><text>${com.ttnd.linksharing.model.Subscription.countByUser(user)}</text></a>
                    </div>

                    <div class="col-xs-4 col-sm-4">
                        <a href="${createLink(controller: "topic", action: "viewAll")}?userName=${user.username}"><text>${com.ttnd.linksharing.model.Topic.countByCreatedBy(user)}</text></a>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>