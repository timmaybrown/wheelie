<cfscript>	

	function adminMenuDefaults()
	{
		/*
			Type:
			divider
			link 		- just a link
			parent 		- has children 	- no link
			subparent 	- has children 	- link
			
			Permission:
			Minimum permission to see menu item, if not set will default to all
			
			Icon
		*/
		qUsergroups = model("Usergroup").findAll();
		adminNavMain = [];
		adminNavMore = [];
		
		// menu item
		menuitem = arrayAppend(adminNavMain,{
			type	= 'link',
			name	= 'Dashboard',
			icon	= 'icon-dashboard',
			url		= urlFor(route="admin~Action", controller="main", action="home")
		});
		
		menuitem = arrayAppend(adminNavMain,{
			type		= 'parent',
			name		= 'Content',
			icon		= 'icon-th-list',
			permission  = 'page_save',
			children= 
			[
				{
					type	   = 'subparent',
					name	   = 'Pages',
					icon	   = 'icon-file-new',
					permission = 'page_save',
					url		   = urlFor(route="admin~Action", controller="pages", action="index"),
					children   = [
						{
							type	   = 'link',
							name	   = 'All Pages',
							url		   = urlFor(route="admin~Action", controller="pages", action="index")
						},
						{
							type	   = 'link',
							name	   = 'Add New',
							url		   = urlFor(route="admin~Action", controller="pages", action="new")
						},
						{
							type	   = 'link',
							name	   = 'Manage Fields',
							url		   = urlFor(route="admin~Field", controller="metafields", action="index", modelName="pagefield")
						}
					]
				},
				{
					type	   = 'subparent',
					name	   = 'Posts',
					icon	   = 'icon-pencil',
					permission = 'post_save',
					url		   = urlFor(route="admin~Action", controller="posts", action="index"),
					children   = [
						{
							type	   = 'link',
							name	   = 'All Posts',
							url		   = urlFor(route="admin~Action", controller="posts", action="index")
						},
						{
							type	   = 'link',
							name	   = 'Add New',
							url		   = urlFor(route="admin~Action", controller="posts", action="new")
						}
					]
				},
				{
					type	   = 'subparent',
					name	   = 'Videos',
					icon	   = 'icon-youtube',
					permission = 'video_save',
					url		   = urlFor(route="admin~Action", controller="videos", action="index"),
					children   = [
						{
							type	   = 'link',
							name	   = 'All Videos',
							url		   = urlFor(route="admin~Action", controller="videos", action="index")
						},
						{
							type	   = 'link',
							name	   = 'Add New',
							url		   = urlFor(route="admin~Action", controller="videos", action="new")
						},
						{
							type	   = 'link',
							name	   = 'Categories',
							url		   = urlFor(route="admin~Category", action="rearrange", modelName="videoCategory")
						}
					]
				},
				{
					type	   = 'link',
					name	   = 'Menus',
					icon	   = 'icon-list',
					permission = 'menu_save',
					url		   = urlFor(route="admin~Action", controller="menus", action="rearrange")
				},
				{
					type	   = 'link',
					name	   = 'Newsletters',
					icon	   = 'icon-envelope',
					permission = 'newsletter_save',
					url		   = urlFor(route="admin~Action", controller="newsletters", action="index")
				}
			]
		});	
		
		// Create Children for People Menu
		usergroupLinks = [];
		for(usergroup in qUsergroups)
		{
			ArrayAppend(usergroupLinks,{
				type	= 'link',
				name	= usergroup.groupname,
				url		= urlFor(route="admin~peopleTypes", currentGroup=usergroup.id)
			});
		}
		
		arrayAppend(usergroupLinks,[
			{
				type		= 'divider',
				permission  = "user_save_others"
			},
			{
				type	   = 'link',
				name	   = 'Tags',
				url		   = urlFor(route="admin~Category", action="rearrange", modelName="userTag"),
				permission = "user_save_others"
			},
			{
				type	   = 'link',
				name	   = 'Groups',
				url		   = urlFor(route="admin~Action", controller="usergroups", action="index"),
				permission = "user_save_others"
			},
			{
				type	   = 'link',
				name	   = 'Pending Changes',
				url		   = urlFor(route="admin~Action", controller="users", action="approval"),
				permission = "user_save_others"
			}
		], true);
		
		peopleLinks = usergroupLinks;
		
		// menu item
		menuitem = arrayAppend(adminNavMain,{
			type	= 'parent',
			name	= 'People',
			icon	= 'icon-user',
			children= peopleLinks
		});
		
		// menu item
		menuitem = arrayAppend(adminNavMain,{
			type	= 'link',
			name	= 'Videos',
			icon	= 'icon-video',
			url		= urlFor(route="admin~id", controller="videos", action="category", id="staff")
		});
		
		// menu item
		menuitem = arrayAppend(adminNavMain,{
			type	= 'link',
			name	= 'To-Dos',
			icon	= 'icon-list-alt',
			url		= urlFor(route="admin~Action", controller="todos", action="rearrange")
		});		
		
		// adminNavMore
		menuitem = arrayAppend(adminNavMore,{
			type	= 'parent',
			name	= 'More',
			icon	= 'icon-cog',
			children= 
			[
				{
					type	   = 'link',
					name	   = 'Emails',
					url		   = urlFor(route="admin~Action", controller="emails", action="index"),
					permission  = "email_full_control"
				},
				{
					type	   = 'link',
					name	   = 'Options',
					url		   = urlFor(route="admin~Action", controller="options", action="index"),
					permission  = "option_save_others"					
				},
				{
					type	   = 'link',
					name	   = 'Forms',
					url		   = urlFor(route="admin~Action", controller="forms", action="index"),
					permission  = "form_save_others"		
				},
				{
					type	   = 'link',
					name	   = 'Share Pics',
					url		   = urlFor(route="public~otherPages", action="sharepics")
				},
				{
					type	  = 'subparent',
					name	  = 'Super Admin',
					url		  = '##',
					permission= 'superuser_menu',
					children= 
					[
						{
							type	   = 'link',
							name	   = 'Permissions',
							url		   = urlFor(route="admin~index", controller="permissions")
						},
						{
							type	   = 'link',
							name	   = 'Sites',
							url		   = urlFor(route="admin~Action", controller="sites", action="index")
						},
						{
							type	   = 'link',
							name	   = 'User Groups',
							url		   = urlFor(route="admin~Action", controller="usergroups", action="index")
						}
					]
				}
			]
		});	
	
	}
	function formatAdminMenuItem(item,parentClass="")
	{
		itemreturn = '';
		menuitempermission = true;
		
		if(!isNull(item.permission))
		{
			menuitempermission = checkPermission(item.permission);
		}		
		
		if(!isNull(item.type) AND menuitempermission)
		{
			itemicon = '';
			if(!isNull(item.icon)) { itemicon = '<span class="elusive #item.icon#"></span> '; }
			
			if(item.type eq 'link' and !isNull(item.name) and !isNull(item.url))
			{
				itemreturn = itemreturn & '<li><a href="#item.url#">#itemicon##item.name#</a></li>';
				
			} else if(item.type eq 'divider') {
			
				itemreturn = itemreturn & '<li class="divider"></li>';
				
			} else if(item.type eq 'parent' and !isNull(item.name) and !isNull(item.children)) {
				
				itemreturn = itemreturn & '<li class="dropdown #parentClass#">
				<a href="##" class="dropdown-toggle" data-toggle="dropdown">#itemicon##item.name# <b class="caret"></b></a>
				<ul class="dropdown-menu">';
				
				for(childitem in item.children)
				{
					itemreturn = itemreturn & formatAdminMenuItem(childitem);
				}
				itemreturn = itemreturn & '</ul></li>';
				
			} else if(item.type eq 'subparent' and !isNull(item.name) and !isNull(item.url) and !isNull(item.children)) {					
								
				itemreturn = itemreturn & '<li class="dropdown-submenu #parentClass#">';
				itemreturn = itemreturn & '<a href="#item.url#" class="dropdown-toggle" data-toggle="dropdown">#itemicon##item.name#</a>
				<ul class="dropdown-menu">';
				
				for(childitem in item.children)
				{
					itemreturn = itemreturn & formatAdminMenuItem(childitem);
				}
				itemreturn = itemreturn & '</ul></li>';	
			}
		}
		
		return itemreturn;
	}
	
	function renderAdminMenu(menuArray,parentClass="")
	{
		menureturn = "";
		
		for(item in menuArray)
		{
			menureturn = menureturn & formatAdminMenuItem(item=item,parentClass=parentClass);
		}
		
		return menureturn;
	}
		
</cfscript>