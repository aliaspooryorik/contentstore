<cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>#event.getPrivateValue( "pageTitle", "ContentStore" )#</title>
	<!---Base URL --->
	<base href="#event.getHTMLBaseURL()#" />
	<!---css --->
	<link href="/includes/css/bootstrap-5.3.0.min.css" rel="stylesheet">
</head>

<body>

	<div class="container-fluid">
		<div class="row vh-100">
			<nav class="col col-2 py-4 text-bg-dark">
				<a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
					<span class="fs-4">ContentStore</span>
				</a>
				<hr>
				<ul class="nav nav-pills flex-column mb-auto">
				<cfif auth().guest()>
					<li class="nav-item">
						<a href="#event.buildLink( "login" )#" class="nav-link text-white">Log In</a>
					</li>
				<cfelse>
					<li class="nav-item">
						<a href="#event.buildLink( "contents" )#" class="nav-link text-white">Contents</a>
					</li>
					<li class="nav-item">
						<a href="#event.buildLink( "users" )#" class="nav-link text-white">Users</a>
					</li>
					<li class="nav-item">
						<a href="#event.buildLink( "logout" )#" class="nav-link text-white">Log Out</a>
					</li>
				</cfif>
				</ul>

				<hr>

				<cfif auth().isLoggedIn()>
				<div class="dropdown">
					<a href="##" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
						<strong>#auth().user().getInitials()#</strong>
					</a>
					<ul class="dropdown-menu dropdown-menu-dark text-small shadow" style="">
						<li><a class="dropdown-item" href="#event.buildLink( "users.#auth().getUser().getID()#.edit" )#">Profile</a></li>
					</ul>
				</div>
				</cfif>
			</nav>
			<main class="col py-4">
				#view()#
			</main>

		</div>

	</div>

	<!---js --->
	<script src="/includes/js/bootstrap.bundle-5.3.0.min.js"></script>
	<script>
	(() => {
		'use strict'
		const tooltipTriggerList = Array.from(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
		tooltipTriggerList.forEach(tooltipTriggerEl => {
			new bootstrap.Tooltip(tooltipTriggerEl)
		})
	})()
	</script>
</body>
</html>
</cfoutput>
