<%--
  Created by IntelliJ IDEA.
  User: ttnd
  Date: 24/8/15
  Time: 11:14 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Link Sharing :: Topics</title>
    <meta name="layout" content="master">
</head>

<body>

<div class="container">
    <div class="row">
        %{--TOPICS--}%
        <div class="row">
            <g:render template="/topic/trendingTopic" model='[title: /Posts :: "/ + topic.name + /"/, showSearchInput: true, subscriptions: subscription]' />
        </div>
    </div>
    %{--INBOX--}%
    <div class="container col-md-7">
    <g:render template="/subscription/posts" model='[title: /Posts :: "/ + topic.name + /"/, showSearchInput: true]' />
    </div>
</div>
</div>

</body>
</html>