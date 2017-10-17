<?php
	include 'classes.inc';
	$dataHandler = new MyDataHandler();
	if(array_key_exists('alert', $_GET)){
		$alert = $_GET['alert'];
		echo "<script>alert($alert);</script>";
	}

	if(!isset($_SESSION)) 
    { 
        session_start(); 
    } 
?>
<html>
<head>
	<title> LOGIN (Shop) </title>
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
						Shop Login
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
			<div class="col-md-4 col-md-offset-1 text-center scroll-login">
				<div style="height: 5%"></div>
				<form action="./routes.php" method="post">
					<div class="col-md-12 form-group">
						<label>Login</label>
					</div>
					<div style="height: 5%"></div>
					<div class="col-md-12 form-group">
						<label>Email</label>
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
						<input type="submit" name="action" value="Login To Shop" class="form-control btn btn-info"/>
					</div>
				</form>
			</div>
			<div class="col-md-4 col-md-offset-2  text-center scroll">
				<div style="height: 5%"></div>
				<form action="./routes.php" method="post">
					<div class="col-md-12 form-group">
						<label>Register</label>
					</div>
					<div style="height: 5%"></div>
					<input type="hidden" name="data_type_id" value=8 />
					<div class="col-md-12 form-group">
						<label>Name</label>
					</div>
					<div class="col-md-12 form-group">
						<input class="form-control" type="text" name="name" required="true" />
					</div>
					<div class="col-md-12 form-group">
						<label>Email</label>
					</div>
					<div class="col-md-12 form-group">
						<input class="form-control" type="text" name="email" required="true" />
					</div>
					<div class="col-md-12 form-group">
						<label>Phone</label>
					</div>
					<div class="col-md-12 form-group">
						<input class="form-control" type="text" name="phone" required="true" />
					</div>
					<div class="col-md-12 form-group">
						<label>Password</label>
					</div>
					<div class="col-md-12 form-group">
						<input class="form-control" type="text" name="pass" required="true" />
					</div>
					<div class="col-md-12 form-group"><label></label></div>
					<div class="col-md-12 form-group">
						<input type="submit" name="action" value="Sign Up" class="form-control btn btn-info"/>
					</div>
				</form>
			</div>
		</div>						
	</div>
</body>
</html>