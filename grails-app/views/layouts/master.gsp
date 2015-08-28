<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Link Sharing</title>

    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    <!-- BOOTSTRAP MODAL -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-modal/2.2.6/css/bootstrap-modal.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-modal/2.2.6/js/bootstrap-modal.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-modal/2.2.6/js/bootstrap-modalmanager.min.js"></script>

    <!-- BOOTSTRAP HOVER  -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-hover-dropdown/2.0.10/bootstrap-hover-dropdown.min.js"></script>

    <link rel="stylesheet" href="<g:createLinkTo file='master.css' dir='css'/>">
    <g:layoutHead/>

</head>

<body>

%{-- CREATE TOPIC --}%
<div class="modal fade" role="dialog" id="createTopicModal" aria-labelledby="shareLinkLabel">
    <div class="modal-dialog" role="document">
        <g:formRemote class="form-horizontal" name="createTopicForm" url="[controller: 'topic', action: 'createTopic']"
                      update="createTopic" onSuccess="closeModal(this, createTopicModal)"
                      onFailure="onFailure(createTopicMessage, XMLHttpRequest.responseText)" method="POST">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Cancel"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="createTopicLabel">Create Topic</h4>
                </div>

                <div class="panel-body">
                    <div id="createTopicMessage"></div>

                    <div class="form-group">
                        <label for="createTopicInput" class="col-sm-5 control-label">Name</label>

                        <div class="col-sm-7">
                            <input type="text" class="form-control" name="name" id="createTopicInput"
                                   placeholder="Name" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="topicInputCreate" class="col-sm-5 control-label">Visibility</label>

                        <div class="col-sm-7">
                            <div class="dropdown">
                                <div class="btn-group">
                                    <input type="text" id="topicInputCreate"
                                           class="btn btn-default btn-sm" style="text-align: left" name="visibility"
                                           value="Public" readonly/>
                                    <button type="button" class="btn btn-default btn-sm dropdown-toggle"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span class="caret"></span>
                                        <span class="sr-only"></span>
                                    </button>
                                    <ul class="dropdown-menu" aria-labelledby="topicInputCreate">
                                        <li><a href="#">Public</a></li>
                                        <li><a href="#">Private</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="panel-footer">
                    <div class="form-group">
                        <div class="col-sm-offset-8 col-sm-2">
                            <button type="submit" class="btn btn-xs btn-default btn-block">Save</button>
                        </div>

                        <div class="col-sm-2">
                            <button type="button" class="btn btn-xs btn-default btn-block"
                                    data-dismiss="modal">Cancel</button>
                        </div>
                    </div>
                </div>
            </div>
        </g:formRemote>
    </div>
</div>
</div>

%{-- SEND INVITATION --}%
<div class="modal fade" role="dialog" id="sendInvitationModal" aria-labelledby="sendInvitationLabel">
    <div class="modal-dialog" role="document">
        <g:formRemote class="form-horizontal" name="sendInvitationForm"
                      url="[controller: 'utility', action: 'sendInvitation']"
                      update="sendInvitation" onSuccess="closeModal(this, sendInvitationModal)" method="POST">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Cancel"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="sendInvitationLabel">Send invitation</h4>
                </div>

                <div class="panel-body">
                    <div class="sendInvitation"></div>

                    <div class="form-group">
                        <label for="emailInput" class="col-sm-5 control-label">Email</label>

                        <div class="col-sm-7">
                            <input type="email" class="form-control" name="email" id="emailInput"
                                   placeholder="Email">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="topicInputSE" class="col-sm-5 control-label">Topic</label>

                        <div class="col-sm-7">
                            <div class="dropdown">
                                <div class="btn-group">
                                    <input type="text" id="topicInputSE"
                                           class="btn btn-default btn-sm" style="text-align: left" name="invitationFor"
                                           value="Topic" readonly/>
                                    <button type="button" class="btn btn-default btn-sm dropdown-toggle"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span class="caret"></span>
                                        <span class="sr-only">Toggle Dropdown</span>
                                    </button>
                                    <ul class="dropdown-menu" aria-labelledby="topicInputSE">
                                        <g:each in="${subscriptions}" var="subscription">
                                            <li><a href="#">${subscription.topic.name}</a></li>
                                        </g:each>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="panel-footer">
                    <div class="form-group">
                        <div class="col-sm-offset-8 col-sm-2">
                            <button type="submit" class="btn btn-xs btn-default btn-block">Invite</button>
                        </div>

                        <div class="col-sm-2">
                            <button type="button" class="btn btn-xs btn-default btn-block"
                                    data-dismiss="modal">Cancel</button>
                        </div>
                    </div>
                </div>
            </div>
        </g:formRemote>
    </div>
