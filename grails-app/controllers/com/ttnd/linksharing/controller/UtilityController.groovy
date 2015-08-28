package com.ttnd.linksharing.controller

import com.ttnd.linksharing.model.DocumentResource
import com.ttnd.linksharing.model.LinkResource
import com.ttnd.linksharing.model.Resource
import com.ttnd.linksharing.model.Topic
import com.ttnd.linksharing.model.User
import grails.plugin.springsecurity.annotation.Secured
import org.apache.commons.io.FilenameUtils
import org.springframework.web.multipart.commons.CommonsMultipartFile

class UtilityController {

    def springSecurityService
    def mailService
    def topicService
    def resourceService

    def index() {}

    @Secured(['ROLE_DASHBOARD', 'ROLE_ADMIN', 'ROLE_USER'])
    def sendInvitation() {

        User user = springSecurityService.loadCurrentUser()

        try {
            render(text: 'Sending email...')
            mailService.sendMail {
                to params.email
                subject "Invitaion for topic " + params.invitationFor
                body user.firstName + " " + user.lastName + ' has sent you an inivitation for the topic ' + params.invitationFor
            }

            render(text: 'Email sent successfully.')
        } catch (Exception e) {
            render(status: 403, text: 'Error sending email.')
        }
    }

    @Secured(['ROLE_DASHBOARD', 'ROLE_ADMIN', 'ROLE_USER'])
    def shareLink() {
        def link = params.link
        def description = params.description
        def shareLinkFor = params.shareLinkFor
        User user = springSecurityService.loadCurrentUser()
        Topic topic = topicService.findTopicByName(shareLinkFor)

        Resource resource = new LinkResource(url: link, topic: topic, description: description, createdBy: user)
        try {
            if (resource.validate()) {
                resourceService.save(resource)
                List<Resource> resourceList = resourceService.findAllUnreadByUser(user)
                render(template: "/subscription/posts", status: 200, model: [resources: resourceList])
            } else {
                log.debug resource.errors
                render(status: 403, text: 'Request failed to complete due to some error.')
            }
        } catch (Exception e) {
            e.printStackTrace()
            render(status: 403, text: 'Request failed to complete due to some error.')
        }
    }

    @Secured(['ROLE_DASHBOARD', 'ROLE_ADMIN', 'ROLE_USER'])
    def shareDocument() {

        def document = params.document
        def description = params.description
        def shareDocFor = params.shareDocFor

        println(document)

        User user = springSecurityService.loadCurrentUser()
        Topic topic = topicService.findTopicByName(shareDocFor)

        def filePath = uploadFile(document)

        Resource resource = new DocumentResource(filePath: filePath, topic: topic, description: description,
                createdBy: user)

        try {
            if (resource.validate()) {
                resourceService.save(resource)
                List<Resource> resourceList = resourceService.findAllUnreadByUser(user)
                render(template: "/subscription/posts", status: 200, model: [resources: resourceList])
            } else {
                println resource.errors
                render(status: 403, text: 'Request failed to complete due to validation error.')
            }
        } catch (Exception e) {
            e.printStackTrace()
            render(status: 403, text: 'Request failed to complete due to some error.')
        }
    }

    @Secured(['ROLE_SECURED'])
    private def uploadFile(def requestFileName) {

        def fileName
        def inputStream
        if (requestFileName instanceof CommonsMultipartFile) {
            fileName = requestFileName?.originalFilename
            inputStream = requestFileName.getInputStream()
        } else {
            fileName = requestFileName
            inputStream = request.getInputStream()
        }

        fileName = fileName.replaceAll(" ", "_")

        def extension = FilenameUtils.getExtension(fileName)
        def baseName = FilenameUtils.getBaseName(fileName)

        def fileLocation = grailsApplication.config.grails.linksharing.document.upload.location
        fileLocation = "${fileLocation}/${baseName}_${System.currentTimeMillis()}.${extension}"
        println fileLocation
        File storedFile = new File(fileLocation)

        storedFile.append(inputStream)
        return storedFile.absolutePath

    }

    @Secured(['ROLE_DASHBOARD', 'ROLE_ADMIN', 'ROLE_USER'])
    def search() {

        println 'Inside search...' + params.masterSearch

        def searchString = params.masterSearch;

        List<Topic> trendingTopics = topicService.findAllTrendingTopics()
        List<Resource>  resources= resourceService.findAllForTheMatchingTopicAndResourceDescription(searchString)

        render(view: 'search', model: [trendingTopics: trendingTopics, resources: resources])
    }
}
