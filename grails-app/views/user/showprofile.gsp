<%--
  Created by IntelliJ IDEA.
  User: ttnd
  Date: 23/8/15
  Time: 8:10 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Link Sharing :: Profile</title>
    <meta name="layout" content="master">
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-md-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-5">
                        <g:render template="/user/userTemplate"/>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-5">
                        <g:render template="/topic/trendingTopic" model='[title: "Topics", showSearchInput: true]'/>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-7">
            <div class="container">
                <div class="row">
                    <div class="col-md-7">
                        <g:render template="/subscription/posts" model="[title: 'Posts', resources: resources, showSearchInput: true]"/>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
</body>
</html>