</div>
</div>

%{-- SHARE LINK --}%
<div class="modal fade" role="dialog" id="shareLinkModal" aria-labelledby="shareLinkLabel">
    <div class="modal-dialog" role="document">
        <g:formRemote class="form-horizontal" name="shareLinkForm" url="[controller: 'utility', action: 'shareLink']"
                      update="updatePostDiv" onSuccess="closeModal(this, shareLinkModal)" method="POST">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Cancel"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="shareLinkLabel">Share Link</h4>
                </div>

                <div class="panel-body">
                    <div class="shareLink"></div>

                    <div class="form-group">
                        <label for="linkInput" class="col-sm-5 control-label">Link</label>

                        <div class="col-sm-7">
                            <input type="text" class="form-control" name="link" id="linkInput"
                                   placeholder="Link">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="descriptionInput" class="col-sm-5 control-label">Description</label>

                        <div class="col-sm-7">
                            <textarea id="descriptionInput" name="description" class="form-control"
                                      placeholder="description"></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="topicInputSL" class="col-sm-5 control-label">Topic</label>

                        <div class="col-sm-7">
                            <div class="dropdown">
                                <div class="btn-group">
                                    <input type="text" id="topicInputSL"
                                           class="btn btn-default btn-sm" style="text-align: left" value="Topic"
                                           name="shareLinkFor" readonly/>
                                    <button type="button" class="btn btn-default btn-sm dropdown-toggle"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span class="caret"></span>
                                        <span class="sr-only">Toggle Dropdown</span>
                                    </button>
                                    <ul class="dropdown-menu" aria-labelledby="topicInputSL">
                                        <g:each in="${subscriptions}" var="subscription">
                                            <li><a href="#">${subscription.topic.name}</a></li>
                                        </g:each>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="panel-footer">
                    <div class="form-group">
                        <div class="col-sm-offset-8 col-sm-2">
                            <button type="submit" class="btn btn-xs btn-default btn-block">Share</button>
                        </div>

                        <div class="col-sm-2">
                            <button type="button" class="btn btn-xs btn-default btn-block"
                                    data-dismiss="modal">Cancel</button>
                        </div>
                    </div>
                </div>
            </div>
        </g:formRemote>
    </div>
</div>
</div>

%{-- SHARE DOCUMENT --}%
<div class="modal fade" role="dialog" id="shareDocumentModal" aria-labelledby="shareLinkLabel">

    <div class="modal-dialog" role="document">
        <g:form class="form-horizontal" name="shareDocumentForm">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Cancel"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="shareDocumentLabel">Share Document</h4>
                </div>

                <div class="panel-body">
                    <div class="shareDocument"></div>

                    <div class="form-group">
                        <label for="document" class="col-sm-5 control-label">Photo</label>

                        <div class="col-sm-7">
                            <input type="file" id="document" name="document">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="descriptionInput" class="col-sm-5 control-label">Description</label>

                        <div class="col-sm-7">
                            <textarea id="descriptionDocumentInput" name="description" class="form-control"
                                      placeholder="description"></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="topicInputShareDoc" class="col-sm-5 control-label">Topic</label>

                        <div class="col-sm-7">
                            <div class="dropdown">
                                <div class="btn-group">
                                    <input type="text" id="topicInputShareDoc"
                                           class="btn btn-default btn-sm" style="text-align: left" name="shareDocFor"
                                           value="Topic" readonly/>
                                    <button type="button" class="btn btn-default btn-sm dropdown-toggle"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span class="caret"></span>
                                        <span class="sr-only">Toggle Dropdown</span>
                                    </button>
                                    <ul class="dropdown-menu" aria-labelledby="topicInputShareDoc">
                                        <g:each in="${subscriptions}" var="subscription">
                                            <li><a href="#">${subscription.topic.name}</a></li>
                                        </g:each>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="panel-footer">
                    <div class="form-group">
                        <div class="col-sm-offset-8 col-sm-2">
                            <button type="button" id="uploadDocument"
                                    class="btn btn-xs btn-default btn-block">Share</button>
                        </div>

                        <div class="col-sm-2">
                            <button type="button" class="btn btn-xs btn-default btn-block"
                                    data-dismiss="modal">Cancel</button>
                        </div>
                    </div>
                </div>
                <script language="Javascript">
                    $('#uploadDocument').click(function () {
                                var oData = new FormData(document.forms.namedItem("shareDocumentForm"));
                                var url = "${createLink(controller:'utility',action:'shareDocument')}";
                                $.ajax({
                                    url: url,
                                    type: 'POST',
                                    data: oData,
                                    processData: false,  // tell jQuery not to process the data
                                    contentType: false,
                                    success: function (req) {
                                        $("#updatePostDiv").html(req)
                                        closeModal(this, shareDocumentModal)
                                    }
                                });

                            }
                    );
                </script>
            </div>
        </g:form>
    </div>
