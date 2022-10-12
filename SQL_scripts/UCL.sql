USE new_databse;

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

-- From attacking Table
SELECT *
FROM attacking 
LIMIT 5;

SELECT COUNT(player_name)
FROM attacking;

-- calculating total assists, total corners, total offsides, total dribbles by a club in the league
SELECT club, SUM(assists) as Total_assists,
SUM(corner_taken) as Total_corners,
SUM(offsides) as Total_offsides,
SUM(dribbles) as Total_driblles
FROM attacking 
GROUP BY club 
ORDER BY SUM(assists) DESC; 

-- no. of players of each club in the table
SELECT club, COUNT(club) as No_of_players
FROM attacking 
GROUP BY club
ORDER BY COUNT(club) DESC ;

-- avg dribble of a player in a match, top 10
SELECT *, (dribbles/match_played) as avg_dribble_per_match
FROM attacking 
ORDER BY dribbles DESC 
LIMIT 10;

-- calculating total sum of each column
SELECT POSITION, SUM(assists), SUM(corner_taken), SUM(dribbles)
FROM attacking
GROUP BY position
ORDER BY SUM(assists) DESC;

-- FROM distributon Table 

SELECT *
FROM distributon 
LIMIT 5;

ALTER TABLE distributon 
RENAME COLUMN cross_complted TO cross_completed;

SELECT club, COUNT(club)
FROM distributon 
GROUP by club
ORDER BY COUNT(club) DESC;

-- Individual club stats
SELECT club, SUM(pass_attempted) as Total_pass_attempted,
SUM(pass_completed) as Total_pass_completed,
SUM(cross_attempted) as Total_cross_attempted,
SUM(cross_completed) as Total_cross_completed,
SUM(freekicks_taken) as Total_freeKicks_taken
FROM distributon
GROUP BY club 
ORDER BY SUM(pass_attempted) DESC, SUM(pass_completed) DESC;

-- total sum of column
SELECT SUM(pass_attempted) as Total_pass_attempted, 
SUM(pass_completed) as Total_pass_completed,
SUM(cross_attempted) as Total_cross_attempted,
SUM(cross_completed) as Total_cross_completed,
SUM(freekicks_taken) as Total_freeeKicks_taken
FROM distributon;

-- TOP 10
SELECT club, player_name, position, pass_attempted, pass_completed, match_played
FROM distributon 
ORDER BY pass_completed DESC
LIMIT 10;

SELECT club, player_name, position, cross_attempted , cross_completed , match_played
FROM distributon 
ORDER BY cross_completed  DESC
LIMIT 10;

SELECT player_name, club, POSITION, freekicks_taken, match_played
FROM distributon 
ORDER BY freekicks_taken DESC 
LIMIT 10;

SELECT club, player_name, position, pass_attempted, pass_completed, match_played,
ROUND((pass_completed / match_played), 0) as passCompleted_per_match
FROM distributon 
ORDER BY pass_completed DESC
LIMIT 10;

SELECT player_name, club, position, cross_attempted, cross_completed, match_played,
ROUND((cross_completed/match_played), 0) as crossCompleted_per_match
FROM distributon
ORDER BY cross_completed DESC 
LIMIT 10;

-- Positional Stats
SELECT POSITION, SUM(pass_attempted) AS Total_pass_attempted, 
SUM(pass_completed) as Total_pass_completed, 
SUM(cross_attempted) as Total_cross_attempted, 
SUM(cross_completed) as Total_cross_completed, 
ROUND(AVG(pass_accuracy), 2) as Avg_pass_accuracy, ROUND(AVG(cross_accuracy), 2) as Avg_cross_accuracy
FROM distributon 
GROUP BY position
ORDER BY SUM(pass_completed) DESC;

-- From Goals Table
SELECT *
FROM goals
LIMIT 5;

SELECT club, COUNT(club)
FROM goals 
GROUP BY club
ORDER BY COUNT(club) DESC;

-- Individual club stats
SELECT club, SUM(goals) as Total_goasl_club,
SUM(penalties) as Total_penalties_club
FROM goals
GROUP BY club
ORDER BY SUM(goals) DESC, SUM(penalties) DESC ;

