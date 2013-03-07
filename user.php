<?php
require_once('includes/allreputation.php');
$smarty->config_load($conf_file, 'user');

$rows = $rDB->select('SELECT joindate, last_login FROM account WHERE username=?', $_SESSION['username']);
foreach ($rows as $row)
	{
		$user['joined'] = $row['joindate'];
		$user['llogin'] = $row['last_login'];
	}

$user['reputation'] = $rDB->select('SELECT * FROM account_reputation WHERE username=? ORDER BY id', $_SESSION['username']);
$user['id'] = $rDB->selectCell('SELECT id FROM account WHERE username=?',$_SESSION['username']);
$user['characters'] = $cDB->select('SELECT name, level, guid, class, race, latency, online FROM characters WHERE account=?d ORDER BY guid', $user['id']);
global $page;
$page = array(
	'Mapper' => false,
	'Book' => false,
	'Talent' => false,
	'Title' => $smarty->get_config_vars('User'),
	'tab' => 1,
	'type' => 0,
	'typeid' => 0,
	'username' => $_SESSION['username'],
	'path' => 0
);
$smarty->assign('page', $page);
$smarty->assign('mysql', $DB->getStatistics());
$smarty->assign('reputation', getreputation($page['username']));
$smarty->assign('user', $user);
$smarty->display('user.tpl');

?>
