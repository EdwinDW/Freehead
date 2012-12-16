<?php
require_once('includes/allutil.php');


$smarty->config_load($conf_file, 'user');
dssgs

$smarty->assign('mysql', $DB->getStatistics());
$smarty->display('user.tpl');
?>