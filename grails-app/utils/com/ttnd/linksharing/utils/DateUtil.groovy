package com.ttnd.linksharing.utils

import org.apache.commons.lang.time.DateUtils

/**
 * Created by ttnd on 27/8/15.
 */
class DateUtil {

    static Date today() {
        new Date();
    }

    static Date getBackDateForDays(int backDays) {
        Calendar cal = Calendar.getInstance()
        cal.add(Calendar.DAY_OF_MONTH, backDays)
        return cal.time;
    }

    static Date getBackDateForMonth(int noPrevMonths) {
        Calendar cal = Calendar.getInstance()
        cal.add(Calendar.MONTH, noPrevMonths)
        return cal.time;
    }

    static Date getBackDateForYear(int noPrevYears) {
        Calendar cal = Calendar.getInstance()
        cal.add(Calendar.YEAR, noPrevYears)
        return cal.time;
    }
}
