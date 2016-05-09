<?php
$message = 'Clear Opcache: ';

if (function_exists('opcache_reset')) {
  if (opcache_reset()) {
      $success = true;
      $message .= 'success! ';
  }
  else {
      $success = false;
      $message .= 'failure! ';
  }
} else {
    $success = true;
    $message .= 'opcache extension not enabled ';
}


$message .= 'Clear APCu Cache: ';

if (function_exists('apc_clear_cache')) {
  if (apc_clear_cache()) {
      $success = true;
      $message .= 'success!';
  }
  else {
      $success = false;
      $message .= ' failure!';
  }
} else {
    $success = true;
    $message .= 'APCu extension not enabled';
}

die(json_encode(array('success' => $success, 'message' => $message)));
