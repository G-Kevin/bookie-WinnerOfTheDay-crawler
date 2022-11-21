<?php

// Gewinner des Tages abgreifen
$URL = "https://www.bet-at-home.de/de/promotion/winneroftheday/6527";
$seite = shell_exec("curl -sSl " . $URL);

preg_match('/<strong data-id="todaysWinnerOfTheDay">\s*(\w+)\s*(\w\.)\s*\([0-9\*]+\),\s*(\w+)\s*<\/strong>/', $seite, $matches);

$vorname = $matches[1];
$nachnameErsterBuchstabeMitPunkt = $matches[2];
$land = $matches[3];

foreach ($kunden as $kunde) {
	if ($kunde->firstname == $vorname &&
		$kunde->nachname_erster_buchstabe_mit_punkt == $nachnameErsterBuchstabeMitPunkt
	) {
		echo "bet-at-home Gewinner des Tages ist: \n\n";
		print_r($kunde);
	}
}

// echo "bet-at-home Gewinner des Tages ist: \n\n";
// echo trim($matches[1]) . " " . trim($matches[2]) . "\n";
