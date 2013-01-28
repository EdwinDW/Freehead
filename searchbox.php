<?php

$smarty->config_load($conf_file);

global $page;
$page = array(
	'Mapper' => false,
	'Book' => false,
	'Title' => 'Searchbox for your website',
	'tab' => 0,
	'type' => 0,
	'typeid' => 0,
	'path' => '[0, 30]'
);

$smarty->assign('page', $page);
$smarty->display('searchbox.tpl');
?>