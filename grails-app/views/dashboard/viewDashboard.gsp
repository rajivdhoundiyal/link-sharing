<%--
  Created by IntelliJ IDEA.
  User: ttnd
  Date: 19/8/15
  Time: 6:16 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Link Sharing :: Dashboard</title>
    <meta name="layout" content="master">
</head>

<body>

<div class="container">
    <div class="row">
        <div class="col-md-5">
            <div class="row">
                <g:render template="/user/userTemplate"/>
            </div>
            %{--SUBSCRIPTION--}%
            <div class="row">
                <div id="updateDashboardSubscription">
                    <g:render template="/subscription/dashboardSubscription"></g:render>
                </div>

            </div>

            %{--TRENDING TOPICS--}%
            <div class="row">
                <g:render template="/topic/trendingTopic"
                          model="[title: 'Trending topics', trendingTopics: trendingTopics]"/>
            </div>
        </div>
        %{--INBOX--}%
        <div class="container col-md-7">
            <div id="updatePostDiv">
                <g:render template="/subscription/posts"
                          model="[title: 'Inbox', showSearchInput: true, action: 'markAsRead']"/>
            </div>
        </div>
    </div>
</div>

</body>
</html>