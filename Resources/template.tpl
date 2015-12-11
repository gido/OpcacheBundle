<?php
$message = 'Clear Opcache';

if (opcache_reset()) {
    $success = true;
    $message .= ' Opcode Cache: success';
}
else {
    $success = false;
    $message .= ' Opcode Cache: failure';
}

$message = 'Clear APCu Cache';

if (apc_clear_cache()) {
    $success = true;
    $message .= ' APCu Cache: success';
}
else {
    $success = false;
    $message .= ' APCu Cache: failure';
}

die(json_encode(array('success' => $success, 'message' => $message)));
