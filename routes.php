<?php
	include 'classes.inc';
	$dataHandler = new MyDataHandler();

	if(array_key_exists('action', $_POST)){
		$switch_data = $_POST['action']	;
	}else if (array_key_exists('action', $_GET)){
		$switch_data = $_GET['action'];
	}else{
		$switch_data = 'default';
	}

	switch ($switch_data) {
		case 'delete':
			$GLOBALS['dataHandler']->deleteData($_POST);
			break;
		case 'update':
			$GLOBALS['dataHandler']->updateData($_POST);
			break;
		case 'Sign Up':
			$_POST['pass'] = password_hash($_POST['pass'], PASSWORD_DEFAULT);
		case 'Add':
			$GLOBALS['dataHandler']->addData($_POST);
			break;
		case 'Login':
			$GLOBALS['dataHandler']->attemptAdminLogin($_POST);
			break;
		case 'Login To Shop':
			$GLOBALS['dataHandler']->attemptShopLogin($_POST);
			break;
		case 'logout':
			$GLOBALS['dataHandler']->logout("other");
			break;
		case 'logout_shop':
			$GLOBALS['dataHandler']->logout("SHOP");
			break;
		case 'checkout':
			$GLOBALS['dataHandler']->checkout($_POST);
			break;
		default:
			echo '# code...';
			break;
	}
?>