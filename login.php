<?php
	include 'classes.inc';
	$dataHandler = new MyDataHandler();
	if(!isset($_SESSION)) 
    { 
        session_start(); 
    } 
?>
<html>
<head>
	<title> LOGIN (ADMIN) </title>
	<link rel="stylesheet" type="text/css" href="./mystyle.css">
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
	<script type="text/javascript" src="./myscript.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col header">
				<div class="row">
					<div class="col-md-10">
						Login
					</div>
					<div class="col-md-2">
						 <a class="btn btn-info width-80" href="./">
							<span class="glyphicon glyphicons-undo"> </span>
							<span> Back</span>
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
				<!-- main area -->
			<div class="col-md-4 col-md-offset-4 text-center scroll-login">
				<div style="height: 5%"></div>
				<form action="./routes.php" method="post">
					<div class="col-md-12 form-group">
						<label>Username</label>
					</div>
					<div class="col-md-12 form-group">
						<input class="form-control" type="text" name="uname"/>
					</div>
					<div class="col-md-12 form-group">
						<label>Password</label>
					</div>
					<div class="col-md-12 form-group">
						<input class="form-control" type="password" name="pass"/>
					</div>
					<div class="col-md-12 form-group"><label></label></div>
					<div class="col-md-12 form-group">
						<input type="submit" name="action" value="Login" class="form-control btn btn-info"/>
					</div>
				</form>
			</div>
		</div>						
	</div>
</body>
</html>