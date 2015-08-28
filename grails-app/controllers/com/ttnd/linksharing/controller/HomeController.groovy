package com.ttnd.linksharing.controller

import com.ttnd.linksharing.model.Resource
import com.ttnd.linksharing.service.ResourceService
import com.ttnd.linksharing.utils.DateUtil
import org.apache.commons.lang.time.DateFormatUtils
import org.apache.commons.lang.time.DateUtils

import java.text.SimpleDateFormat

class HomeController {

    ResourceService resourceService
    def resourceRatingService

    def home() {
        List<Resource> resourceList = resourceService.findAllPublicAndLatestResource()


        List<Resource> topRatedResource = resourceRatingService.findAllPublicAndLatestResourceRatedTop(DateUtil.getBackDateForDays(-1))

        render(view: 'home', model: [topPosts: topRatedResource, recentShares: resourceList])
    }

    def searchTopPostsByDate() {
        def period
        period = params.topPostPeriod

        def date
        switch (period) {
            case 'Today':
                println 'Today'
                date = DateUtil.getBackDateForDays(-1)
                break
            case '1 week':
                println 'week'
                date = DateUtil.getBackDateForDays(-7)
                break
            case '1 month':
                println 'month'
                date = DateUtil.getBackDateForMonth(-11)
                break
            case '1 year':
                println 'year'
                date = DateUtil.getBackDateForYear(-1)
                break
        }

        List<Resource> topRatedResource = resourceRatingService.findAllPublicAndLatestResourceRatedTop(date)

        render(template: '/topic/topPosts', model: [topPosts: topRatedResource, showDateDropDown: true, period: period])
    }
}
