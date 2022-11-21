<?php

// Gewinner des Tages abgreifen
$URL = "https://www.bet-at-home.de/de/promotion/winneroftheday/6527";
$seite = shell_exec("curl -sSl " . $URL);

preg_match('/<strong data-id="todaysWinnerOfTheDay">\s*(.*)\s*(.*)\s*<\/strong>/', $seite, $matches);

echo "bet-at-home Gewinner des Tages ist: \n\n";
echo trim($matches[1]) . " " . trim($matches[2]) . "\n";
