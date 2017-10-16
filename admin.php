<?php
	include 'classes.inc';
	$dataHandler = new MyDataHandler();
	$allSections = $dataHandler->getAllSectionsAdminPanel();

?>
<html>
<head>
	<title> Admins </title>
	<link rel="stylesheet" type="text/css" href="./mystyle.css">
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
					<div class="col-md-10">
						Admin Panel
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
		<div class="scroll">
				<div style="height: 5%"></div>
				<div class="row">
					<div class="col-xs-2" id="collapseAll">Collapse All</div>
					<div class="col-xs-2 col-xs-offset-8" id="expandAll">Expand All</div>
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
									<table>
										<tr>
										<?php
											foreach ($value['matter']['fields'] as $key => $field) {
												?>
												<th>
													<?php echo ucfirst($field['field_name']);?> 
												</th>
												<?php
											}
										?>
										</tr>
										<?php
											foreach ($value['matter']['data'] as $key => $instance) {
												?>
												<tr>
													<form action="./change.php" method="POST">
													<input type="hidden" name="data_id" value=<?php echo $key;?> />
													<?php
														foreach ($value['matter']['fields'] as $key => $field) {
															?>
														
															<td>
																<input type="text" name=<?php echo $field['field_name'];?> placeholder = <?php echo $field['field_name'];?> value = <?php echo '"'.$instance[$field['field_name']].'"';?>>
															</td>
															<?php
														}
													?>
													<td><input type="submit" name="action" value="update"/></td>
													<td><input type="submit" name="action" value="delete"/></td>
													</form>
												</tr>											
												<?php
											}
										?>							
									</table>
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