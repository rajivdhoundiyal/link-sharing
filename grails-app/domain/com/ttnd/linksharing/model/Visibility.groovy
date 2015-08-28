package com.ttnd.linksharing.model

enum Visibility {
    PUBLIC("Public"), PRIVATE("Private")

    private String visibility

    Visibility(String visibility) {
        this.visibility = visibility
    }

    static Visibility getVisibility(String property) {
        return Visibility.valueOf(property.toUpperCase())
    }

    public String getVisibility() {
        return visibility
    }
}
