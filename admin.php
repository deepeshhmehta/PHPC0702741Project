<?php
	include 'classes.inc';
	$dataHandler = new MyDataHandler();
	$allSections = $dataHandler->getAllSectionsAdminPanel();
	if(!isset($_SESSION)) 
    { 
        session_start(); 
    } 
	if(array_key_exists('Auth', $_SESSION) && $dataHandler->validateSession()){
		echo '<script>console.log("check passed");</script>';
	}else{
		echo '<script>console.log("check failed");</script>';
		echo '<script type="text/javascript">location.href = "./admin_login.php";</script>';
	}

?>
<html>
<head>
	<title> Admins </title>
	<link rel="stylesheet" type="text/css" href="./mystyle.css">
	<!-- <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
	<script type="text/javascript" src="./myscript.js"></script>
	<script>
		console.log( <?php echo json_encode($allSections);?> );
	</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col header">
				<div class="row">
					<div class="col-md">
						<a class="btn btn-info width-80" href="./routes.php?action=logout">
							<span>Logout</span>
						</a>
					</div>
					<div class="col-md-9">
						Admin Panel
					</div>
					<div class="col-md">
						 <a class="btn btn-info width-80" href="./">
							<span class="glyphicon glyphicons-undo"> </span>
							<span> Back</span>
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="scroll">
				<div style="height: 5%"></div>
				<div class="row">
					<div class="col-md-2" id="collapseAll">Collapse All</div>
					<div class="col-md-8"></div>
					<div class="col-md-2" id="expandAll">Expand All</div>
				</div>
				<!-- main area -->
				<?php
					foreach ($allSections as $key => $value) {
						?>
						<div style="height: 5%"></div>
						<div class="row">
							<div class="col-md-12 text-justify">
								<div class="switch" id=<?php echo $value['idToggle'];?> > <?php echo ucfirst($value['section_name']);?> <span class="glyphicon glyphicon-chevron-right"></span></div>
								<div id=<?php echo $value['idDetails'];?> class="data">
									<div class="container">
										<!-- <div class="row">
										<?php
											foreach ($value['matter']['fields'] as $key => $field) {
												?>
												<div class="col-md">
													<b>
														<?php echo ucfirst($field['field_name']);?>
													</b> 
												</div>
												<?php
											}
										?>
										<div class="col-md"></div>
											
										</div> -->
										<?php
											foreach ($value['matter']['data'] as $key => $instance) {
												?>
												<form action="./routes.php" method="POST">
													<input type="hidden" name="data_id" value=<?php echo $key;?> />
													<div class="row instance-border">
														<?php
															foreach ($value['matter']['fields'] as $key => $field) {
																?>
																<!-- <div class="col-md">
																	some data
																</div> -->
																<div class="col-md">
																	<div class="col-md-12">
																		<b>
																			<?php echo ucfirst($field['field_name']);?>
																		</b> 
																	</div>
																	<div class="col-md-12">
																		<input type="text" name=<?php echo $field['field_name'];?> placeholder = <?php echo $field['field_name'];?> value = <?php echo '"'.$instance[$field['field_name']].'"';?>>
																	</div>
																</div>
																<?php
															}
														?>
														<div class="col-md">
															<div class="col-md-12">
																<input type="submit" name="action" value="update"/>
															</div>
														</div>
														<?php if($field['data_type_id'] != 2){?>
															<div class="col-md">
																<div class="col-md-12">
																	<input type="submit" name="action" onclick="return confirm('Are You Sure?')" value="delete"/>
																</div>
															</div>
														<?php } ?>
														
													</div>
												</form>										
												<?php
											}
											?>
											<?php if($field['data_type_id'] != 2){?>
											<form action="./routes.php" method="POST">
												<input type="hidden" name="data_id" value= 0 />
												<div class="row">				
												<?php
													foreach ($value['matter']['fields'] as $key => $field) {
														?>
													
														<div class="col-md">
															<input type="text" name=<?php echo $field['field_name'];?> placeholder = <?php echo $field['field_name'];?> value = "">
														</div>
														<?php
													}
												?>
												<input type="hidden" name="data_type_id" value= <?php echo $field['data_type_id'];?> />
												<div class="col-md"><input type="submit" name="action" value="Add"/></div>						
												</div>
											</form>
											<?php } ?>					
									</div>
								</div>
							</div>
						</div>
						<?php
					}
				?>
		</div>
	</div>
</body>
</html>