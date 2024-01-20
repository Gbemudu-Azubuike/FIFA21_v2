-- Visually inspecting the raw data

	select top 10 *
	from [Portfolio Project 2024]..Fifa21_V2;

--	Taking a look at the column names and data types

	select c.name as column_name,t.name as data_type
	from sys.columns c
	inner join sys.types t on
	c.user_type_id = t.system_type_id
	where c.object_id =  object_id('Fifa21_v2')
	order by c.name;

--	 Or we use the below query

	exec sp_help '[Portfolio Project 2024]..Fifa21_v2';

--	View Number of Rows

	select count (*) as Number_of_Rows
	from [Portfolio Project 2024]..Fifa21_V2;

--	number of columns
	
	select COUNT(*) as Number_of_Columns
	from INFORMATION_SCHEMA.COLUMNS
	where table_name = 'Fifa21_v2';

-- Checking for Duplicates

	Select   Name, Longname, Nationality, Age, Club, COUNT (*) as Count_of_Duplicate
	from [Portfolio Project 2024]..Fifa21_V2
	group by Name, Longname, Nationality, Age, Club
	having COUNT(*) > 1;

-- Verifying the duplicate found in the above query

	SELECT LongName, Age, Club, Nationality, Contract
	FROM [Portfolio Project 2024]..Fifa21_V2
	WHERE LongName = 'Peng Wang' AND Age = 27;

--	CHecking for Null Values

	select 
	sum (case when Name is null then 1 else 0 end) as Name_null_count,
	sum (case when LongName is null then 1 else 0 end) as Longname_null_count,
	sum (case when Club is null then 1 else 0 end) as Club_null_count,
	sum (case when Nationality is null then 1 else 0 end) as Nationality_null_count
	from [Portfolio Project 2024]..Fifa21_V2;


-- Renaming Columns to provide better description

	exec sp_rename 'Fifa21_v2.LongName', 'Full_Name';
	exec sp_rename 'fifa21_v2.â†“OVA', 'Overall_Rating';
	exec sp_rename 'Fifa21_v2.W/F', 'Weak_Foot';
	exec sp_rename 'Fifa21_v2.SM', 'Skill_Move';
	exec sp_rename 'Fifa21_v2.A/W', 'Attacking_Workrate';
	exec sp_rename 'Fifa21_v2.D/W', 'Defensive_Workrate';
	exec sp_rename 'Fifa21_v2.IR', 'International_Reputation';
	exec sp_rename 'Fifa21_v2.POT', 'Potential_Rating';
	exec sp_rename 'Fifa21_v2.BOV', 'Best_Overall_Rating';
	exec sp_rename 'Fifa21_v2.Value', 'Value_in_$';
	exec sp_rename 'Fifa21_v2.Wage', 'Wage_in_$';
	exec sp_rename 'Fifa21_v2.[Release Clause]', 'Release_Clause_In_$';

-- Replacing Special characters in the Full_names column

	UPDATE [Portfolio Project 2024]..Fifa21_V2
	SET Full_Name = SUBSTRING(playerUrl, CHARINDEX('/', playerUrl, 30) + 1, 
	CHARINDEX('/', playerUrl, CHARINDEX('/', playerUrl, 30) + 1) - CHARINDEX('/', playerUrl, 30) - 1);

-- Trimming the club column
	
	update [Portfolio Project 2024]..FIFA21_V2
	set Club = LTRIM(Club);

-- Replacing 'â‚¬' with $ in the Value, Wage and Release Clause column using Replace function

	Update [Portfolio Project 2024]..Fifa21_V2
	set Value_in_$ = REPLACE(Value_in_$, 'â‚¬','');

	Update [Portfolio Project 2024]..Fifa21_V2
	set Wage_in_$ = REPLACE(Wage_in_$, 'â‚¬','$');

	Update [Portfolio Project 2024]..Fifa21_V2
	set Release_Clause_In_$ = REPLACE(Release_Clause_In_$, 'â‚¬','$');


-- Replacing â˜… with 'Star' in the Weak_Foot, Skill_Move and International_Reputation Column

	update [Portfolio Project 2024]..Fifa21_V2
	set weak_Foot = replace (weak_foot, 'â˜…', 'Star');

	update [Portfolio Project 2024]..Fifa21_V2
	set Skill_Move = replace (Skill_Move, 'â˜…', 'Star');

	update [Portfolio Project 2024]..Fifa21_V2
	set International_Reputation = replace (International_Reputation, 'â˜…', 'Star');

