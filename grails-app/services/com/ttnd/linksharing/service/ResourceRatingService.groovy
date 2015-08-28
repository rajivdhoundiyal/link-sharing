package com.ttnd.linksharing.service

import com.ttnd.linksharing.model.Resource
import com.ttnd.linksharing.model.ResourceRating
import com.ttnd.linksharing.model.Visibility
import com.ttnd.linksharing.utils.DateUtil
import grails.transaction.Transactional

@Transactional
class ResourceRatingService extends AbstractService<ResourceRating> {

    @Override
    Class<ResourceRating> getReference() {
        return ResourceRating
    }

    ResourceRating findByResource(Resource resource) {
        return ResourceRating.findByResource(resource)
    }

    List<Resource> findAllPublicAndLatestResourceRatedTop(Date date) {
        def today = DateUtil.today()
        return ResourceRating.where {
            resource.topic.visibility == Visibility.PUBLIC &&
                    ((dateCreated > date && dateCreated <= today) || (lastUpdated > date && lastUpdated <= today))
            order('score', 'desc')
        }.property("resource").list(max: 5)
    }
}