<cfscript>
	
	adminUrlPath = "/manager";
	
	// Admin Routes
	var adminUrlPaths = "#adminUrlPath#,/m/admin";
	for (i=1; i lte listLen(adminUrlPaths); i++) 
	{ 
		thisAdminUrlPath = ListGetAt(adminUrlPaths, i);	
				
		addRoute(
			name="admin~peopleTypes", 
			pattern="#thisAdminUrlPath#/people/[currentGroup]",
			controller="users", 
			action="index"
		);
		
		addRoute(
			name="admin~CategoryId", 
			pattern="#thisAdminUrlPath#/categories/[action]/[modelName]/[id]/",
			controller="categories"
		);
		
		addRoute(
			name="admin~Category", 
			pattern="#thisAdminUrlPath#/categories/[action]/[modelName]",
			controller="categories"	
		);
		
		addRoute(
			name="admin~FieldId", 
			pattern="#thisAdminUrlPath#/fields/[action]/[modelName]/[id]/",
			controller="metafields"
		);
		
		addRoute(
			name="admin~Field", 
			pattern="#thisAdminUrlPath#/fields/[action]/[modelName]",
			controller="metafields"	
		);
		
		addRoute(
			name="admin~MenuId", 
			pattern="#thisAdminUrlPath#/menus/[action]/[modelName]/[id]/",
			controller="menus"
		);
		addRoute(
			name="admin~Menu", 
			pattern="#thisAdminUrlPath#/menus/[action]/[modelName]",
			controller="menus"	
		);	
		
		addRoute(
			name="admin~TodoId", 
			pattern="#thisAdminUrlPath#/todos/[action]/[modelName]/[id]/",
			controller="todos"
		);
		addRoute(
			name="admin~Todo", 
			pattern="#thisAdminUrlPath#/todos/[action]/[modelName]",
			controller="todos"	
		);	
		
		addRoute(
			name="admin~secureSSN", 
			pattern="#thisAdminUrlPath#/secure/jobssn/",
			controller="jobapps", 
			action="jobssn"	
		);
	}
	
	// Default Module Routes
	addRoute(
        name="admin~Id", 
		pattern="#adminUrlPath#/[controller]/[action]/[id].[format]",
		id=""
    );
	addRoute(
        name="admin~Action", 
		pattern="#adminUrlPath#/[controller]/[action]"
    );
	
	addRoute(
        name="admin~Index", 
		pattern="#adminUrlPath#/[controller]",
		action="index"
    );
	
	addRoute(
        name="admin~Home", 
		pattern="#adminUrlPath#",
		action="home",
		controller="main"
    );
	
	// Custom App Module Routes
	addRoute(
        name="appfront~Id", 
		pattern="app/[controller]/[action]/[id].[format]",
		id=""
    );
	addRoute(
        name="appfront~Action", 
		pattern="app/[controller]/[action]"
    );
	
	addRoute(
        name="appfront~Index", 
		pattern="app/[controller]",
		action="index"
    );
	
	addRoute(
        name="appfront~Home", 
		pattern="app",
		action="home",
		controller="appfront"
    );
	
	addRoute(
        name="appback~Id", 
		pattern="admin/[controller]/[action]/[id].[format]",
		id=""
    );
	addRoute(
        name="appback~Action", 
		pattern="admin/[controller]/[action]"
    );
	
	addRoute(
        name="appback~Index", 
		pattern="admin/[controller]",
		action="index"
    );
	
	addRoute(
        name="appback~Home", 
		pattern="admin",
		action="home",
		controller="appback"
    );
	
	// Default Module Routes
	addRoute(
        name="moduleId", 
		pattern="/m/[module]/[controller]/[action]/[id].[format]",
		id=""
    );
	addRoute(
        name="moduleAction", 
		pattern="/m/[module]/[controller]/[action]"
    );
	
	addRoute(
        name="moduleIndex", 
		pattern="/m/[module]/[controller]",
		action="index"
    );
	
	addRoute(
        name="moduleHome", 
		pattern="/m/[module]",
		action="home",
		controller="main"
    );
	
	// Public Routes 	
	addRoute(
        name="public~blogPost", 
		pattern="/blog/post/[id].[format]",
		action="post",
        controller="blog"
    );
	
	addRoute(
        name="public~blogPager", 
		pattern="/blog/page/[currPage]",
		action="index",
        controller="blog"
    );
	
	addRoute(
        name="public~blogWrong", 
		pattern="/blog/[id]",
		action="goHome",
        controller="blog"
    );
	
	addRoute(
        name="public~blogHome", 
		pattern="/blog/",
		action="index",
        controller="blog"
    );
	
	// geolanding	
	addRoute(
        name="public~geolanding", 
		pattern="/Residential-Treatment-Programs/[city]/[state]",
        controller="publicPages", 
		action="geolanding"
    );	
	
	addRoute(
        name="public~geolandingState", 
		pattern="/Residential-Treatment-Programs/[state]",
        controller="publicPages", 
		action="geolanding"
    );	
	
	// Public Routes 	
	addRoute(
        name="public~videoId", 
		pattern="/video/[id]",
		action="video",
        controller="pVideos"
    );
	
	addRoute(
        name="public~id", 
		pattern="/p/[controller]/[action]/[id]"
    );
	
	addRoute(
        name="public~action", 
		pattern="/p/[controller]/[action]"
    );
	
	addRoute(
        name="public~otherPages", 
		pattern="/p/[action]",
        controller="otherPages"
    );
	
	addRoute(
        name="public~usertags", 
		pattern="/team/[id].[format]",
        controller="publicUsers", 
		action="usertag"
    );	
	
	addRoute(
        name="public~secondaryPage", 
		pattern="/[id].[format]",
        controller="publicPages", 
		action="page"
    );	
	
	// Home root has to be last otherwise it will takeover every route
	addRoute(
		name="public~home", 
		pattern="/",
		controller="publicPages", 
		action="index"
	);
	
	
</cfscript>