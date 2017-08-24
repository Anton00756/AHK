<?php
$ChatNick = $_GET['ChatNick'];
$ChatText = $_GET['ChatText'];

$file = 'JCChat.txt';

$current = file_get_contents($file);
$current .= "{J}$ChatNick: $ChatText{JC}\n";

file_put_contents($file, $current);
?>
