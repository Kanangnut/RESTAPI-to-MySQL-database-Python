#top_scorers
SELECT 
	`top_scorers`.`position`,
    `top_scorers`.`player`,
    `top_scorers`.`club`,
    `top_scorers`.`total_goals`,
    `top_scorers`.`penalty_goals`,
    `top_scorers`.`assists`,
    `top_scorers`.`matches`,
    `top_scorers`.`mins`,
    `top_scorers`.`age`
FROM 
	`football_stats`.`top_scorers`
ORDER BY 
	`top_scorers`.`total_goals` DESC,
	`top_scorers`.`assists`DESC;

#Players with the highest goal-to-minute ratio
SELECT 
    `player`,
    `club`,
    `total_goals`,
    `mins`,
    ROUND((`total_goals` / NULLIF(`mins`, 0)), 4) AS goals_per_minute
FROM 
    `football_stats`.`top_scorers`
WHERE 
    `mins` > 0
ORDER BY 
    goals_per_minute DESC
LIMIT 10;

#Players with the most assists
SELECT 
    `player`,
    `club`,
    `assists`,
    `matches`,
    ROUND((`assists` / NULLIF(`matches`, 0)), 2) AS assists_per_match
FROM 
    `football_stats`.`top_scorers`
WHERE 
    `matches` > 0
ORDER BY 
    assists_per_match DESC,
    `matches` ASC
LIMIT 10;

#Age distribution among top goal scorers
SELECT 
    `age`,
    COUNT(*) AS number_of_players
FROM 
    `football_stats`.`top_scorers`
GROUP BY 
    `age`
ORDER BY 
    `age`;