</div>
</div>

%{--<nav class="navbar navbar-inverse navbar-fixed-top">--}%
<div class="container outer-round-rectangle">
    <div class="container">
        <div class="row-fluid">
            <div class="col-xs-3 col-sm-3">
                <div>
                    <h3><sec:ifLoggedIn><g:link action="show"
                                                controller="dashboard">Link Sharing</g:link></sec:ifLoggedIn><sec:ifNotLoggedIn><g:link
                            action="home" controller="home">Link Sharing</g:link></sec:ifNotLoggedIn></h3>
                </div>
            </div>

            <div class="col-xs-1 col-sm-1">

            </div>

            <sec:ifNotLoggedIn>
                <g:if test="${showToolbar != true}">
                    <div class="col-xs-5 col-sm-5">

                    </div>
                </g:if>
            </sec:ifNotLoggedIn>
            <sec:ifLoggedIn>
                <g:if test="${showToolbar != true}">
                    <div class="col-xs-4 col-sm-4">

                    </div>
                </g:if>
            </sec:ifLoggedIn>
            <div class="col-xs-3 col-sm-3">
                <div class="search-input-div">
                    <div class="input-group icon-addon addon-sm">
                        <input type="text" class="form-control" name="masterSearch" id="masterSearch"
                               placeholder="search">
                        <label for="masterSearch" class="glyphicon glyphicon-search" rel="tooltip"
                               title="search"></label>
                        <label for="masterSearch" class="glyphicon glyphicon-remove" rel="tooltip"
                               title="search"></label>
                    </div>
                </div>
            </div>
            <sec:ifLoggedIn>
                <g:if test="${showToolbar == true}">
                    <div class="${showToolbar ? 'visible' : 'hidden'}">
                        <div class="col-xs-1 col-sm-1 toolbar-div">
                            <div class="icon-topic" aria-hidden="true" data-toggle="modal"
                                 data-target="#createTopicModal"></div>
                        </div>

                        <div class="col-xs-1 col-sm-1 toolbar-div">
                            <div class="icon-invitation" aria-hidden="true" data-toggle="modal"
                                 data-target="#sendInvitationModal"></div>
                        </div>

                        <div class="col-xs-1 col-sm-1 toolbar-div">
                            <div class="icon-link" aria-hidden="true" data-toggle="modal"
                                 data-target="#shareLinkModal"></div>
                        </div>

                        <div class="col-xs-1 col-sm-1 toolbar-div">
                            <div class="icon-document" aria-hidden="true" data-toggle="modal"
                                 data-target="#shareDocumentModal"></div>
                        </div>
                    </div>
                </g:if>

                <div class="col-xs-1 col-sm-1 user-toolbar-div">
                    <div class="dropdown">
                        <a id="masterMenu" data-target="#"
                           data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true">
                            <div class="glyphicon glyphicon-user" aria-hidden="true"><sec:username/><span
                                    class="caret"></span></div>

                        </a>
                        <ul class="dropdown-menu" aria-labelledby="masterMenu">
                            <li><a href="${createLink(controller: "user", action: "showProfile")}?username=<sec:username/>">Profile</a>
                            </li>
                            <sec:access expression="hasRole('ROLE_ADMIN')">
                                <li><a href="#">Users</a></li>
                                <li><g:link controller="topic" action="show">Topics</g:link></li>
                                <li><a href="#">Posts</a></li>
                            </sec:access>
                            <li role="separator" class="divider"></li>
                            <li><g:link
                                    controller='logout'>Logout</g:link></li>
                        </ul>
                    </div>
                </div>
            </sec:ifLoggedIn>
        </div>
    </div>
</div>
</div>
</div>
<g:layoutBody/>
%{--</nav>--}%
</body>

