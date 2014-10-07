<cfcomponent>
	 <cffunction name="init">
		<cfset this.version = "1.2">
		<cfreturn this>
	</cffunction>	

<!--- 

	My notes on why I needed to fix usesLayout()
	
	Having issue with usesLayout, cross contamination from other domains, I think variables.$class.layout is caching during the reload request which is why I am getting the theme requested from another site at the same time.
	
	Here's the thread on the CFWheels group for more info:
	https://groups.google.com/forum/#!topic/cfwheels/13JyuAtkUms

 --->

<cffunction name="$useLayout" access="public" returntype="any" output="false">
	<cfargument name="$action" type="string" required="true">
	<cfscript>
		var loc = {};
		loc.returnValue = true;
		loc.layoutType = "template";
		if (isAjax() && StructKeyExists(variables.$class.layout, "ajax") && Len(variables.$class.layout.ajax))
			loc.layoutType = "ajax";
		if (!StructIsEmpty(variables.$class.layout))
		{
			loc.returnValue = variables.$class.layout.useDefault;
			if ((StructKeyExists(this, variables.$class.layout[loc.layoutType]) && IsCustomFunction(this[variables.$class.layout[loc.layoutType]])) || IsCustomFunction(variables.$class.layout[loc.layoutType]))
			{
				// if the developer doesn't return anything from the method or if they return a blank string it should use the default layout still
				loc.invokeArgs = {};
				loc.invokeArgs.action = arguments.$action;
				loc.temp = $invoke(method=variables.$class.layout[loc.layoutType], invokeArgs=loc.invokeArgs);
				if (StructKeyExists(loc, "temp"))
					loc.returnValue = loc.temp;
			}
			else if ((!StructKeyExists(variables.$class.layout, "except") || !ListFindNoCase(variables.$class.layout.except, arguments.$action)) && (!StructKeyExists(variables.$class.layout, "only") || ListFindNoCase(variables.$class.layout.only, arguments.$action)))
			{
				// Here's the magic - if it points to a custom theme, make sure it's the request theme
				if(find("/themes/",variables.$class.layout[loc.layoutType]))
				{
					loc.returnValue = "/themes/#request.site.theme#/layout";
				} else {
					loc.returnValue = variables.$class.layout[loc.layoutType];
				}				
			}
		}
		
		return loc.returnValue;
	</cfscript>
</cffunction>
</cfcomponent>