<cfoutput>

	<script src="//code.jquery.com/jquery-1.10.1.min.js"></script>
	<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script src="/assets/vendor/js/libs/modernizr.js" type="text/javascript"></script>
	<script src="/assets/vendor/js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
	<!--- <script src="/views/layouts/admin/assets/js/adminmenu.js" type="text/javascript"></script> --->
	
	<link href="/assets/css/shared.css" rel="stylesheet" type="text/css"/>
	
	<cfparam name="adminHeadColor" default="54a5de">
	
	<style type="text/css">
		.hero {
			background: ###adminHeadColor# !important;
		}
		.data-block header {
			background: ###adminHeadColor# !important;
		}
		.topnav, .navbar {
			z-index:120 !important;	
		}
	</style>

</cfoutput>