-- Cleaning the Club column by replacing special characters with its appropriate characters
	
	update [Portfolio Project 2024]..FIFA21_V2
	set Club = REPLACE (Club, 'Ã¶', 'ö');

	update [Portfolio Project 2024]..FIFA21_V2
	set Club = REPLACE (Club, 'Ã¼', 'ü');

	update [Portfolio Project 2024]..FIFA21_V2
	set Club = REPLACE (Club, 'Ã‰', 'É');

	update [Portfolio Project 2024]..FIFA21_V2
	set Club = REPLACE (Club, 'Ã©', 'é');

	update [Portfolio Project 2024]..FIFA21_V2
	set Club = REPLACE (Club, 'Ã‡', 'Ç');
	
	update [Portfolio Project 2024]..FIFA21_V2
	set Club = REPLACE (Club, 'Ã¦', 'æ');
	
	update [Portfolio Project 2024]..FIFA21_V2
	set Club = REPLACE (Club, 'ÅŸ', 'ş');

	update [Portfolio Project 2024]..FIFA21_V2
	set Club = REPLACE (Club, 'Å„', 'ń');

	update [Portfolio Project 2024]..FIFA21_V2
	set Club = REPLACE (Club, 'Ã¡', 'á');

	update [Portfolio Project 2024]..FIFA21_V2
	set Club = REPLACE (Club, 'Å‚', 'ł');

	update [Portfolio Project 2024]..FIFA21_V2
	set Club = REPLACE (Club, 'Ã³', 'ó');

	update [Portfolio Project 2024]..FIFA21_V2
	set Club = REPLACE (Club, 'Ã¤', 'ä');

	update [Portfolio Project 2024]..FIFA21_V2
	set Club = REPLACE (Club, 'Ã¸', 'ø');

	update [Portfolio Project 2024]..FIFA21_V2
	set Club = REPLACE (Club, 'Ã±', 'ñ');

	update [Portfolio Project 2024]..FIFA21_V2
	set Club = REPLACE (Club, 'Ã­', 'í');

	update [Portfolio Project 2024]..FIFA21_V2
	set Club = REPLACE (Club, 'Ã®', 'î');

	update [Portfolio Project 2024]..FIFA21_V2
	set Club = REPLACE (Club, 'Ã–', 'Ö');

	update [Portfolio Project 2024]..FIFA21_V2
	set Club = REPLACE (Club, 'Ã­', 'í');

	update [Portfolio Project 2024]..FIFA21_V2
	set Club = REPLACE (Club, 'Ã§', 'ç');

	update [Portfolio Project 2024]..FIFA21_V2
	set Club = REPLACE (Club, 'Ãª', 'ê');

	update [Portfolio Project 2024]..FIFA21_V2
	set Club = REPLACE (Club, 'Ã¥', 'å');

	update [Portfolio Project 2024]..FIFA21_V2
	set Club = REPLACE (Club, 'Ã£', 'ã');

	update [Portfolio Project 2024]..FIFA21_V2
	set Club = REPLACE (Club, 'lÄ™', 'łę');

	update [Portfolio Project 2024]..FIFA21_V2
	set Club = REPLACE (Club, 'Ãº', 'ú');

	update [Portfolio Project 2024]..FIFA21_V2
	set Club = REPLACE (Club, 'Ä™', 'ę');

	update [Portfolio Project 2024]..FIFA21_V2
	set Club = REPLACE (Club, 'Åˆ', 'ň');

	update [Portfolio Project 2024]..FIFA21_V2
	set Club = REPLACE (Club, 'È™', 'ș');

	update [Portfolio Project 2024]..FIFA21_V2
	set Club = REPLACE (Club, 'Ã¢', 'â');

	update [Portfolio Project 2024]..FIFA21_V2
	set Club = REPLACE (Club, 'Ã¨', 'è');

	update [Portfolio Project 2024]..FIFA21_V2
	set Club = REPLACE (Club, '?', 'ș');


-- Replacing special character '~' with '-' in the Contract Column

	select distinct Contract
	from [Portfolio Project 2024]..Fifa21_V2
	order by Contract	asc

	update [Portfolio Project 2024]..Fifa21_V2
	set Contract = replace (Contract, '~','-');

-- Capitalizing First Letter of Names in the Full_Name Column

	update [Portfolio Project 2024]..Fifa21_V2
	set Full_Name = upper(substring(Full_Name,1,1)) + LOWER(SUBSTRING(Full_Name,2,len(Full_Name)));

