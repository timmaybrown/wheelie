<cfset themeDir = "/views/layouts/admin/">
<cfoutput>
<!DOCTYPE html>
<!--[if lt IE 7]> <html lang="en" class="lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>    <html lang="en" class="lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>    <html lang="en" class="lt-ie9"> <![endif]-->
<!--[if IE 9]>    <html lang="en" class="ie9"> <![endif]-->
<!--[if gt IE 9]><!--> <html lang="en"> <!--<![endif]-->
	<head>	
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		
		<title>#sanitize(includeContent("headerTitle"))# | Web Panel</title>
		
		<link rel="icon" type="image/png"  href="/favicon.png">
		
		<meta name="description" content="">
		<meta name="robots" content="index, follow">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
 
		<cfscript>		
			includeCSS = styleSheetLinkTag(sources='
					vendor/css/plugins/lightbox/lightbox.css, 	
					vendor/css/plugins/jgrowl/jquery.jgrowl.css,
					vendor/nestedSortable/nestedSortable.css,
					vendor/css/font/icons.css	
			');
			
			//includeIECSS = styleSheetLinkTag(sources='');
			
			includeJS = javaScriptIncludeTag(sources='
					vendor/js/libs/jquery.js,
					js/utilities.js,					
					vendor/js/libs/modernizr.js,
					vendor/js/bootstrap/bootstrap.min.js,
					vendor/js/plugins/wysihtml5/wysihtml5-0.3.0.js,
					vendor/js/plugins/wysihtml5/bootstrap-wysihtml5.js,
					vendor/js/plugins/lightbox/lightbox-2.6.min.js,
					vendor/js/plugins/jGrowl/jquery.jgrowl.js,					
					vendor/ckeditor/ckeditor.js,
					vendor/tmpl.js,
					vendor/jquery.popupwindow.js,
					vendor/jquery.form.js,
					vendor/serializeAnything.jquery.js,
					vendor/nestedSortable/jquery-ui-1.10.3.custom.min.js,
					vendor/nestedSortable/jquery.ui.touch-punch.min.js,
					vendor/nestedSortable/jquery.mjs.nestedSortable2.js,
					vendor/js/plugins/fileupload/bootstrap-fileupload.js,
					vendor/jquery.responsivetable.min.js
			');
			
			includeIEJS = javaScriptIncludeTag(sources='
					vendor/js/libs/respond.min.js,
					vendor/js/libs/selectivizr.js
			');
		</cfscript>
		<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
		<!-- Fav and touch icons 
		<link rel="shortcut icon" href="img/icons/favicon.ico">
		<link rel="apple-touch-icon-precomposed" sizes="114x114" href="img/icons/apple-touch-icon-114-precomposed.png">
		<link rel="apple-touch-icon-precomposed" sizes="72x72" href="img/icons/apple-touch-icon-72-precomposed.png">
		<link rel="apple-touch-icon-precomposed" href="img/icons/apple-touch-icon-57-precomposed.png">-->
		
		<!-- CSS Libs -->
		#includeCSS#
		
		<link href="#themeDir#assets/css/admin-bootstrap.css" rel="stylesheet">
		<link href="#themeDir#style.css" rel="stylesheet">
		
		<!-- JS Libs -->
		#includeJS#
		
		<script src="#themeDir#assets/js/adminmenu.js" type="text/javascript"></script>
		<script src="#themeDir#assets/js/shared.js" type="text/javascript"></script>
		
		<!-- IE8 support of media queries and CSS 2/3 selectors -->
		<!--[if lt IE 9]>
			<!---#includeIECSS#--->
			#includeIEJS#
		<![endif]-->
		<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>  
		<style type="text/css">
			*, strong, h1, h2, h3, h4 {
				font-family:'Montserrat', sans-serif !important
			}
		</style>
	</head>
	<body style="background:##eee; padding-top:50px; font-size:12px;">		
		
		<div id="wrapper" class="admin-content">
			<cfif NOT flashIsEmpty()>
				<div class="container">				
					<cfif flashKeyExists("error")>
						<div class="alert alert-danger alert-dismissable fade in">
							<button class="close" data-dismiss="alert">&times;</button>
							<strong>#flash("error")#</strong> 
							<cfif !isNull(errorMessagesName)>												
								#errorMessagesFor(errorMessagesName)#
							</cfif>
						</div>
					</cfif>
					
					<cfif flashKeyExists("success")>
						<div class="alert alert-success">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<strong>#flash("success")#</strong>
						</div>
					</cfif>
				</div>
			</cfif>			
			
			#includeContent("formWrapStart")#			
			
			<!-- Main page container -->
			<section class="container" role="main">	
				
				<cfif len(includeContent("rightColumn"))>
					<cfset mainClass = "col-sm-9 leftside">
				<cfelse>
					<cfset mainClass = "col-sm-12">
				</cfif>
				
				#includeContent("extraSection")#
				
				<cfif !len(includeContent("clearLayout"))>
				
					<!-- Grid row -->
					<div class="row contentwrapper">
	
						<!-- Data block -->
						<div class="#mainClass#">
							<div class="data-block">
								<header>
									<cfif len(includeContent("headerTitle"))>
										<h2>#includeContent("headerTitle")# #includeContent("headerTitleAppend")#</h2>
										<cfif len(includeContent("headerButtons"))>
											<ul class="data-header-actions">#includeContent("headerButtons")#</ul>
											<br class="clear">
										</cfif>	
									</cfif>
								</header>
								<section>							
								
				</cfif>			
					
				<cfif len(includeContent("mainBody"))>
					#includeContent("mainBody")#
				<cfelse>
					#includeContent()#
				</cfif>
								
				<cfif !len(includeContent("clearLayout"))>		
						
								</section>
							</div>
						</div>
						<!-- /Data block -->
						
						<cfif len(includeContent("rightColumn"))>
							<div class="col-sm-3 rightbar">
								#includeContent("rightColumn")#
							</div>
						</cfif>
						
					</div>
					<!-- /Grid row -->
				</cfif>
				
			</section>
			<!-- /Main page container -->
						
			<!-- Sticky footer push -->
			<div id="push"></div>
			
			#includeContent("formWrapEnd")#
			
		</div>
		<!-- /Full height wrapper -->
		
		<!--- Main page footer 
		<footer id="footer">
			<div class="container">
					<a href="##top" class="btn btn-primary pull-right" title="Back to top"><span class="elusive icon-arrow-up"></span></a>


				<!-- Footer info -->
				<p>Copyright &copy; #DateFormat(now(),"YYYY")# #capitalize(cgi.SERVER_NAME)#</p>

				<!--- <!-- Footer nav -->
				<ul>
					<li><a href="##">Support</a></li>
					<li class="muted">&middot;</li>
					<li><a href="##">Documentation</a></li>
					<li class="muted">&middot;</li>
					<li><a href="##">API</a></li>
				</ul>
				<!-- /Footer nav --> --->

				<!-- Footer back to top -->
				

			</div>
		</footer>
		--->
		
		<cfif len(includeContent("plupload"))>
			<script type="text/javascript" src="/assets/vendor/plupload/plupload.full.min.js"></script>
			<script type="text/javascript" src="/assets/vendor/plupload/jquery.plupload.queue/jquery.plupload.queue.js"></script>
			<link rel="stylesheet" href="/assets/vendor/plupload/plupload.bootstrap/css/plupload.bootstrap.css" type="text/css" media="screen" />
			<script type="text/javascript" src="/assets/js/plupload.video.js"></script>
			
			<script type="text/html" id="tmpl_ytThumbs">	
				<div class="form-group">
					#bLabel(label="Choose a Thumbnail",class="control-label")#
					<div class="controls">
						<% for ( var id = 0; id < videos.length; id++ ) { %>	
						
							<div class="wiz_thumb">
								<label for="img">
									<img class="img" src="http://i.ytimg.com/vi/<%=videos[id]%>/hqdefault.jpg" />
									<input type="radio" name="thumbid" class="thumbid" value="<%=videos[id]%>" checked />
								</label>
							</div>
						
						<% } %>
						<br class="clear" />
					</div>
				</div>	
			</script>
			
		</cfif>
		
		<cfif len(includeContent("selectize")) OR len(includeContent("formy"))>
		
			#styleSheetLinkTag(sources='vendor/selectize/css/selectize.bootstrap3.css')#
			#javaScriptIncludeTag(sources='
				vendor/selectize/js/standalone/microplugin.min.js,
				vendor/selectize/js/standalone/sifter.min.js,
				vendor/selectize/js/standalone/selectize.js
			')#
			
			<script type="text/javascript">
				$(function() {
					$('.multiselectize').selectize({
						maxItems: null
					});
					$('.selectize').selectize();
					$('.selectizetags').selectize({
						delimiter: ',',
						persist: false,
						create: function(input) {
							return {
								value: input,
								text: input
							}
						}
					});
				});
			</script>	
		</cfif>
		
		<cfif len(includeContent("checkable")) OR len(includeContent("formy"))>
		
			#javaScriptIncludeTag(sources='vendor/js/plugins/prettyCheckable/prettyCheckable.js')#
			#styleSheetLinkTag(sources='vendor/css/plugins/prettycheckable/prettyCheckable.css')#

			<script>
				$(document).ready(function() {
	
					$('.styled-checkbox input, .styled-radio input').prettyCheckable();
	
				});
			</script>

		</cfif>
		
		<cfif len(includeContent("ajaxModal")) OR len(includeContent("formy"))>
			#javaScriptIncludeTag(
				sources="
					vendor/jquery.form.js,
					js/ajax.js				
			")#	
			<div id="ajax-modal" class="modal primary container hide fade" tabindex="-1"></div>
		</cfif>
		
	</body>
</html>
    
<!--- Fixes "> </html" issue --->   
<span></span>  
</cfoutput>