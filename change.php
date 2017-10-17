<?php
	include 'classes.inc';
	$dataHandler = new MyDataHandler();

	$data = Array();

	switch ($_POST['action']) {
		case 'delete':
			$GLOBALS['dataHandler']->deleteData($_POST);
			break;
		case 'update':
			$GLOBALS['dataHandler']->updateData($_POST);
			break;
		case 'Add':
			$GLOBALS['dataHandler']->addData($_POST);
			break;
		default:
			echo '# code...';
			break;
	}
?>