-- Converting The Wages_in_$, Value_in_$ and Release_Clause_In_$


	UPDATE [Portfolio Project 2024]..FIFA21_v2
	SET Value_in_$ = CASE
    WHEN Value_in_$  LIKE '%M' THEN TRY_CONVERT(DECIMAL(10,2), REPLACE(REPLACE(Value_in_$, '€', ''), 'M', '')) * 1000000
    WHEN Value_in_$ LIKE '%K' THEN TRY_CONVERT(DECIMAL(10,2), REPLACE(REPLACE(Value_in_$, '€', ''), 'K', '')) * 1000
    ELSE Value_in_$
	END;


	-- Wages


	UPDATE [Portfolio Project 2024]..FIFA21_v2
	SET Wage_in_$ = CASE
    WHEN Wage_in_$ LIKE '%M' THEN TRY_CONVERT(DECIMAL(10,2), REPLACE(REPLACE(Wage_in_$, '$', ''), 'M', '')) * 1000000
    WHEN Wage_in_$ LIKE '%K' THEN TRY_CONVERT(DECIMAL(10,2), REPLACE(REPLACE(Wage_in_$, '$', ''), 'K', '')) * 1000
    WHEN Wage_in_$ LIKE '$%' THEN TRY_CONVERT(DECIMAL(10,2), REPLACE(Wage_in_$, '$', ''))
    ELSE Wage_in_$
	END;

	
	-- Release_Clause

	select Release_Clause_In_$,  CASE
    WHEN Release_Clause_In_$ LIKE '$%' AND Release_Clause_In_$ LIKE '%M' THEN TRY_CONVERT(DECIMAL(10,2), REPLACE(REPLACE(Release_Clause_In_$, '$', ''), 'M', '')) * 1000000
    WHEN Release_Clause_In_$ LIKE '$%' AND Release_Clause_In_$ LIKE '%K' THEN TRY_CONVERT(DECIMAL(10,2), REPLACE(REPLACE(Release_Clause_In_$, '$', ''), 'K', '')) * 1000
    WHEN Release_Clause_In_$ LIKE '$%' THEN TRY_CONVERT(DECIMAL(10,2), REPLACE(Release_Clause_In_$, '$', ''))
    ELSE Release_Clause_In_$
	END
	from [Portfolio Project 2024]..FIFA21_V2

	UPDATE [Portfolio Project 2024]..FIFA21_v2
	SET Release_Clause_In_$ = CASE
    WHEN Release_Clause_In_$ LIKE '$%' AND Release_Clause_In_$ LIKE '%M' THEN TRY_CONVERT(DECIMAL(10,2), REPLACE(REPLACE(Release_Clause_In_$, '$', ''), 'M', '')) * 1000000
    WHEN Release_Clause_In_$ LIKE '$%' AND Release_Clause_In_$ LIKE '%K' THEN TRY_CONVERT(DECIMAL(10,2), REPLACE(REPLACE(Release_Clause_In_$, '$', ''), 'K', '')) * 1000
    WHEN Release_Clause_In_$ LIKE '$%' THEN TRY_CONVERT(DECIMAL(10,2), REPLACE(Release_Clause_In_$, '$', ''))
    ELSE Release_Clause_In_$
	END;

----- Converting Wage_IN_$, Release_Clause_In_$, Value_In_$ to I


	UPDATE [Portfolio Project 2024]..FIFA21_V2
	SET Value_in_$ = CONVERT(INT, CONVERT(FLOAT, Value_in_$));

	UPDATE [Portfolio Project 2024]..FIFA21_V2
	SET Wage_in_$ = CONVERT(INT, CONVERT(FLOAT, Wage_in_$));

	UPDATE [Portfolio Project 2024]..FIFA21_V2
	SET Release_Clause_In_$ = CONVERT(INT, CONVERT(FLOAT, Release_Clause_In_$));

-- Converting Age, Overall_Rating, Potential_Rating to Tiny_Int
	
	update [Portfolio Project 2024]..FIFA21_V2
	set Age = CAST (age as int);

	update [Portfolio Project 2024]..FIFA21_V2
	set Overall_Rating = cast (Overall_Rating as tinyint);

--- Changing column data types to appropriate one
	ALTER TABLE fifa21_v2
	ALTER COLUMN Value_in_$ bigint;

	ALTER TABLE fifa21_v2
	ALTER COLUMN Wage_in_$ int;

	ALTER TABLE fifa21_v2
	ALTER COLUMN Release_Clause_in_$ int;

