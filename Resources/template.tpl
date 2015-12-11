<?php
$message = 'Clear Opcache: ';

if (opcache_reset()) {
    $success = true;
    $message .= 'success! ';
}
else {
    $success = false;
    $message .= 'failure! ';
}

$message .= 'Clear APCu Cache: ';

if (apc_clear_cache()) {
    $success = true;
    $message .= 'success!';
}
else {
    $success = false;
    $message .= ' failure!';
}

die(json_encode(array('success' => $success, 'message' => $message)));
