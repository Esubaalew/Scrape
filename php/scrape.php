<?php
$url = 'https://www.example.com/';
$html = file_get_contents($url);
$pTagText = strip_tags($html, '<p>');

echo "Text inside <p> tags: $pTagText\n";
?>
