package com.ttnd.linksharing.model

enum Seriousness {
    SERIOUS("Serious"), VERY_SERIOUS ("Very Serious"), CASUAL ("Casual")

    private String seriousness
    Seriousness(String seriousness) {
        this.seriousness =seriousness
    }

    public getSeriousness() {
        return seriousness
    }
}

