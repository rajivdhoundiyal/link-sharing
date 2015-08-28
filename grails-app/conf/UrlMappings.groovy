class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "home", action:"home")
        "500"(view:'/error')
        "/login/$action?"(controller: "login")
        "/logout/$action?"(controller: "logout")
	}
}
