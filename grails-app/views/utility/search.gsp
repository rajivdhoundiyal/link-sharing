<%--
  Created by IntelliJ IDEA.
  User: ttnd
  Date: 24/8/15
  Time: 11:04 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Link Sharing :: Search</title>
    <meta name="layout" content="master">
</head>

<body>

<div class="container">
    <div class="row">
        <div class="col-md-4">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <g:render template="/topic/topPosts" model="[showDateDropDown: false]"/>
                    </div>
                </div>
                %{--TRENDING TOPICS--}%
                <div class="row">
                    <div class="col-md-4">
                        <g:render template="/topic/trendingTopic"/>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-8">
            <div class="container">
                <div class="row">
                    %{--INBOX--}%
                    <div class="col-md-8">
                        <g:render template="/subscription/posts" model="[title: 'Inbox', showSearchInput: false]"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

</body>
</html>