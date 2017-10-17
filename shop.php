<?php
	include 'classes.inc';
	$message = "";
	$dataHandler = new MyDataHandler();
	$allProducts = $dataHandler->getAdminPanelData('products')['data'];

	if(!isset($_SESSION)) 
    { 
        session_start(); 
    } 
    if(array_key_exists('alert', $_GET)){
		$alert = $_GET['alert'];
		$GLOBALS['message'] = "alert=". $alert;
		echo '<script>alert("'.$alert.'");</script>';
	}

	if(array_key_exists('UserAuth', $_SESSION) && $dataHandler->validateShopSession()){
		echo '<script>console.log("check passed");</script>';
	}else{
		echo '<script>console.log("check failed");</script>';
		echo '<script type="text/javascript">location.href = "./shop_login.php?'.$GLOBALS['message'].'";</script>';
	}

?>
<html>
<head>
	<title> Shop </title>
	<link rel="stylesheet" type="text/css" href="./mystyle.css">
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
	<script type="text/javascript" src="./myscript.js"></script>
	<script>
		console.log( <?php echo json_encode($allProducts);?> );
	</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col header">
				<div class="row">
					<div class="col-md-1">
						<a class="btn btn-info width-80" href="./routes.php?action=logout_shop">
							<span>Logout</span>
						</a>
					</div>
					<div class="col-md-1">
						 <a class="btn btn-info width-80" href="./">
							<span class="glyphicon glyphicons-undo"> </span>
							<span> Back</span>
						</a>
					</div>
					<div class="col-md-8">
						Shop
					</div>
					<div class="col-md-2">
						<form action="./routes.php" method="post">
							<input type="hidden" name="products" id="product_array"/>
							<input type="hidden" name="userid" id="user_id" value=<?php echo $_SESSION['user_id'];?> />
							<input type="submit" class="btn btn-info width-80" name="action" value= "checkout"/>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="scroll">
				<div style="height: 5%"></div>
				<!-- main area -->
				<?php
					foreach ($allProducts as $key => $value) {
						?>
						<div class="col-md-3 text-center">
							<img id=<?php echo $key;?> src= <?php echo $value['image_url']; ?> class="img-rounded product" alt=<?php echo $value['name']?> width="304" height="236">
							<?php echo $value['name']. ' for ' .$value['price'] ?>

						</div>
						<?php
					}
				?>
		</div>
	</div>
</body>
</html>