<script type="text/javascript">

    function closeModal(val, modal) {
        $(modal).modal('hide')
    }

    function onFailure(divMessageId, message) {
        $(divMessageId).text(message)
    }

    $("#masterSearch").keypress(function (data) {
        if (data.keyCode === 13) {
            var oData = $("#masterSearch").val()
            window.location = "${createLink(controller:'utility',action:'search')}?masterSearch=" + oData
        }
    });

    $(function () {
        $('.rating-select .btn').on('mouseover', function () {
            $(this).removeClass('rating-deselected').addClass('rating-selected');
            $(this).prevAll().removeClass('rating-deselected').addClass('rating-selected');
            $(this).nextAll().removeClass('rating-selected').addClass('rating-deselected');
        });

        $('.rating-select').on('mouseleave', function () {
            active = $(this).parent().find('.selected');
            if (active.length) {
                active.removeClass('rating-deselected').addClass('rating-selected');
                active.prevAll().removeClass('rating-deselected').addClass('rating-selected');
                active.nextAll().removeClass('rating-selected').addClass('rating-deselected');
            } else {
                $(this).find('.btn').removeClass('rating-selected').addClass('rating-deselected');
            }
        });

        $('.rating-select .btn').click(function () {
            if ($(this).hasClass('selected')) {
                $('.rating-select .selected').removeClass('selected');
            } else {
                $('.rating-select .selected').removeClass('selected');
                $(this).addClass('selected');
            }

            var rating = $('.rating-select .selected').attr('id')
            var resourceId = $('#resourceId').val()
            var oData = new FormData(document.forms.namedItem("shareDocumentForm"));
            var url = "${createLink(controller:'resource',action:'resourceRating')}";
            $.ajax({
                url: url,
                type: 'POST',
                dataType: 'json',
                data: {
                    rating: rating,
                    resourceId: resourceId
                },
                beforeSend: function (x) {
                    if (x && x.overrideMimeType) {
                        x.overrideMimeType("application/json;charset=UTF-8");
                    }
                },
                success: function (req) {
                    console.log("Div updated successfully.....")
                    /*$("#updatePostDiv").html(req)
                     closeModal(this, shareDocumentModal)*/
                }
            });

        });
    });

    $(document).ready(function () {
        var resourceRating = $('#resourceRating').val()
        $('.rating-select .btn').each(function () {
            if ($(this).attr('id') == resourceRating) {
                $(this).removeClass('rating-deselected').addClass('rating-selected');
                $(this).prevAll().removeClass('rating-deselected').addClass('rating-selected');
                $(this).nextAll().removeClass('rating-selected').addClass('rating-deselected');
            }
        });

        $(document).on('click', ".dropdown-menu li a", function (event) {
            $(this).parents(".dropdown").find('.btn').first().val($(this).text());
            var topPostPeriod = $(this).parents(".dropdown").find('#topPostsPeriod');

            if (topPostPeriod.length > 0) {
                searchTopPostByPeriod(topPostPeriod)
            }
        });

        $('#sendInvitationModal').on('show.bs.modal', function (event) {
            console.log(event.relatedTarget)
        });
    });

    key_count_global = 0
    $("#inboxSearch").keyup(function (event) {
        key_count_global++;
        setTimeout("lookup(" + key_count_global + ")", 5000);
    });

    function lookup(key_count) {
        var searchVal = $("#inboxSearch").val()

        var url = "${createLink(controller:'dashboard',action:'viewPostsBasedOnSearch')}";
        if (key_count == key_count_global) {
            $.ajax({
                url: url,
                type: 'POST',
                data: {
                    search: searchVal
                },
                success: function (req) {
                    console.log("Div updated successfully.....")
                    $("#updatePostDiv").html(req)
                }
            });
            key_count_global = 0;
        }
    }

    function searchTopPostByPeriod(topPostPeriod) {
        var url = "${createLink(controller:'home',action:'searchTopPostsByDate')}";
        $.ajax({
            url: url,
            type: 'POST',
            data: {
                topPostPeriod: topPostPeriod.val()
            },
            success: function (req) {
                console.log("Div updated successfully.....")
                $("#topPostDiv").html(req)
            }
        });
    }

    function deleteSubscriptionById(id) {
        console.log('Inside delete' + id)
        var url = "${createLink(controller:'subscription',action:'deleteSubscription')}";
        $.ajax({
            url: url,
            type: 'POST',
            data: {
                id: id
            },
            success: function (req) {
                console.log("Div updated successfully.....")
                $("#updateDashboardSubscription").html(req)
            }
        });
    }

    $('#sendInvitationModal').on('hide.bs.modal', function(e) {
        $(this).removeData('bs.modal');
    });

</script>

</html>