-- Drop Irrelevant Columns

	alter table [Portfolio project 2024]..Fifa21_v2
	drop column PhotoUrl;

	alter table [Portfolio project 2024]..Fifa21_v2
	drop column Playerurl;




-- Data Analysis
	--Key Business Objectives:

--Player Performance and Value Assessment:
	--Identify most valuable players based on attributes and potential.
	--Analyze performance trends by position, age, nationality, etc.
	--Predict future player performance and value.

--Team Building and Tactics.
	--Optimize team composition for different formations and playstyles.
	--Discover hidden gems and undervalued players.
	--Analyze team strengths and weaknesses.
	--Develop effective transfer strategies.

--Scouting and Recruitment:

	--Identify promising young talents for future development.
	--Target players who fit specific team needs and styles.
	--Predict transfer market trends and values.



-- SQL Queries

--Player Performance and Value Assessment:	
-- Top players by overall rating and value
	SELECT Name, Overall_Rating, Potential_Rating, Value_in_$, Age, Positions, Nationality
	FROM [Portfolio Project 2024]..Fifa21_V2
	ORDER BY Overall_rating DESC, Value_in_$ DESC; 


-- Average ratings and values by position
	SELECT positions, AVG(Overall_Rating) as Average_Overall_Rating, AVG(age) as Average_Age, AVG(Value_in_$) as AVG_Value_In_$
	FROM [Portfolio Project 2024]..Fifa21_V2
	GROUP BY Positions;


-- Top nationalities by player count and average rating
	SELECT Nationality, COUNT(*) as Number_of_Players, AVG(Overall_Rating) as Average_Overall_Rating
	FROM [Portfolio Project 2024]..FIFA21_v2
	GROUP BY Nationality
	HAVING COUNT(*) >= 10
	order by Average_Overall_Rating desc;

--Team Building and Tactics.

	-- Top teams by average rating and total value
	SELECT Club, AVG(Overall_Rating) AS Average_Rating, SUM(Value_in_$) AS Total_Value
	FROM [Portfolio Project 2024]..FIFA21_V2
	GROUP BY Club
	ORDER BY Average_Rating DESC, Total_Value DESC;

	-- Team roster sizes and position diversity
	SELECT Club, COUNT(*) AS PlayerCount, COUNT(DISTINCT Positions) AS Position_Count
	FROM [Portfolio Project 2024]..FIFA21_V2
	GROUP BY club; 

	-- Player counts by position within each team
	SELECT club, Positions, COUNT(*) as Player_Count_by_Position
	FROM [Portfolio Project 2024]..FIFA21_V2
	GROUP BY Club, Positions
	ORDER BY Club, Positions; 

	-- Affordable high-rated strikers
	SELECT full_name, Overall_Rating, Value_in_$, Positions, Club
	FROM [Portfolio Project 2024]..FIFA21_V2
	WHERE Positions = 'ST' AND Overall_Rating >= 85 AND Value_in_$ <= 50000000; 

	

--Scouting and Recruitment:	
		
	-- Promising young players with high potential
	SELECT Full_Name, Overall_Rating, Potential_Rating, Value_in_$, Age
	FROM [Portfolio Project 2024]..FIFA21_v2
	WHERE Age <= 23 AND Potential_Rating >= 85
	order by Potential_Rating desc;
	
	-- Young players with high potential and low value
	SELECT Full_Name, Overall_Rating, Potential_Rating, Value_in_$, Age, Positions, Nationality
	FROM [Portfolio Project 2024]..FIFA21_v2
	WHERE Age <= 21 AND Potential_Rating >= 80 AND Value_in_$ <= 10000000;


	-- Potential defensive signings from other teams
	SELECT Full_Name, Overall_Rating, Potential_Rating, Value_in_$, Age, Positions, Club
	FROM [Portfolio Project 2024]..FIFA21_V2
	WHERE Positions = 'CB' AND Overall_Rating >= 75 AND Value_in_$ <= 20000000;

	-- Potential defensive Midfield signings from other teams
	SELECT Full_Name, Overall_Rating, Potential_Rating, Value_in_$, Age, Positions, Club
	FROM [Portfolio Project 2024]..FIFA21_V2
	WHERE Positions = 'CDM' AND Overall_Rating >= 75 AND Value_in_$ <= 20000000;

