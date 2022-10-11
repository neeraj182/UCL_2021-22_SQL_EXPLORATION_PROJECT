
-- FROM TABLE defending
SELECT *
FROM defending;

-- Selecting only the names of the club
SELECT DISTINCT(club)
FROM defending;

-- Counting the no. of clubs and no. of players
SELECT COUNT(DISTINCT(club)) as club_count, COUNT(player_name) as player_count
FROM defending;

-- selecting only top 10 clubs with most players in the table
SELECT COUNT(player_name), club
FROM defending 
GROUP BY club
ORDER BY COUNT(player_name) DESC 
LIMIT 10;

SELECT DISTINCT(POSITION)
FROM defending ;

SELECT COUNT(position), position
FROM defending
GROUP by POSITION;

--Selecting top 10 players with most balls recovered 
SELECT player_name, club, POSITION, balls_recoverd, match_played 
FROM defending 
ORDER BY balls_recoverd DESC 
LIMIT 10;

--Selecting top 10 players with most tackles won
SELECT player_name, club, POSITION, tackles, t_won, match_played
FROM defending 
ORDER BY t_won DESC 
LIMIT 10;

--Selecting top 10 players with most clearances attempted
SELECT player_name, club, position, clearance_attempted, match_played
FROM defending 
ORDER BY clearance_attempted DESC 
LIMIT 10;


-- Total no. of balls recovered, tackles, tackles won, tackles lost, clearance attempted
SELECT SUM(balls_recoverd) as Total_balls_recovered,
SUM(tackles) as Total_tackles, SUM(t_won) as Total_tackles_won, SUM(t_lost) as Total_tackles_lost, SUM(clearance_attempted) as Total_clearance_attempted
FROM defending; 

--Calculating Total no. of balls recovered, tackles, tackles won, tackles lost, clearance attempted by a club in the league.
SELECT club, SUM(balls_recoverd) as Total_balls_recovered,
SUM(tackles) as Total_tackles, SUM(t_won) as Total_tackles_won, SUM(t_lost) as Total_tackles_lost, SUM(clearance_attempted) as Total_clearance_attempted
FROM defending 
GROUP BY club 
ORDER BY SUM(balls_recoverd) DESC, SUM(t_won) DESC;

--Selecting players of a particular club from table
SELECT *
FROM defending 
WHERE club = 'Real Madrid' ;


SELECT *, (balls_recoverd / match_played) as avg_balls_recoverd_per_match, (tackles / match_played) as avg_tackle_per_match,
(t_won / match_played) as avg_tackleWon_per_match, (clearance_attempted / match_played) as avg_clearaneAttempted_per_match
FROM defending;



-- FROM TABLE attacking


































