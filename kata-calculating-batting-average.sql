SELECT y.player_name, y.games, CAST(ROUND(CAST(y.hits AS DECIMAL) / y.at_bats, 3) AS varchar(255)) AS batting_average

FROM yankees AS y

WHERE y.at_bats > 99

ORDER BY batting_average DESC