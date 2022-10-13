USE new_database

-- Joining assists, goals and disciplinary tables
SELECT a.player_name, a.club, a.position, goals, assists,
(assists + goals) as goals_and_assists, minutes_played, g.match_played 
FROM attacking as a
INNER JOIN goals as g 
USING (player_name)
INNER JOIN disciplinary as dp 
USING (player_name)
ORDER BY goals_and_assists DESC, goals DESC
LIMIT 10; 

ALTER TABLE defenders 
RENAME COLUMN match_player TO match_played

SELECT df.player_name, df.club, df.position, pass_completed, balls_recovered,
t_won, fouls_committed, fouls_suffered, red, minutes_played, df.match_played
FROM defenders as df
INNER JOIN distributon as d 
USING (player_name)
INNER JOIN disciplinary as dp 
USING (player_name)
ORDER BY pass_completed DESC 
LIMIT 10;

SELECT a.player_name, a.club, a.position, a.assists, pass_completed,
cross_attempted, cross_completed, fouls_committed, fouls_suffered, minutes_played, a.match_played
FROM attacking as a
INNER JOIN distributon as d 
USING (player_name)
INNER JOIN disciplinary as dp
USING (player_name)
ORDER BY assists DESC 
LIMIT 10;

SELECT a.position, SUM(a.assists), SUM(pass_completed),
SUM(cross_attempted), SUM(cross_completed), SUM(fouls_committed), SUM(fouls_suffered)
FROM attacking as a
INNER JOIN distributon as d 
USING (player_name)
INNER JOIN disciplinary as dp
USING (player_name)
GROUP BY position
ORDER BY SUM(a.assists) DESC;




