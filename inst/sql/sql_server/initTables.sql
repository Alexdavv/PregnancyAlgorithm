IF OBJECT_ID('@resultsDatabaseSchema.FirstOutcomeEvent', 'U') IS NOT NULL
  DROP TABLE @resultsDatabaseSchema.FirstOutcomeEvent;

IF OBJECT_ID('@resultsDatabaseSchema.pregnancy_episodes', 'U') IS NOT NULL
  DROP TABLE @resultsDatabaseSchema.pregnancy_episodes;

IF OBJECT_ID('@resultsDatabaseSchema.pregnancy_concepts', 'U') IS NOT NULL
  DROP TABLE @resultsDatabaseSchema.pregnancy_concepts;

IF OBJECT_ID('@resultsDatabaseSchema.outcome_limit', 'U') IS NOT NULL
  DROP TABLE @resultsDatabaseSchema.outcome_limit;

IF OBJECT_ID('@resultsDatabaseSchema.term_durations', 'U') IS NOT NULL
  DROP TABLE @resultsDatabaseSchema.term_durations;

IF OBJECT_ID('@resultsDatabaseSchema.gest_est', 'U') IS NOT NULL
  DROP TABLE @resultsDatabaseSchema.gest_est;

--HINT DISTRIBUTE_ON_KEY(PERSON_ID)
CREATE TABLE @resultsDatabaseSchema.pregnancy_episodes
(
	PERSON_ID bigint not null,
	EPISODE_START_DATE datetime not null,
	EPISODE_END_DATE datetime not null,
	START_METHOD varchar(255) not null,
	ORIGINAL_OUTCOME varchar(255) not null,
	EPISODE int not null,
	OUTCOME varchar(255) not null,
	EPISODE_LENGTH int
)
;

CREATE TABLE @resultsDatabaseSchema.pregnancy_concepts
(
	concept_id int not null,
	category varchar(255) null,
	data_value varchar(255) not null,
	gest_value int null
)
;

CREATE TABLE @resultsDatabaseSchema.outcome_limit
(
	outcome_limit_id int not null,
	first_preg_category nchar(10) not null,
	outcome_preg_category nchar(10) not null,
	min_days int not null
)
;

CREATE TABLE @resultsDatabaseSchema.term_durations
(
	category varchar(50),
	max_term int,
	min_term int,
	retry int
)
;

CREATE TABLE @resultsDatabaseSchema.gest_est
(
  gest_est_id int,
	category varchar(50),
	PreTerm int,
	PostTerm int,
	FullTerm int,
	NoData int
)
;