-- total sum of columns
SELECT SUM(goals) as Total_goals,
SUM(right_foot) as Total_goalsFrom_right_Foot,
SUM(left_foot) as Total_goalsFrom_left_Foot,
SUM(headers) as Total_goalsFrom_headers,
SUM(inside_area) as Total_goalsFrom_insideArea,
SUM(outside_area) as Total_goalsFrom_outsieArea,
SUM(penalties) as Total_goalsFrom_penalties
FROM goals;

-- TOP 10
SELECT player_name, club, POSITION, goals, right_foot, match_played
FROM goals
ORDER BY right_foot DESC, goals DESC
LIMIT 10;

SELECT player_name, club, POSITION, goals, left_foot, match_played
FROM goals
ORDER BY left_foot DESC, goals DESC
LIMIT 10;

SELECT player_name, club, POSITION, goals, headers, match_played
FROM goals
ORDER BY headers DESC, goals DESC
LIMIT 10;

SELECT player_name, club, POSITION, goals, inside_area , match_played
FROM goals
ORDER BY inside_area DESC, goals DESC
LIMIT 10;

SELECT player_name, club, POSITION, goals, outside_area , match_played
FROM goals
ORDER BY outside_area DESC, goals DESC
LIMIT 10;

SELECT player_name, club, POSITION, goals, penalties, match_played
FROM goals
ORDER BY penalties DESC, goals DESC
LIMIT 10;

-- Positional stats
SELECT POSITION, SUM(goals) as Total_goals,
SUM(right_foot) as Total_rightFoot_goals, SUM(left_foot) as Total_leftFoot_goals,
SUM(headers) as Total_header_goals,
SUM(inside_area) as Total_goals_insideArea, SUM(outside_area) as Total_goals_outsideArea,
SUM(penalties) as Total_penalties
FROM goals
GROUP BY position
ORDER BY SUM(goals) DESC;

-- FROM disciplinary table
SELECT *
FROM disciplinary 
LIMIT 5;

SELECT club, COUNT(club)
FROM disciplinary 
GROUP BY club
ORDER BY COUNT(club) DESC;

-- club stats
SELECT club, SUM(fouls_committed) as Total_fouls_committed,
SUM(fouls_suffered) as Total_fouls_suffered,
SUM(yellow) as Total_yellowCards,
SUM(red) as Total_redCards
FROM disciplinary 
GROUP BY club
ORDER BY SUM(fouls_committed) DESC, SUM(fouls_suffered) DESC;


SELECT club,  SUM(fouls_committed) as Total_fouls_commited
FROM disciplinary 
GROUP BY club
ORDER BY SUM(fouls_committed) DESC 
LIMIT 10;


SELECT club,  SUM(fouls_suffered) as Total_fouls_suffered
FROM disciplinary 
GROUP BY club
ORDER BY SUM(fouls_suffered) DESC 
LIMIT 10;

SELECT club, SUM(fouls_committed) as Total_fouls_committed,
SUM(fouls_suffered) as Total_fouls_suffered,
SUM(yellow) as Total_yellowCards,
SUM(red) as Total_redCards
FROM disciplinary 
WHERE club = 'Man. City'
GROUP BY club
ORDER BY SUM(fouls_committed) DESC, SUM(fouls_suffered) DESC;

-- Positional Stats

SELECT position, SUM(fouls_committed) as Total_fouls_committed,
SUM(fouls_suffered) as Total_fouls_suffered,
SUM(yellow) as Total_yellowCards,
SUM(red) as Total_redCards
FROM disciplinary 
GROUP BY position
ORDER BY SUM(fouls_committed) DESC, SUM(fouls_suffered) DESC;

-- TOP 10
SELECT player_name, club, position, fouls_committed, minutes_played, match_played, ROUND((fouls_committed/match_played)) as Fouls_committed_per_match 
FROM disciplinary
ORDER BY fouls_committed DESC
LIMIT 10;

SELECT player_name, club, position, fouls_suffered, minutes_played, match_played, ROUND((fouls_suffered /match_played)) as Fouls_suffered_per_match
FROM disciplinary
ORDER BY fouls_suffered  DESC
LIMIT 10;

SELECT player_name, club, minutes_played, match_played
FROM disciplinary 
ORDER BY minutes_played DESC 
LIMIT 10;

SELECT player_name, club, minutes_played, match_played
FROM disciplinary 
WHERE minutes_played >= 1000
ORDER BY minutes_played DESC;

SELECT player_name, club, red, match_played
FROM disciplinary
ORDER BY red DESC 
LIMIT 10;

-- END
