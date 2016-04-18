<?php 
if (!defined('THINK_PATH')) exit();
$lock = realpath(C('DATA_BACKUP_PATH')) . DIRECTORY_SEPARATOR.'backup.lock';
if (is_file($lock)) {
	if (filemtime($lock) < time()-$cron[3]['second']) {
		@unlink($lock);
	}
}