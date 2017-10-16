<?php
	$data = Array();

	switch ($_POST['action']) {
		case 'delete':
			echo 'Delete';
			break;
		case 'update':
			echo 'Update';
			break;
		default:
			echo '# code...';
			break;
	}
?>