<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>@yield('title')</title>
	<link rel="stylesheet" href="/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/app.css">
</head>
<body>


	<div class="container">
		<div class="main">
		@include('flash::message')

		@yield('content')
		</div>	
	</div>

	<script src="/js/bootstrap.min.js"></script>
</body>
</html>